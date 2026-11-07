#!/bin/bash

usage() {
    echo "Usage: $0 <mode=run/asm> <speculative_jump=0/1> [core_id=VALUE] [perf_cts=VALUE] [read_count=VALUE]"
}

if [ "$#" -lt 1 ]; then
    usage
    echo "Using default values"
    #exit 1
fi

#default value
mode="run"
core_id=1
perf_cts=320,205,206,211
speculative_jump=1
read_count=100

for arg in "$@"; do
    key=$(echo $arg | cut -f1 -d=)
    value=$(echo $arg | cut -f2 -d=)

    case $key in
        mode)
            if [[ "$value" == "run" || "$value" == "asm" ]]; then
                mode=$value
            else
                echo "Error: mode must be one of 'run' or 'asm'."
                usage
                exit 1
            fi
            ;;
        core_id)
            core_id=$value
            ;;
        perf_cts)
            perf_cts=$value
            ;;
        read_count)
            read_count=$value
            ;;
        speculative_jump)
            if [[ "$value" == "1" || "$value" == "0" ]]; then
                speculative_jump=$value
            else
                echo "Error: speculative_jump must be one of '0' or '1'."
                usage
                exit 1
            fi
            ;;
        *)
            echo "Warning: Ignoring unrecognized option '$key'."
            ;;
    esac
done

if [[ "$mode" == "run" ]]; then
    output_file=results.out
else
    output_file=test.asm
fi

# Section base addresses.  Both the reader and the injector live at bases whose
# low 24 bits are zero, so pinning their indirect branches to the same offset
# aligns them on PC[23:0].  The reader is at high16=0x0001, the injector at
# high16=0x0000; the reader therefore reconstructs the injector's low-32 target
# (0x02032033) as 0x102032033, which is sec_reader_landing_addr + 0x33.
sec_spec_reader_addr=0x100000000
sec_spec_injection_addr=0x2000000
sec_reader_landing_addr=0x102032000
link_script_file=script.ld
ld --verbose > $link_script_file
python3 gen_linker_script.py $link_script_file $sec_spec_reader_addr $sec_spec_injection_addr $sec_reader_landing_addr

(cd ../../.. && . vars.sh)
g++ -O2 -c -m64 -oa64.o ../../../PMCTestA.cpp
nasm -f elf64 -o b64.o -i../../.. \
    -Dcounters=$perf_cts \
    -Dsec_spec_reader_addr=$sec_spec_reader_addr \
    -Dsec_spec_injection_addr=$sec_spec_injection_addr \
    -Dsec_reader_landing_addr=$sec_reader_landing_addr \
    -Dspeculative_jump=$speculative_jump \
    -Dread_count=$read_count \
    -Pspeculative_btb.nasm \
    ../../../TemplateB64.nasm
g++ -mcmodel=large -T $link_script_file -g -no-pie -flto -fPIC -m64 a64.o b64.o -ox_test -lpthread

if [[ "$mode" == "run" ]]; then
    echo "Performing run mode operations..."
    echo -e "\n@   repeat1: $repeat1_input" >> $output_file
    echo -e "\n@@   Clock     L2_Miss     BrIndir     BrMispInd     BrClear" > $output_file
    taskset -c $core_id ./x_test >> $output_file
    cat $output_file
else
    echo "Performing asm mode operations..."
    objdump -d ./x_test > $output_file
fi
