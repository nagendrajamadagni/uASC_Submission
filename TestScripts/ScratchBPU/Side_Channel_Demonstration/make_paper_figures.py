#!/usr/bin/env python3
"""Render the three side-channel figures at USENIX single-column size.

These are the same four plots make_analysis_graphs.py produces for the
0x12345678 recovery, re-authored as vector PDFs at their
FINAL PRINTED SIZE so that \includegraphics[width=\linewidth] applies no
scaling and every label lands at the point size it was set to.

  level2_heatmap.pdf  <- graph 1, loop 1: cumulative PL2 signal over trials
  level1_heatmap.pdf  <- graph 2, loop 2: 8 vpn2_co x 64 PL1 lines
  linear_search.pdf   <- graph 3, the 32 KiB sweep over bits 14-6
  sliding_byte.pdf    <- graph 4, the 64 byte offsets within the line, bits 5-0

Every parser is imported from make_analysis_graphs rather than reimplemented,
so the numbers plotted here are the numbers that script plots. Only the
presentation differs: figure geometry, font sizes, tick density, and a colour
scale clipped to the noise floor instead of to the peak (see NOTE below).

Usage:  ./make_paper_figures.py [--outdir paper_figures]
"""

import argparse
import os
import sys

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import FuncFormatter, MultipleLocator

import make_analysis_graphs as gen

# --- no Type 3 fonts anywhere in the output -------------------------------
matplotlib.rcParams["pdf.fonttype"] = 42
matplotlib.rcParams["ps.fonttype"] = 42

# --- the paper's shared style, from figures/scripts/bpu_barplot.py ---------
FS_TICK = 8
FS_AXIS = 8.5
FS_LEGEND = 7.5

# USENIX: (7.00in textwidth - 0.33in gutter) / 2.
COL_W = 3.335
# Final printed height. Chosen for legibility, not to fit text in.
FIG_H = 2.05

# Okabe-Ito, as used by the paper's other five figures.
BLUE = "#0072B2"
ORANGE = "#E69F00"
MASK_GREY = "#c8c8c8"

RUN = gen.RUNS[0]           # 0x12345678
assert RUN["slug"] == "12345678", RUN["slug"]


def style(ax, ygrid=False):
    ax.tick_params(labelsize=FS_TICK, length=2, pad=1.5)
    ax.xaxis.label.set_size(FS_AXIS)
    ax.yaxis.label.set_size(FS_AXIS)
    for side in ("top", "right"):
        ax.spines[side].set_visible(False)
    for side in ("left", "bottom"):
        ax.spines[side].set_linewidth(0.7)
    if ygrid:
        ax.set_axisbelow(True)
        ax.grid(axis="y", linestyle="--", alpha=0.45, linewidth=0.5)


def nice_ceiling(v):
    """Round up to 1/2/5 x 10^k, so the colourbar ends on a readable number."""
    k = 10.0 ** np.floor(np.log10(v))
    for m in (1, 2, 5, 10):
        if v <= m * k:
            return m * k
    return 10 * k


SIGMA_SPAN = 12.0


def symmetric_limit(data):
    """NOTE ON THE COLOUR SCALE. It is symmetric about zero -- the data is
    signed, so a diverging map must put its neutral midpoint on 0 -- and it is
    clipped to a multiple of the NOISE, not to the peak.

    The true page-table line runs one to two orders of magnitude above every
    other cell (L18 ends at 1851 against a runner-up of 98). Scaling to the peak,
    as the screen-sized figures did, renders the whole noise floor flat white and
    discards the texture a reader needs in order to judge that the stripe is the
    only structure present. Scaling to a percentile of |x| does not work either:
    the two maps have very different signal-to-noise (89 sigma against 22 sigma),
    so one rule over-clips one of them.

    So take a robust noise scale -- 1.4826 * median|x|, which the signal column
    cannot move because it is a median -- and span +/- 12 of them. Anything past
    the ends of the bar is then unambiguously signal rather than a tail of the
    noise. The colourbar carries an `extend` arrow so the clipping is declared,
    and the true peak is printed in the annotation."""
    sigma = 1.4826 * np.median(np.abs(data))
    return nice_ceiling(max(SIGMA_SPAN * sigma, 1.0))


