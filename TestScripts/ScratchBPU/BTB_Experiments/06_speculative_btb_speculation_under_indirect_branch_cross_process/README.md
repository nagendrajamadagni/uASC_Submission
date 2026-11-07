# Introduction

In this experiment we show that we can write into a BTB entry under speculation and the value will persist across process boundaries under default IBPB conditions. This experiment reproduces the result in Figure 6 (c).

# Instructions

To start the write process, run the script run_write_process.sh. The script takes the following arguments.
- mode=run/asm: The default value is run
- core_id: The default value is 1.
- perf_cts: The default list is L2_Miss, BrInd, BrMispInd, BrMispCond

To start the read process, run the script run_read_process.sh The script takes the following arguments.
- mode=run/asm: The default value is run
- core_id: The default value is 1.
- speculative_jump: The default value is 0.
- perf_cts: The default list is L2_Miss, BrInd, BrMispInd, BrMispCond


# Experiment Methodology

The write and read process is the same as in the previous experiments. Here we describe how to run both the processes.


Step 1: First we run the write process by launching run_write_process.sh
Step 2: In a separate terminal or tmux session, we run the read process by launching run_read_process.sh
Step 3: If speculative_jump=0, we do not read the written value and thus the byte remains flushed. If speculative_jump=1, we read the written value and the byte is cached. This reproduces the result in Figure 3 (c).
Step 4: If both core_ids are the same, we read the written value and thus the byte is cached. If the core_ids are different, we do not read the value and thus the byte remains flushed.
Step 5: Once the experiment is finished, kill the write process.

# Inferences

When speculative_jump is omitted, we do not read the written value and the byte remains flushed. So, we see high L2 Miss.

If speculative_jump is included, we read the written value and the byte is cached. So, we see low L2 Miss.

When both core_ids are the same, the write process writes a value into the BTB that the read process is able to read and speculatively jump to. Thus, it fetches and executes the written target, caching the byte and the L2 Miss is low.

When both core_ids are the different, the write process writes a value into the BTB that the read process is not able to read and speculatively jump to. Thus, it does not fetch and execut the written target. The byte remains flushed and the L2 Miss is high.
