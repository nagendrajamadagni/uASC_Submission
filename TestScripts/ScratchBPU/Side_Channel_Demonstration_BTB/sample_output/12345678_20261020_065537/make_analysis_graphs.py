#!/usr/bin/env python3
"""Generate the four analysis figures for each recovered secret.

  1. Loop 1 heat map -- cumulative PL2 signal over trials, one column per cache
     line. The true PL2 line emerges as a bright stripe; every other line stays
     at the noise floor.
  2. Loop 2 heat map -- 8 vpn2_co x 64 PL1 lines. The true PL1 line fires at
     exactly one co; attacker-image lines fire at every co.
  3. Linear search  -- median reload time per increment. The one increment whose
     line was pulled in by the speculative fetch reloads from cache, not DRAM.
  4. Sliding byte   -- median reload time per num_align, same mechanism, over the
     64 byte offsets within the line.

Graphs 1-2 are read from the raw Peek-a-Walk CSV dumps (trial,line,round,noise,
signal); 3-4 from the step-2 driver logs. Nothing here recomputes a verdict --
these plot the data the runs already produced.

Usage:  ./make_analysis_graphs.py [--outdir analysis_graphs]
"""

import argparse
import glob
import os
import re
import sys

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import TwoSlopeNorm

NLINES = 64
LOOP2_COS = 8

# One entry per secret we have a complete end-to-end recovery for. `loop1_cos`
# is how many vpn3_co loop 1 swept before it accepted -- loop 1 breaks on
# accept, so this varies by secret and sets where loop 2's CSVs start.
RUNS = [
    dict(
        name="0x12345678",
        slug="12345678",
        dump="reference_data/12345678/pwsc_raw",
        step2_log="reference_data/12345678/step2.log",
        loop1_log="reference_data/12345678/loop1.log",
        loop1_cos=1,          # vpn3_co = 0, accepted on the first co
        pl2_line=18,
        pl1_line=40,
        true_co=1,            # vpn2_co
        hit_increment=345,
        hit_num_align=56,
    ),
    dict(
        name="0xdeadbeef",
        slug="deadbeef",
        dump="reference_data/deadbeef/pwsc_raw",
        step2_log="reference_data/deadbeef/step2.log",
        loop1_log="reference_data/deadbeef/loop1.log",
        loop1_cos=4,          # vpn3_co = 3, so co 0,1,2 rejected first
        pl2_line=30,
        pl1_line=27,
        true_co=5,
        hit_increment=251,
        hit_num_align=47,
    ),
]

# Resolve the reference paths against this file's directory, not the caller's
# working directory, so `make_analysis_graphs.py` and `make_paper_figures.py`
# both work no matter where they are invoked from.
BASE = os.path.dirname(os.path.abspath(__file__))
for _run in RUNS:
    for _key in ("dump", "step2_log", "loop1_log"):
        _run[_key] = os.path.join(BASE, _run[_key])


# --------------------------------------------------------------------------
# raw dump parsing
# --------------------------------------------------------------------------

def call_index(path):
    m = re.search(r"call(\d+)", os.path.basename(path))
    if not m:
        raise ValueError("cannot parse call index from %s" % path)
    return int(m.group(1))


def dump_csvs(dumpdir):
    paths = sorted(glob.glob(os.path.join(dumpdir, "*.csv")), key=call_index)
    if not paths:
        raise FileNotFoundError("no CSVs in %s" % dumpdir)
    return paths


def per_trial_matrix(path):
    """-> (ntrials x NLINES) of signal-noise, summed over rounds."""
    rows = {}
    with open(path) as fh:
        fh.readline()          # "# target=... trials=... nrounds=..."
        fh.readline()          # "trial,line,round,noise,signal"
        for row in fh:
            p = row.split(",")
            if len(p) < 5:
                continue
            try:
                trial, line = int(p[0]), int(p[1])
                delta = int(p[4]) - int(p[3])
            except ValueError:
                continue
            rows.setdefault(trial, [0] * NLINES)[line] += delta
    if not rows:
        raise ValueError("no data rows in %s" % path)
    return np.array([rows[t] for t in sorted(rows)], dtype=float)


def line_totals(path):
    """-> (NLINES,) of signal-noise summed over every trial and round."""
    return per_trial_matrix(path).sum(axis=0)


# --------------------------------------------------------------------------
# step-2 log parsing
# --------------------------------------------------------------------------

