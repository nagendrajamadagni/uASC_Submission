# Introduction

In this experiment we show that our reads can be non destructive and that a value that is written can be read multiple times. This reproduces the non destructive read plot in Figure 5.

# Instructions

To run the program run the run.sh script. The script takes the following arguments.
- mode=run/asm: The default value is run
- number_of_reads=1: The default value is 1 i.e we read only once.
- core_id: The default value is 1.
- perf_cts: The default list is L2_Miss, BrInd, BrMispInd, BrMispCond


# Experiment Methodology

Step 1: We first bias the conditional branch to later make it mispredict.
Step 2: We create an entry in the IBP by training the IBP to jump to a victim target.
Step 3: We mispredict the conditional branch and under this misprediction we make an indirect branch to a malicious target. The PHR value for this indirect jump is set to be the same as in step 2.
Step 4: We try to jump to the same victim target as in step 2, but we expect to jump to the malicious target overwritten in step 3. We measure if the malicious target is cached and print the results.

The parameter number_of_reads chooses how many times we read from the IBP.

# Inferences

The L2 misses for the byte do not increase if the number of reads is more than 1. This means our reads are all non destructive in nature.

