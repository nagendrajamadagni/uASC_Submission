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
SRC_C_IBP_Leakage_Writer = src/writer.c
SRC_C_IBP_Leakage_Reader = src/reader.c

# ASM Source Files
SRC_ASM = src/phr_manipulation.nasm

# Object Files
OBJ_ASM = bin/phr_manipulation.o

# Symbols that MUST live at the same address in both binaries for the
# channel to work (see MEASUREMENT.md, "Code layout invariant")
CRITICAL_SYMS = target_spy victim_spy victim_function clear_phr set_phr

# Default target
all: bin bin/ibp_leakage_writer.out bin/ibp_leakage_reader.out verify


# Create bin directory if it doesn't exist
bin:
	@mkdir -p bin

bin/poc_ibp_leakage_writer.o: $(SRC_C_IBP_Leakage_Writer)
	$(CC) $(CFLAGS) -c $< -o $@

bin/poc_ibp_leakage_reader.o: $(SRC_C_IBP_Leakage_Reader)
	$(CC) $(CFLAGS) -c $< -o $@

# Compile NASM file
$(OBJ_ASM): $(SRC_ASM)
	$(NASM) $(NASMFLAGS) $< -o $@

# Link the object files for different targets
bin/ibp_leakage_writer.out: bin/poc_ibp_leakage_writer.o $(OBJ_ASM)
	$(CXX) $(LDFLAGS) $^ -o $@

bin/ibp_leakage_reader.out: bin/poc_ibp_leakage_reader.o $(OBJ_ASM)
	$(CXX) $(LDFLAGS) $^ -o $@


# Targets for different binaries
ibp_leakage_writer: bin/ibp_leakage_writer.out
	./bin/ibp_leakage_writer.out
ibp_leakage_reader: bin/ibp_leakage_reader.out
	./bin/ibp_leakage_reader.out


# Verify the code layout invariant the channel depends on:
#  1. the critical symbols sit at identical addresses in both binaries, and
#  2. the two indirect call sites agree in their low 16 bits, so they alias
#     in the IBP once the PHR matches.
verify: bin/ibp_leakage_writer.out bin/ibp_leakage_reader.out
	@fail=0; \
	for s in $(CRITICAL_SYMS); do \
	  w=`nm bin/ibp_leakage_writer.out | grep -w $$s | head -1 | awk '{print $$1}'`; \
	  r=`nm bin/ibp_leakage_reader.out | grep -w $$s | head -1 | awk '{print $$1}'`; \
	  if [ "$$w" != "$$r" ]; then \
	    echo "LAYOUT MISMATCH: $$s writer=$$w reader=$$r"; fail=1; \
	  fi; \
	done; \
	wc=`objdump -d --start-address=0x\`nm bin/ibp_leakage_writer.out | grep -w victim_spy | awk '{print $$1}'\` \
	     bin/ibp_leakage_writer.out | grep -m1 -E 'call +\*' | awk '{print $$1}' | tr -d :`; \
	rc=`objdump -d --start-address=0x\`nm bin/ibp_leakage_reader.out | grep -w victim_function | awk '{print $$1}'\` \
	     bin/ibp_leakage_reader.out | grep -m1 -E 'call +\*' | awk '{print $$1}' | tr -d :`; \
	wl=`printf '%d' $$((0x$$wc & 0xffff))`; rl=`printf '%d' $$((0x$$rc & 0xffff))`; \
	if [ "$$wl" != "$$rl" ]; then \
	  echo "ALIASING BROKEN: writer call *0x$$wc vs reader call *0x$$rc (low 16 bits differ)"; fail=1; \
	else \
	  echo "layout OK: critical symbols aligned; indirect calls 0x$$wc / 0x$$rc alias on low 16 bits"; \
	fi; \
	if [ $$fail -ne 0 ]; then \
	  echo "*** The covert channel will NOT work with this build. ***"; exit 1; \
	fi

# Clean the bin directory
clean:
	rm -rf bin

# Objdump the output binaries
objdump: all
	mkdir -p bin/objdump
	objdump -d bin/ibp_leakage_writer.out > bin/objdump/ibp_leakage_writer.objdump.nasm
	objdump -d bin/ibp_leakage_reader.out > bin/objdump/ibp_leakage_reader.objdump.nasm

