%include "../../../nops.inc"

%define repeat0  1              ; Number of repetitions of whole test. Default = 8
%define repeat1  1000           ; Repeat count for loop around testcode.
%define repeat2  1              ; Repeat count for repeat macro around testcode.
%define noptype  2

; ---------------------------------------------------------------------------
; BTB port of IBP experiment 10 (write-once-read-many).
;
; We write ONE target into a BTB entry under speculation (Step 3) and then
; READ it back MANY times (Step 4 loop) through a *different* branch that
; aliases the injector only in the BTB (same PC[23:0] of the branch), never
; in the IBP (deliberately different PHR via SET_PHR).
;
; The injector and reader indirect branches are both `jmp r10` and are pinned
; (via a `times` pad before an identical r11-relative tail) so that, when
; speculative_jump=1, they land at the SAME PC[23:0] and therefore share one
; BTB entry.  The BTB stores only a 32-bit target, so the reader (high16 =
; 0x0001) reconstructs the injector's low-32 target (0x02032033) as
; {0x0001}:{0x02032033} = 0x102032033 and speculatively fetches the probe we
; placed there (reader_probe).  We measure whether that probe line is cached
; after the last of the many reads.
;
; NOTE on addressing: the reader lives at 0x100000000 (> 4 GiB).  Under
; -mcmodel=large a 32-bit displacement to .data would overflow its relocation,
; so every data access goes through r11 (= &UserData, a 32-bit immediate that
; fits because .data is low).  The tail is byte-for-byte identical in both
; sections, which is what makes the two `jmp r10` instructions align.
; ---------------------------------------------------------------------------

; Pinned offset (within each pinned section) at which the identical tail begins.
; Both pinned section bases have PC[23:0]=0, so pinning the tail to the same
; offset aligns the two indirect branches on PC[23:0].
%define TAIL_OFF_ALIGNED    0x2F000     ; collision    (speculative_jump=1)
%define TAIL_OFF_MISALIGNED 0x27000     ; no collision (speculative_jump=0)

; Low-32 landing offsets inside the injector section (base 0x2000000):
%define BENIGN_OFF     0x31033          ; -> abs 0x2031033 (Step 1, benign)
%define MALICIOUS_OFF  0x32033          ; -> abs 0x2032033 (Step 3, written once)

; Pointer-chain cells and scratch offsets inside UserData.
%define CHAIN0_OFF     256              ; head of the 3-level chain
%define CHAIN1_OFF     264
%define CHAIN2_OFF     272
%define TARGET_OFF     128              ; indirect-branch target pointer
%define COND_OFF       0               ; conditional value (0/1)
%define COUNTER_OFF    1536             ; read-loop counter
%define PROBE_DATA_OFF 2048             ; data touched by the speculative gadget

; How many times we write (Step 3) and read (Step 4).
%ifndef write_count
    %define write_count 4
%endif
%ifndef mistrain_count
    %define mistrain_count 10
%endif
%ifndef read_count
    %define read_count 100
%endif

%macro testinitc 0              ; Macro to call in each test before reading counters.
    mov dword[PrintCustomPMC], 1

    ; Build a 3-level pointer chain inside UserData so the injector can widen
    ; its misprediction window by flushing the chain (chain is deeper than the
    ; target load, so the indirect branch resolves -> updates the BTB -> before
    ; the conditional resolves and squashes).
    lea rax, [UserData + CHAIN1_OFF]
    mov [UserData + CHAIN0_OFF], rax
    lea rax, [UserData + CHAIN2_OFF]
    mov [UserData + CHAIN1_OFF], rax
    lea rax, [UserData + COND_OFF]
    mov [UserData + CHAIN2_OFF], rax

    mov qword[UserData + COND_OFF], 0
    mfence
    SERIALIZE
%endmacro

