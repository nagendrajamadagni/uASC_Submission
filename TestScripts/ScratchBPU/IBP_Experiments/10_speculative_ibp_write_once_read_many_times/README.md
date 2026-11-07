# Introduction

In this experiment we show that we can write into an IBP entry under speculation and the written target gets fetched.

# Instructions

To run the program run the run.sh script. The script takes the following arguments.
- mode=run/asm: The default value is run
- collision=0/1: The default value is 0 i.e no collision
- core_id: The default value is 0. This argument is optional
- perf_cts: The default list is L2_Miss, BrInd, BrMispInd, BrMispCond


# Experiment Methodology

Step 1: We first bias the conditional branch to later make it mispredict.
Step 2: We create an entry in the IBP by training the IBP to jump to a victim target.
Step 3: We mispredict the conditional branch and under this misprediction we make an indirect branch to a malicious target. The PHR value for this indirect jump is set to be the same as in step 2.
Step 4: We try to jump to the same victim target as in step 2, but we expect to jump to the malicious target overwritten in step 3. We measure if the malicious target is cached and print the results.

# Inferences

When collision is 1 we see that the number of Indirect Branches Mispredicting (due to collision within the IBP) is high, consequently the victim target is speculatively executed and the instruction is cached which is what we measure.

Suppose collision is set to 0, we see that the number of Indirect Branches Mispredicting is low (due to no collision within the IBP), the victim target is not speculatively executed and the instruction is not cached in our measurements.
