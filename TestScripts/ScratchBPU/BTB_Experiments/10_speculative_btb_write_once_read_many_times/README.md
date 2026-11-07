# Introduction

BTB port of IBP experiment 10 (`IBP_Experiments/10_speculative_ibp_write_once_read_many_times`).
We write **one** target into a BTB entry under speculation and then read it back
**many** times, through a *different* branch that aliases the injector only in
the BTB (same `PC[23:0]`) and deliberately **not** in the IBP (different PHR).

# Instructions

Run `run.sh`. Arguments:
- `mode=run/asm` (default `run`)
- `speculative_jump=0/1` (default `1`) — alignment toggle: `1` aligns the reader
  and injector indirect branches on `PC[23:0]` (collision); `0` misaligns them
  (control).
- `core_id` (default `1`; use an isolated core, e.g. `4`)
- `perf_cts` (default `320,205,206,211`)
- `read_count` (default `100`) — number of reads in the read-many loop.

Build-time `-D` knobs also exposed: `write_count` (Step-3 speculative writes),
`mistrain_count` (out-of-place conditional mistrains per read).

# Experiment Methodology

- **Step 1** — train the injector architecturally: the conditional is biased
  NOT-taken and the indirect branch targets a *benign* low-32 (`0x02031033`),
  allocating the shared BTB entry.
- **Step 3** — *speculatively* overwrite the entry (write once): with the
  conditional now mispredicting, the indirect branch resolves to the *malicious*
  low-32 (`0x02032033`) inside the misprediction window and updates the BTB,
  while architecturally the indirect branch is never reached.
- **Step 4** — read many times: the reader aliases the injector only in the BTB.
  Its indirect branch is guarded by an always-taken-but-mispredicted conditional,
  so it executes **speculatively only** and never retrains the entry. The guard's
  squash must arrive *after* the speculative fetch of the injected target issues
  but *before* the indirect branch resolves (the reader's indirect-target source
  is flushed so it resolves slowly). We flush the probe line each read and, after
  the last read, measure whether it is cached.

## Key micro-architectural facts baked into the layout (verified by objdump)

- Injector/reader indirect branches are both `jmp r10` and pinned to the same
  section offset via an identical r11-relative tail, so with `sj=1` they share
  `PC[23:0] = 0x02f021` (with `sj=0` the reader moves to `0x027021`).
- The reader lives at `0x100000000` (> 4 GiB). Under `-mcmodel=large`, all
  `.data` access must go through a base register (`r11 = &UserData`), never a
  32-bit displacement, and the > 4 GiB reader is called through a register
  immediate (`mov r9, <addr>; call r9`).
- Isolation: the injector uses `SHIFT_PHR` only; the reader and the out-of-place
  mistrainer use `SHIFT_PHR + SET_PHR 25`, giving them a different IBP/TAGE index
  so any leak is provably via the BTB, not the IBP. The mistrainer's conditional
  is pinned to the reader conditional's low bits (`...f01b`) so it aliases in the
  direction predictor without allocating a BTB entry at the shared indirect PC.

# Status (2026-10-15)

Assembles, links and runs. All **static** invariants verified by objdump:
`PC[23:0]` aliasing (`0x02f021`), the `sj=0` control (`0x027021`), PHR
isolation, and the conditional-mistrainer alignment (`...f01b`).

**The dynamic cache signal does not yet reproduce** (L2_Miss ≈ 1000/1000 for
both `sj=1` and `sj=0`), whereas the sibling single-read experiment exp02 shows
a clear differential (`sj=1`≈873 vs `sj=0`≈1001). Diagnostics localised the
blocker: the BTB is **not steering the reader's indirect branch** to the
injected target in this layout — this is true even with the entry *directly*
trained to the malicious target and read with a strong architectural (un-guarded)
reader, so it is upstream of both the Step-3 speculative write and the guard.
The conditional guard and the indirect branch both mispredict ~once per read
(BrMispCond/BrMispInd scale with `read_count`), so the reader's indirect branch
*is* executed speculatively; it simply is not being predicted to the injected
target. Most likely causes still open: (a) the reader's reinvented r11-relative
tail differs from exp02's proven reader (register-passed condition + same-section
`cmovz` targets); (b) this port omits exp02's Step-2 IBP-train / Step-2.5
IBP-evict for the reader, so the reader's indirect may not fall back to the BTB.