def divergent_image(ax, data, vlim):
    cmap = plt.get_cmap("RdBu_r").copy()
    cmap.set_bad(MASK_GREY)
    return ax.imshow(data, aspect="auto", origin="lower", cmap=cmap,
                     vmin=-vlim, vmax=vlim, interpolation="nearest",
                     extent=[-0.5, gen.NLINES - 0.5,
                             -0.5, data.shape[0] - 0.5])


def add_colorbar(fig, ax, im, label, extend):
    cb = fig.colorbar(im, ax=ax, extend=extend, fraction=0.055, pad=0.025,
                      extendfrac=0.04)
    cb.set_label(label, size=FS_AXIS, labelpad=2)
    cb.ax.tick_params(labelsize=FS_TICK, length=2, pad=1.5)
    cb.outline.set_linewidth(0.7)
    return cb


def masked(data, lines):
    mask = np.zeros_like(data, dtype=bool)
    for ln in lines:
        mask[:, ln] = True
    return np.ma.masked_array(data, mask)


# --------------------------------------------------------------------------

def level2_heatmap(outdir):
    paths = gen.dump_csvs(RUN["dump"])
    per_trial = gen.per_trial_matrix(paths[RUN["loop1_cos"] - 1])
    cumulative = np.cumsum(per_trial, axis=0)
    ntrials = cumulative.shape[0]

    suppressed = gen.self_image_lines(RUN["loop1_log"])
    grid = masked(cumulative, suppressed)
    vlim = symmetric_limit(grid.compressed())
    peak = grid[:, RUN["pl2_line"]].max()

    fig, ax = plt.subplots(figsize=(COL_W, FIG_H), constrained_layout=True)
    im = ax.imshow(grid, aspect="auto", origin="lower",
                   cmap=_cmap(), vmin=-vlim, vmax=vlim,
                   interpolation="nearest",
                   extent=[-0.5, gen.NLINES - 0.5, 0.5, ntrials + 0.5])

    ax.set_xlabel("Page Table Level 2 cache line")
    ax.set_ylabel("trials accumulated")
    ax.set_xticks(range(0, gen.NLINES, 8))
    ax.yaxis.set_major_locator(MultipleLocator(40))
    ax.set_ylim(0.5, ntrials + 0.5)

    ax.annotate("line %d\n(peak %d)" % (RUN["pl2_line"], peak),
                xy=(RUN["pl2_line"] + 1.5, ntrials * 0.90),
                fontsize=FS_TICK, fontweight="bold", ha="left", va="top")
    ax.plot([], [], "s", color=MASK_GREY, ms=5, label="line output masked")
    leg = ax.legend(loc="lower right", fontsize=FS_LEGEND, framealpha=0.92,
                    handlelength=1.0, handletextpad=0.5,
                    borderpad=0.3, borderaxespad=0.3)
    leg.get_frame().set_linewidth(0.5)

    style(ax)
    add_colorbar(fig, ax, im, "cumulative\nsignal $-$ noise", "max")
    save(fig, outdir, "level2_heatmap.pdf")