%macro testcode 0

    ; -----------------------------------------------------------------------
    ; Step 1 - Train the injector architecturally.
    ;   conditional biased NOT-taken; indirect branch -> BENIGN target.
    ;   Allocates the shared BTB entry with low-32 = 0x02031033.
    ; -----------------------------------------------------------------------
    %rep 100
        lea rax, [target_ibranch_injection]
        mov [UserData + TARGET_OFF], rax
        mov qword[UserData + COND_OFF], 0
        SERIALIZE_OPT
        call start_spec_injection
    %endrep

    SERIALIZE_OPT

    ; -----------------------------------------------------------------------
    ; Step 3 - Speculatively OVERWRITE the BTB entry (write once).
    ;   COND=1 so the conditional should be TAKEN, but it was biased NOT-taken
    ;   in Step 1 -> misprediction opens a window in which the indirect branch
    ;   resolves to the MALICIOUS target (low-32 0x02032033) and updates the
    ;   BTB entry.  Architecturally the indirect branch is never reached, so
    ;   this is a pure speculative write.  The flushed chain widens the window.
    ; -----------------------------------------------------------------------
    %rep write_count
        lea rax, [malicious_target_inj]
        mov [UserData + TARGET_OFF], rax
        mov qword[UserData + COND_OFF], 1
        clflush [UserData + COND_OFF]
        clflush [UserData + CHAIN0_OFF]
        clflush [UserData + CHAIN1_OFF]
        clflush [UserData + CHAIN2_OFF]
        clflush [UserData + TARGET_OFF]
        SERIALIZE_OPT
        call start_spec_injection
    %endrep

    SERIALIZE_OPT

    ; -----------------------------------------------------------------------
    ; Step 4 - READ the once-written entry MANY times.
    ;   The reader aliases the injector only in the BTB.  Its indirect branch
    ;   is guarded by an always-taken-but-mispredicted conditional, so it only
    ;   ever executes speculatively and never retrains the entry.  Each read it
    ;   reconstructs {reader.high16}:{BTB low32} = 0x102032033 and speculatively
    ;   fetches reader_probe.
    ; -----------------------------------------------------------------------
    mov qword[UserData + COUNTER_OFF], 0
start_read_loop:
    ; Out-of-place mistrain of the reader's conditional (NOT-taken).
    %rep mistrain_count
        mov qword[UserData + COND_OFF], 0
        SERIALIZE_OPT
        call start_aliased_cbranch
    %endrep

    ; One speculative read (COND=1 => conditional should take => mispredicts
    ; into the indirect branch, which the BTB steers to the reconstructed probe).
    ; The reader lives at > 4 GiB, so it is called through a register immediate.
    %rep 1
        lea rax, [target_ibranch_injection]         ; r10 = benign (never resolves)
        mov [UserData + TARGET_OFF], rax
        mov qword[UserData + COND_OFF], 1           ; conditional should TAKE ...
        clflush [UserData + PROBE_DATA_OFF]         ; flush the probe we measure
        clflush [UserData + TARGET_OFF]             ; make r10 resolve SLOWLY so the
                                                    ; indirect branch stays speculative
                                                    ; until the (mispredicted) guard
                                                    ; squashes it -> fetch happens, but
                                                    ; the branch never resolves/retrains
        SERIALIZE_OPT
        mov r9, sec_spec_reader_addr
        call r9
    %endrep

    inc qword[UserData + COUNTER_OFF]
    cmp qword[UserData + COUNTER_OFF], read_count
read_loop_end:
    jl start_read_loop

    ; -----------------------------------------------------------------------
    ; Measure: after the last of the many reads, is the reconstructed probe
    ; line cached?  Low L2_Miss => the once-written BTB entry survived and was
    ; still steering the reader on read #read_count.
    ; -----------------------------------------------------------------------
    READ_PMC_START
    mov rdx, [UserData + PROBE_DATA_OFF]
    READ_PMC_END

    %rep 512
     nop
    %endrep
%endmacro

%macro SERIALIZE_OPT 0
    mfence
    xor eax, eax
    cpuid
%endmacro

; Shift the PHR by the given number of doublets
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

; Set the given number of doublets to 1 in the PHR (differentiates the IBP/TAGE
; index of the reader & aliased cbranch from the injector, isolating the BTB).
; Uses a register compare (rdx must be 1 on entry) so there is no .data
; relocation -- required for the reader section at > 4 GiB.
%macro SET_PHR 2
    %assign i 0
    %rep %1
        cmp rdx, 1
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

; Identical condition + branch tail used by BOTH the injector and the reader.
; Because the bytes are identical and it begins at the same pinned offset, the
; two `jmp r10` instructions land at the same PC[23:0].  r11 = &UserData.
; %1 = label suffix, %2 = je target label
%macro CHASE_CMP_IBRANCH 2
    mov rax, [r11 + CHAIN0_OFF]
    mov rbx, [rax]
    mov rcx, [rbx]
    mov rdx, [rcx]                      ; rdx = [UserData] (conditional value)
    mov r10, [r11 + TARGET_OFF]         ; r10 = architectural target
    cmp rdx, 1
pc_cbranch_%+ %1:
    je near %2
