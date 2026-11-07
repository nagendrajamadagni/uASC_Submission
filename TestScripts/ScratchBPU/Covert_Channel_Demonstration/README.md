# Introduction

This folder has the necessary files to demonstrate a covert channel.

The transmitter and receiver must run on the **same physical core** (the IBP
is per-core, so on different cores they share nothing) with the hardware
prefetchers disabled (the channel is dead otherwise).

# Running the experiment (script)

`run_covert_channel.sh` does everything below automatically: it builds, disables
the prefetchers on the chosen core, pins both processes to it, runs the transfer,
restores the MSR, and prints the bandwidth and bit error rate.

- Run `./run_covert_channel.sh` (needs sudo for the MSR write)
- Options: `./run_covert_channel.sh core_id=0 msg_len=1024 repeat=3`

See `MEASUREMENT.md` for the options and the measured results.

# Running the experiment (manual)

Do the same steps by hand if you want the two-terminal workflow. Pick a P-core
for `<core>` (0-15 on this machine; 16-31 are E-cores) and use the SAME core
everywhere.

- Compile both processes:

      make

- Disable the hardware prefetchers on the target core (per-CPU MSR, so the
  `-p <core>` must match the core you pin to below):

      sudo modprobe msr
      sudo wrmsr -p <core> 0x1a4 0x2f
      sudo rdmsr  -p <core> 0x1a4        # must print 2f

- Run the transmitter, pinned to the core:

      taskset -c <core> ./bin/ibp_leakage_writer.out msg_len=1024 repeat=3

- In a separate terminal or tmux pane, run the receiver on the SAME core:

      taskset -c <core> ./bin/ibp_leakage_reader.out msg_len=1024 repeat=3

- When finished, restore the prefetcher MSR to its original value:

      sudo wrmsr -p <core> 0x1a4 <original_value>