def level1_heatmap(outdir):
    paths = gen.dump_csvs(RUN["dump"])
    loop2 = paths[RUN["loop1_cos"]:RUN["loop1_cos"] + gen.LOOP2_COS]
    if len(loop2) != gen.LOOP2_COS:
        raise ValueError("expected %d loop-2 CSVs, found %d"
                         % (gen.LOOP2_COS, len(loop2)))
    raw = np.array([gen.line_totals(p) for p in loop2])

    suppressed = gen.always_on_lines(raw, RUN["pl2_line"])
    grid = masked(raw, suppressed)
    vlim = symmetric_limit(grid.compressed())
    peak = raw[RUN["true_co"], RUN["pl1_line"]]

    fig, ax = plt.subplots(figsize=(COL_W, FIG_H), constrained_layout=True)
    im = divergent_image(ax, grid, vlim)

    ax.set_xlabel("Page Table Level 1 cache line")
    ax.set_ylabel("Page Table Level 2\ncache offset")
    ax.set_xticks(range(0, gen.NLINES, 8))
    ax.set_yticks(range(gen.LOOP2_COS))

    ax.add_patch(plt.Rectangle(
        (RUN["pl1_line"] - 0.5, RUN["true_co"] - 0.5), 1, 1,
        fill=False, edgecolor="black", lw=1.0, zorder=4))
    ax.annotate("line %d, offset %d\n(peak %d)"
                % (RUN["pl1_line"], RUN["true_co"], peak),
                xy=(RUN["pl1_line"] - 0.5, RUN["true_co"] + 0.5),
                xytext=(-2, 12), textcoords="offset points",
                fontsize=FS_TICK, fontweight="bold", ha="right", va="bottom",
                arrowprops=dict(arrowstyle="->", lw=0.8,
                                shrinkA=1, shrinkB=1))
    # Lower LEFT: at lower right the frame butts against the highlighted cell.
    ax.plot([], [], "s", color=MASK_GREY, ms=5, label="line output masked")
    leg = ax.legend(loc="lower left", fontsize=FS_LEGEND, framealpha=0.92,
                    handlelength=1.0, handletextpad=0.5,
                    borderpad=0.3, borderaxespad=0.3)
    leg.get_frame().set_linewidth(0.5)

    style(ax)
    add_colorbar(fig, ax, im, "signal $-$ noise", "max")
    save(fig, outdir, "level1_heatmap.pdf")


def reload_plot(series, hit, addr_mode, fname, outdir, ticks=3):
    """Shared body for the two step-2 sweeps.

    addr_mode "abs"    -- the linear search steps .sec_malicious_target itself,
                          so the address under test is the logged one.
    addr_mode "offset" -- the sliding-byte phase holds the section address fixed
                          and slides the jump within the line, so the address
                          under test is logged address + num_align.
    Either way the addresses come from the driver log rather than being
    recomputed here, so they cannot drift from what actually ran."""
    keys = sorted(series)
    median = np.array([series[k]["median"] for k in keys], float)
    off = keys if addr_mode == "offset" else [0] * len(keys)
    x = np.array([series[k]["addr"] + o for k, o in zip(keys, off)], float)
    hit_x = float(series[hit]["addr"] + (hit if addr_mode == "offset" else 0))
    hit_y = float(series[hit]["median"])
    hit_pct = series[hit]["hits"]

    fig, ax = plt.subplots(figsize=(COL_W, FIG_H), constrained_layout=True)
    ax.plot(x, median, lw=0.7, color=BLUE, label="median reload",
            solid_joinstyle="round")
    ax.plot([hit_x], [hit_y], "o", ms=4.5, color=ORANGE, zorder=5,
            markeredgecolor="black", markeredgewidth=0.4,
            label="speculative fetch")

    # The threshold is labelled in the legend rather than beside the line: at
    # column width the inline label was 72% of the axes wide and collided with
    # the callout. The legend sits in the empty lower-left quadrant.
    ax.axhline(200, color="0.45", ls=":", lw=0.8, zorder=1,
               label="200-cycle cache-hit threshold")
    # Park the callout in the band between the threshold and the DRAM baseline,
    # in DATA coordinates -- that band is empty across the whole sweep, and the
    # two phases have very different y ranges so a pixel offset would not hold.
    ax.annotate("0x%08x\n%d cycles, %.1f%% hits" % (int(hit_x), hit_y, hit_pct),
                xy=(hit_x, hit_y),
                xytext=(hit_x - 0.03 * (x.max() - x.min()), 285.0),
                textcoords="data",
                fontsize=FS_TICK, fontweight="bold", ha="right", va="center",
                arrowprops=dict(arrowstyle="->", lw=0.9, color=ORANGE,
                                shrinkA=2, shrinkB=2))

    ax.set_xlabel("candidate address")
    ax.set_ylabel("reload time (cycles)")
    ax.set_ylim(0, float(np.percentile(median, 99)) * 1.30)
    ax.xaxis.set_major_formatter(FuncFormatter(lambda v, _: "0x%08x" % int(v)))
    # 10-character hex labels cost ~0.7in each, so a 3.335in column takes four
    # of them at most. Derive a power-of-two step to keep the addresses round.
    span = max(x.max() - x.min(), 1.0)
    ax.xaxis.set_major_locator(MultipleLocator(2.0 ** round(np.log2(span / ticks))))
    for lab in ax.get_xticklabels():
        lab.set_rotation(20)
        lab.set_ha("right")
        lab.set_rotation_mode("anchor")

    leg = ax.legend(loc="lower left", fontsize=FS_LEGEND, framealpha=0.9,
                    handlelength=1.4, handletextpad=0.5,
                    borderpad=0.3, borderaxespad=0.3, labelspacing=0.35)
    leg.get_frame().set_linewidth(0.5)
    style(ax, ygrid=True)
    save(fig, outdir, fname)