pc_ibranch_%+ %1:
    jmp r10
%endmacro

; Byte-identical to CHASE_CMP_IBRANCH up to and including the conditional, but
; with NO indirect branch.  Used by the out-of-place mistrainer so its
; conditional lands at the same offset (same low PC bits) and PHR as the
; reader's conditional -- aliasing it in the direction predictor -- while never
; allocating a BTB entry at the shared indirect-branch PC.
%macro CHASE_CMP_COND 2
    mov rax, [r11 + CHAIN0_OFF]
    mov rbx, [rax]
    mov rcx, [rbx]
    mov rdx, [rcx]
    mov r10, [r11 + TARGET_OFF]
    cmp rdx, 1
pc_cbranch_%+ %1:
    je near %2
%endmacro

; ===========================================================================
; Reader section (aliases the injector only in the BTB).
; ===========================================================================
section .sec_spec_reader exec
start_spec_reader:
    SHIFT_PHR 195, 1
    mov rdx, 1
    SET_PHR 25, 1                       ; different PHR than injector -> no IBP alias
    mov r11, UserData
    SERIALIZE_OPT

%if speculative_jump
    times (TAIL_OFF_ALIGNED    - ($ - start_spec_reader)) db 0x90
%else
    times (TAIL_OFF_MISALIGNED - ($ - start_spec_reader)) db 0x90
%endif
    CHASE_CMP_IBRANCH reader, target_cbranch_reader

    times (BENIGN_OFF - ($ - start_spec_reader)) db 0x90
target_ibranch_reader:                  ; benign architectural target (never retired)
    %rep 512
     nop
    %endrep
target_cbranch_reader:
    %rep 64
     nop
    %endrep
    ret

; ===========================================================================
; Injector section (writes the BTB entry; benign low-32 then malicious low-32).
; ===========================================================================
section .sec_spec_injection exec
start_spec_injection:
    SHIFT_PHR 195, 0                    ; SHIFT only, no SET_PHR -> distinct IBP index
    mov r11, UserData
    SERIALIZE_OPT

    times (TAIL_OFF_ALIGNED - ($ - start_spec_injection)) db 0x90
    CHASE_CMP_IBRANCH injection, target_cbranch_injection

    times (BENIGN_OFF - ($ - start_spec_injection)) db 0x90
target_ibranch_injection:               ; abs 0x2031033  (Step 1 benign low-32)
    %rep 256
     nop
    %endrep
    ret                                 ; benign path returns -- must NOT fall
                                        ; through into the probe-loading gadget

    times (MALICIOUS_OFF - ($ - start_spec_injection)) db 0x90
malicious_target_inj:                   ; abs 0x2032033  (Step 3 written-once low-32)
    mov r9, [r11 + PROBE_DATA_OFF]
    %rep 512
     nop
    %endrep
target_cbranch_injection:
    %rep 64
     nop
    %endrep
    ret

; ===========================================================================
; Out-of-place mistrainer for the reader's conditional (BTB-independent).
; Placed in its own section; matches the reader's PHR so it aliases the
; reader's conditional in the direction predictor without touching the BTB
; entry (its own indirect-branch-free body cannot reach the shared PC[23:0]).
; ===========================================================================
section .sec_aliased_cbranch exec
start_aliased_cbranch:
    SHIFT_PHR 195, 2
    mov rdx, 1
    SET_PHR 25, 2                       ; match reader PHR -> aliases reader cbranch
    mov r11, UserData
    SERIALIZE_OPT

    ; Same pinned offset + identical pre-conditional bytes as the reader, so the
    ; conditional lands at the same low PC bits and (with matching PHR) aliases
    ; the reader's conditional in the direction predictor.  No indirect branch.
    times (TAIL_OFF_ALIGNED - ($ - start_aliased_cbranch)) db 0x90
    CHASE_CMP_COND aliased, target_cbranch_aliased
    %rep 512
     nop
    %endrep
target_cbranch_aliased:
    %rep 64
     nop
    %endrep
    ret

; ===========================================================================
; Reader's reconstructed landing: {reader.high16 0x0001}:{low32 0x02032033}
;   abs 0x102032033.  This is what the reader speculatively fetches and what we
;   measure.  Section base 0x102032000, probe at +0x33.
; ===========================================================================
section .sec_reader_landing exec
sec_land_start:
    %rep 0x33
     nop
    %endrep
reader_probe:                           ; abs 0x102032033
    mov r9, [r11 + PROBE_DATA_OFF]
    %rep 512
     nop
    %endrep
