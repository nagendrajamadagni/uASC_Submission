# Introduction

In this experiment we show that we cannot write to the IBP if the indirect jump target resolves after speculation ends. We create speculation under an indirect branch and execute another indirect branch that writes into the IBP. Depending on whether delay_target is 0 or 1, we delay the target that is written into the IBP. This experiment helps to reproduce the result in Table 1.

# Instructions

To run the program run the run.sh script. The script takes the following arguments.
- mode=run/asm: The default value is run
- delay_target=0/1: The default value is 0 i.e we do not delay the target
- core_id: The default value is 1.
- perf_cts: The default list is L2_Miss, BrInd, BrMispInd, BrMispCond


# Inferences

When the branch target is not delayed we see that the number of Indirect Branches Mispredicting (due to overwriting within the IBP) is high, consequently the victim target is speculatively executed and the instruction is cached which is what we measure.

Suppose the branch target is delayed, we see that the number of Indirect Branches Mispredicting is low (due to no overwriting within the IBP), the victim target is not speculatively executed and the instruction is not cached in our measurements.