RE_INCREMENT = re.compile(r"Trying \.sec_malicious_target = (0x[0-9a-f]+) \(increment (\d+)\)")
RE_NUM_ALIGN = re.compile(r"\[INFO\] num_align = (\d+)\s+\(")
RE_STATS = re.compile(r"^\[INFO\] min (\d+)\s+p05 (\d+)\s+median (\d+)\s+max (\d+)")
RE_HITS = re.compile(r"hits \(< (\d+) cycles\): (\d+)/(\d+) = ([\d.]+)%")
RE_SELF_IMAGE = re.compile(r"suppressing attacker's own PL2 lines:([\d ]+)")


def self_image_lines(logpath):
    """The PL2 lines leak.c masks before ranking anything, taken from the run's
    own log rather than guessed. filter_self_image_lines() derives them from
    /proc/self/maps -- they are where the attacker's binary happens to land, so
    they are present whatever the victim does, and they accumulate linearly with
    trials exactly as the signal does."""
    if not logpath or not os.path.exists(logpath):
        return set()
    with open(logpath) as fh:
        for row in fh:
            m = RE_SELF_IMAGE.search(row)
            if m:
                return {int(t) for t in m.group(1).split()}
    return set()


def parse_step2(path):
    """Walk the log in order, attributing each timing summary to the phase entry
    that precedes it. The driver prints exactly one stats line per increment and
    one per num_align, so a running 'current key' is sufficient."""
    increments, aligns = {}, {}
    bucket, key, hits, addr = None, None, None, None
    with open(path) as fh:
        for row in fh:
            m = RE_INCREMENT.search(row)
            if m:
                bucket, key, hits = increments, int(m.group(2)), None
                addr = int(m.group(1), 16)
                continue
            m = RE_NUM_ALIGN.search(row)
            if m:
                bucket, key, hits = aligns, int(m.group(1)), None
                continue
            m = RE_HITS.search(row)
            if m:
                hits = float(m.group(4))
                continue
            m = RE_STATS.match(row)
            if m and bucket is not None and key is not None and key not in bucket:
                bucket[key] = dict(
                    minimum=int(m.group(1)), p05=int(m.group(2)),
                    median=int(m.group(3)), maximum=int(m.group(4)),
                    hits=hits, addr=addr,
                )
    return increments, aligns


# --------------------------------------------------------------------------
# figures
# --------------------------------------------------------------------------

def diverging_norm(data):
    """Centre the colour scale on zero and clip to the 99th percentile so one
    large cell cannot wash the rest of the map out."""
    hi = max(np.percentile(np.abs(data), 99), 1.0)
    peak = max(abs(data.max()), abs(data.min()), hi)
    return TwoSlopeNorm(vmin=-hi, vcenter=0.0, vmax=peak)


def graph1_loop1(run, outdir):
    """Cumulative PL2 signal over trials for loop 1's accepting profile."""
    paths = dump_csvs(run["dump"])
    # Loop 1 breaks on accept, so the accepting co is its LAST profile.
    accepting = paths[run["loop1_cos"] - 1]
    per_trial = per_trial_matrix(accepting)
    cumulative = np.cumsum(per_trial, axis=0)
    ntrials = cumulative.shape[0]

    # Same treatment as loop 2: grey out the attacker's own image so the colour
    # scale reflects what leak.c ranks. On 0xdeadbeef line 0 accumulates almost
    # as fast as the true PL2 line, and left in it reads as a second answer.
    suppressed = self_image_lines(run.get("loop1_log"))
    mask = np.zeros_like(cumulative, dtype=bool)
    for ln in suppressed:
        mask[:, ln] = True
    cumulative = np.ma.masked_array(cumulative, mask)

    fig, ax = plt.subplots(figsize=(11, 5.2))
    cmap = plt.get_cmap("RdBu_r").copy()
    cmap.set_bad("#c8c8c8")
    im = ax.imshow(cumulative, aspect="auto", origin="lower",
                   cmap=cmap, norm=diverging_norm(cumulative.compressed()),
                   extent=[-0.5, NLINES - 0.5, 0.5, ntrials + 0.5],
                   interpolation="nearest")
    ax.set_xlabel("Page Table Level 2 cache line")
    ax.set_ylabel("trials accumulated")
    ax.axvline(run["pl2_line"], color="black", lw=0.9, ls="--", alpha=0.55)
    ax.annotate("line %d" % run["pl2_line"],
                xy=(run["pl2_line"], ntrials), xytext=(6, -14),
                textcoords="offset points", fontsize=9, fontweight="bold")
    ax.set_xticks(range(0, NLINES, 4))
    if suppressed:
        ax.plot([], [], "s", color="#c8c8c8", ms=9, label="line output masked")
        ax.legend(loc="lower right", fontsize=9, framealpha=0.92)
    fig.colorbar(im, ax=ax, label="cumulative signal - noise")
    fig.tight_layout()
    save(fig, outdir, "%s_graph1_loop1_pl2_heatmap.png" % run["slug"])


