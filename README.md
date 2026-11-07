# Introduction

This repository contains the code which we release with our work ScratchBPU a novel microarchitectural side channel attack on Intel CPUs.

# Hardware Requirements

ScratchBPU is an attack that is made possible due to certain microarchitectural structures in the 13th Generation Intel CPU line with the code name Raptor Lake. To reproduce this attack, it is necessary to run these artefacts on a CPU which has the Raptor Cove microarchitecture. As mentioned in our submission, we have tested our experiments on 13th generation Intel
i9-13900KS performance core (Raptor Cove). We consider using a suitable hardware to be a strict requirement to testing our artefacts. Being able to read the performance counters is a necessary requirement to reproduce the results of our reverse engineering. We are unsure how successfully these experiments would run in virtualized settings, and would encourage executing them on real hardware.

# OS and Kernel Requirements
The operating system used to test our claims was Ubuntu 22.04.5 LTS, running an unmodified Linux kernel version 6.12.10. However, we do not see this as a strict requirement and any reasonably modern Linux based OS with a reasonably modern kernel should work.

# Supporting Libraries and Tools
Any supporting library or tool that this repository depends on is provided with our experiment aretefacts. This repository uses Agner Fog's benchmarking library to measure Intel performance counter values. All required files from this library are made available as part of this repositoy. Furthermore, we modify the Peek-a-Walk repository to leak instructions being speculatively executed as part of our end to end attack. The modified Peek-a-Walk code is also provided in this repository.

# Repository Structure

This repository has the following structure, we have 5 main modules. BTB Reverse Engineering Experiments, IBP Reverse Engineering Experiments, Virtual Machine Experiments, Covert Channel Demonstration, and Side Channel Demonstration.

TestScripts
|
ScratchBPU
├── BTB_Experiments
├── Covert_Channel_Demonstration
├── IBP_Experiments
├── Side_Channel_Demonstration
└── Virtual_Machine_Experiments

DriverSrcLinux

# Initialization

First install the kernel module needed to read the performance counters by running ./DriverSrcLinux/install.sh (sudo permissions may be required),

Then run the experiments within the ScratchBPU folder. As a sanity check, run the same process read and write experiment inside IBP_Experiments to ensure that your setup is correct.
