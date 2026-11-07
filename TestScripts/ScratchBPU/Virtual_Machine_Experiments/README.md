# Introduction

This module holds the experiments related to virtual machines. First install all the tools needed for vitual machine operation i.e qemu and libvirst. Then, create two virtual machines writer and reader based on the XML configs provided here. You will need to modify the kernel and initrd files appropriately and provide a proper disk with an OS setup so that the virtual machines can boot.

Once the virtual machines are created, copy the C files and the Makefile to the virtual machine. Please setup all file paths as demonstrated in the configuration files

# Cross VM Write and Read

To see if a value written in the writer can be read inside the reader, run the vm_writer program inside the writer VM and then run the vm_reader program inside the reader VM. This reproduces the result in Figure 9

# Flush on VMExit

To see if VMExit causes a flush, run the vm_loopback in one VM and vm_passthrough in another VM or the host.

You will need to enable and disable IBPB as needed on your OS. This will require rebooting the machine.
