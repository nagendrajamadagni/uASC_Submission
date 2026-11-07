# Compilers 
CC = gcc
CXX = g++
NASM = nasm

# Flags
#CFLAGS = -O0 -g -static -fcf-protection=full -z ibt -z shstk
CFLAGS = -O0 -g -static
NASMFLAGS = -g -O0 -f elf64
#LDFLAGS = -g -w -O0 -static -fcf-protection=full -z ibt -z shstk
LDFLAGS = -g -w -O0 -static
LINK_FLAGS = $(LDFLAGS) -T linker.ld

# C Source Files
SRC_C_IBP_Leakage_VM_Writer = src/poc_ibp_leakage_vm_writer.c
SRC_C_IBP_Leakage_VM_Reader = src/poc_ibp_leakage_vm_reader.c
SRC_C_IBP_Passthrough = src/poc_ibp_leakage_vm_passthrough.c
SRC_C_IBP_Loopback = src/poc_ibp_leakage_vm_loopback.c


# ASM Source Files
SRC_ASM = src/phr_manipulation.nasm

# Object Files
OBJ_ASM = bin/phr_manipulation.o

# Default target
all: bin bin/ibp_leakage_vm_writer.out bin/ibp_leakage_vm_reader.out bin/ibp_vm_passthrough.out bin/ibp_vm_loopback.out


# Create bin directory if it doesn't exist
bin:
	@mkdir -p bin

# Compile C files for different targets
bin/poc_ibp_leakage_vm_writer.o: $(SRC_C_IBP_Leakage_VM_Writer)
	$(CC) $(CFLAGS) -c $< -o $@

bin/poc_ibp_leakage_vm_reader.o: $(SRC_C_IBP_Leakage_VM_Reader)
	$(CC) $(CFLAGS) -c $< -o $@

bin/poc_ibp_vm_passthrough.o: $(SRC_C_IBP_Passthrough)
	$(CC) $(CFLAGS) -c $< -o $@

bin/poc_ibp_vm_loopback.o: $(SRC_C_IBP_Loopback)
	$(CC) $(CFLAGS) -c $< -o $@



# Compile NASM file
$(OBJ_ASM): $(SRC_ASM)
	$(NASM) $(NASMFLAGS) $< -o $@

# Link the object files for different targets
bin/ibp_leakage_vm_writer.out: bin/poc_ibp_leakage_vm_writer.o $(OBJ_ASM)
	$(CXX) $(LDFLAGS) $^ -o $@

bin/ibp_leakage_vm_reader.out: bin/poc_ibp_leakage_vm_reader.o $(OBJ_ASM)
	$(CXX) $(LDFLAGS) $^ -o $@

bin/ibp_vm_passthrough.out: bin/poc_ibp_vm_passthrough.o $(OBJ_ASM)
	$(CXX) $(LINK_FLAGS) $^ -o $@

bin/ibp_vm_loopback.out: bin/poc_ibp_vm_loopback.o $(OBJ_ASM)
	$(CXX) $(LINK_FLAGS) $^ -o $@

# Targets for different binaries
ibp_leakage_vm_writer: bin/ibp_leakage_vm_writer.out
	./bin/ibp_leakage_vm_writer.out
ibp_leakage_vm_reader: bin/ibp_leakage_vm_reader.out
	./bin/ibp_leakage_vm_reader.out
ibp_leakage_vm_loopback: bin/ibp_leakage_vm_loopback.out
	./bin/ibp_leakage_vm_loopback.out
ibp_leakage_vm_passthrough: bin/ibp_leakage_vm_passthrough.out
	./bin/ibp_leakage_vm_passthrough.out


# Clean the bin directory
clean:
	rm -rf bin

# Objdump the output binaries
objdump: all
	mkdir -p bin/objdump
	objdump -d bin/ibp_leakage_vm_writer.out > bin/objdump/ibp_leakage_vm_writer.objdump.nasm
	objdump -d bin/ibp_leakage_vm_reader.out > bin/objdump/ibp_leakage_vm_reader.objdump.nasm
	objdump -d bin/ibp_leakage_vm_passthrough.out > bin/objdump/ibp_leakage_vm_passthrough.objdump.nasm
	objdump -d bin/ibp_leakage_vm_loopback.out > bin/objdump/ibp_leakage_vm_loopback.objdump.nasm
	