def step2_series(outdir):
    increments, aligns = gen.parse_step2(RUN["step2_log"])
    if not increments or not aligns:
        raise ValueError("step 2 log %s parsed short (%d increments, %d aligns)"
                         % (RUN["step2_log"], len(increments), len(aligns)))
    return increments, aligns


def linear_search(increments, outdir):
    """Bits 14-6: the 32 KiB sweep over .sec_malicious_target."""
    reload_plot(increments, RUN["hit_increment"], "abs",
                "linear_search.pdf", outdir)


def sliding_byte(aligns, outdir):
    """Bits 5-0: the 64 byte offsets within the recovered cache line."""
    reload_plot(aligns, RUN["hit_num_align"], "offset",
                "sliding_byte.pdf", outdir)


def _cmap():
    cmap = plt.get_cmap("RdBu_r").copy()
    cmap.set_bad(MASK_GREY)
    return cmap


PAD = 0.015


def save(fig, outdir, fname):
    """Save at EXACTLY (COL_W x FIG_H) inches.

    bbox_inches="tight" trims to the drawn content, which is not the figure
    size -- it came out anywhere from 3.16 to 3.62in here. LaTeX would then
    rescale each figure by a different factor under width=\\linewidth and the
    three would print their labels at three different point sizes, which is the
    exact failure being corrected. So solve for the figure size whose tight
    bbox IS the target: shrinking the figure under constrained layout shrinks
    the axes with it, so the map is near-linear and converges in a few steps."""
    fw, fh = COL_W, FIG_H
    for _ in range(20):
        fig.set_size_inches(fw, fh)
        fig.set_constrained_layout_pads(w_pad=0.005, h_pad=0.005,
                                        wspace=0, hspace=0)
        fig.canvas.draw()
        bb = fig.get_tightbbox(fig.canvas.get_renderer())
        dw = COL_W - (bb.width + 2 * PAD)
        dh = FIG_H - (bb.height + 2 * PAD)
        if abs(dw) < 0.0015 and abs(dh) < 0.0015:
            break
        fw, fh = fw + dw, fh + dh
    else:
        print("  [warn] %s did not converge (dw=%.4f dh=%.4f)" % (fname, dw, dh))

    path = os.path.join(outdir, fname)
    fig.savefig(path, bbox_inches="tight", pad_inches=PAD)
    plt.close(fig)
    print("  wrote %s  (%.3f x %.3f in, no scaling at width=\\linewidth)"
          % (path, COL_W, FIG_H))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--outdir",
                    default=os.path.join(gen.BASE, "paper_figures"))
    args = ap.parse_args()
    os.makedirs(args.outdir, exist_ok=True)
    print("%s:" % RUN["name"])
    level2_heatmap(args.outdir)
    level1_heatmap(args.outdir)
    increments, aligns = step2_series(args.outdir)
    linear_search(increments, args.outdir)
    sliding_byte(aligns, args.outdir)
    return 0


if __name__ == "__main__":
    sys.exit(main())