def always_on_lines(grid, pl2_line):
    """Lines the decision rule discounts before ranking anything.

    Two sources, and both are structural rather than statistical -- they
    accumulate linearly with trials exactly as the signal does, so averaging
    never separates them:

      * the PL2 line itself, which stays hot from loop 1's probing and reads
        far above everything else at EVERY co (leak.c re-adds it to
        init_noise_filter for precisely this reason), and
      * the attacker's own image, which aliases onto a handful of PL1 lines and
        so is present whatever the victim does.

    Both show the same signature: present at every co. That is the paper's
    "always produces a signal" category, and detecting it needs no knowledge of
    the secret -- only the between-co contrast."""
    floor = np.percentile(np.abs(grid), 95)
    always = {ln for ln in range(NLINES) if grid[:, ln].min() > floor}
    return always | {pl2_line}


def graph2_loop2(run, outdir):
    """8 vpn2_co x 64 PL1 lines."""
    paths = dump_csvs(run["dump"])
    loop2 = paths[run["loop1_cos"]:run["loop1_cos"] + LOOP2_COS]
    if len(loop2) != LOOP2_COS:
        raise ValueError("expected %d loop-2 CSVs in %s, found %d"
                         % (LOOP2_COS, run["dump"], len(loop2)))
    grid = np.array([line_totals(p) for p in loop2])

    # Grey out the always-on lines and rescale the colour map to the rest, so
    # the figure shows the contrast the decision actually turns on. Plotting the
    # raw grid instead lets the PL2 line -- 2-3x the true PL1 signal at every
    # co -- flatten everything else to white.
    suppressed = always_on_lines(grid, run["pl2_line"])
    mask = np.zeros_like(grid, dtype=bool)
    for ln in suppressed:
        mask[:, ln] = True
    grid = np.ma.masked_array(grid, mask)

    fig, ax = plt.subplots(figsize=(11, 4.4))
    cmap = plt.get_cmap("RdBu_r").copy()
    cmap.set_bad("#c8c8c8")
    im = ax.imshow(grid, aspect="auto", origin="lower",
                   cmap=cmap, norm=diverging_norm(grid.compressed()),
                   extent=[-0.5, NLINES - 0.5, -0.5, LOOP2_COS - 0.5],
                   interpolation="nearest")
    ax.set_xlabel("Page Table Level 1 cache line")
    ax.set_ylabel("Page Table Level 2 cache offset (vpn2_co)")
    ax.set_yticks(range(LOOP2_COS))
    ax.set_xticks(range(0, NLINES, 4))
    ax.add_patch(plt.Rectangle((run["pl1_line"] - 0.5, run["true_co"] - 0.5), 1, 1,
                               fill=False, edgecolor="black", lw=2.0))
    ax.annotate("line %d, co %d" % (run["pl1_line"], run["true_co"]),
                xy=(run["pl1_line"], run["true_co"]), xytext=(10, 10),
                textcoords="offset points", fontsize=9, fontweight="bold",
                arrowprops=dict(arrowstyle="->", lw=1.0))
    ax.plot([], [], "s", color="#c8c8c8", ms=9, label="line output masked")
    ax.legend(loc="upper right", fontsize=9, framealpha=0.92)
    fig.colorbar(im, ax=ax, label="signal - noise")
    fig.tight_layout()
    save(fig, outdir, "%s_graph2_loop2_pl1_heatmap.png" % run["slug"])


def reload_plot(run, series, hit, xlabel, fname, outdir, addr_mode=None):
    """addr_mode: None plots the raw sweep index; "abs" plots the address under
    test (the linear search steps .sec_malicious_target itself); "offset" plots
    address + index (the sliding byte phase holds the section address fixed and
    slides the jump within the line). Addresses come from the driver log rather
    than being recomputed, so they cannot drift from what ran."""
    keys = sorted(series)
    # Plot the fast tail (5th-percentile reload), not the median: the speculative
    # fetch caches the line in only a MINORITY of rounds, so the median stays in
    # the miss band while the p05 drops below the cache-hit threshold at the one
    # address/offset that got cached.
    median = np.array([series[k]["p05"] for k in keys], float)
    if addr_mode == "abs":
        x = np.array([series[k]["addr"] for k in keys], float)
        hit_x = float(series[hit]["addr"]) if hit in series else None
    elif addr_mode == "offset":
        x = np.array([series[k]["addr"] + k for k in keys], float)
        hit_x = float(series[hit]["addr"] + hit) if hit in series else None
    else:
        x = np.array(keys, float)
        hit_x = float(hit) if hit in series else None

    fig, ax = plt.subplots(figsize=(11, 4.6))
    ax.plot(x, median, lw=0.9, color="#3b6ea5", label="5th-pct (fast-tail) reload")
    if hit in series:
        ax.plot([hit_x], [series[hit]["p05"]], "o", ms=9, color="#c0392b",
                zorder=5, label="speculative fetch detected")
        # Park the label in the empty band between the 200 cycle threshold and
        # the DRAM baseline, in data coordinates -- a fixed pixel offset lands
        # on the threshold line in one plot or the baseline in the other,
        # because the two figures have very different y ranges.
        baseline = float(np.median(median))
        label = ("%s\np05 %d cycles\n%.1f%% hits"
                 % ("0x%08x" % int(hit_x) if addr_mode
                    else "%s = %d" % (xlabel.split()[0], hit),
                    series[hit]["p05"],
                    series[hit]["hits"] if series[hit]["hits"] is not None else float("nan")))
        ax.annotate(label,
                    xy=(hit_x, series[hit]["p05"]),
                    xytext=(hit_x - 0.30 * (x.max() - x.min()), (200.0 + baseline) / 2.0),
                    textcoords="data", fontsize=9, fontweight="bold",
                    ha="left", va="center",
                    arrowprops=dict(arrowstyle="->", lw=1.2, color="#c0392b"))
    ax.axhline(200, color="grey", ls=":", lw=1.0)
    ax.annotate("cache-hit threshold (200 cycles)", xy=(x[0], 200),
                xytext=(4, 6), textcoords="offset points",
                fontsize=8, color="grey")
    ax.set_xlabel(xlabel)
    ax.set_ylabel("reload time (cycles)")
    if addr_mode:
        ax.xaxis.set_major_formatter(
            matplotlib.ticker.FuncFormatter(lambda v, _: "0x%08x" % int(v)))
        # Tick on a power-of-two boundary chosen for ~7 ticks across the span,
        # so labels are round addresses. The default locator picks multiples of
        # the sweep step and produces addresses that read as noise. The two
        # phases span very different ranges -- 32 KiB against 64 bytes -- so the
        # step has to be derived rather than fixed.
        span = max(x.max() - x.min(), 1.0)
        step = 2.0 ** round(np.log2(span / 7.0))
        ax.xaxis.set_major_locator(matplotlib.ticker.MultipleLocator(step))
        fig.autofmt_xdate(rotation=20, ha="right")
    ax.set_ylim(0, float(np.percentile(median, 99)) * 1.35)
    ax.legend(loc="upper right", fontsize=9, framealpha=0.9)
    ax.grid(alpha=0.25, lw=0.5)
    fig.tight_layout()
    save(fig, outdir, fname)


def graph3_linear(run, increments, outdir):
    reload_plot(
        run, increments, run["hit_increment"], "candidate address",
        "%s_graph3_linear_search_reload.png" % run["slug"], outdir,
        addr_mode="abs")


def graph4_align(run, aligns, outdir):
    reload_plot(
        run, aligns, run["hit_num_align"], "candidate address",
        "%s_graph4_sliding_byte_reload.png" % run["slug"], outdir,
        addr_mode="offset")


def save(fig, outdir, fname):
    path = os.path.join(outdir, fname)
    fig.savefig(path, dpi=160)
    plt.close(fig)
    print("  wrote %s" % path)


# --------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--outdir",
                    default=os.path.join(BASE, "analysis_graphs"))
    args = ap.parse_args()
    os.makedirs(args.outdir, exist_ok=True)

    failures = 0
    for run in RUNS:
        print("%s:" % run["name"])
        increments, aligns = {}, {}
        if os.path.exists(run["step2_log"]):
            increments, aligns = parse_step2(run["step2_log"])
        else:
            print("  [skip] %s not found" % run["step2_log"])

        for label, fn in (
            ("graph 1", lambda: graph1_loop1(run, args.outdir)),
            ("graph 2", lambda: graph2_loop2(run, args.outdir)),
            ("graph 3", lambda: increments and graph3_linear(run, increments, args.outdir)),
            ("graph 4", lambda: aligns and graph4_align(run, aligns, args.outdir)),
        ):
            try:
                if fn() is False:
                    print("  [skip] %s: no data" % label)
            except (FileNotFoundError, ValueError) as e:
                print("  [FAIL] %s: %s" % (label, e))
                failures += 1
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
