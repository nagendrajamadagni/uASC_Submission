#!/bin/bash

usage() {
    echo "Usage: $0 <mode=run/asm> <speculative_jump=0/1> [core_id=VALUE] [perf_cts=VALUE]"
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
speculative_jump=0

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

sec_test_ibranch_addr=0x100000000
sec_gadget_addr=0x2000000
sec_test_target_addr=0x102032000
link_script_file=script.ld
ld --verbose > $link_script_file
python3 gen_linker_script.py $link_script_file $sec_test_ibranch_addr $sec_gadget_addr $sec_test_target_addr

(cd ../../.. && . vars.sh)
g++ -O2 -c -m64 -oa64.o ../../../PMCTestA.cpp
nasm -f elf64 -o b64.o -i../../.. \
    -Dcounters=$perf_cts \
    -Dsec_test_ibranch_addr=$sec_test_ibranch_addr \
    -Dsec_test_target_addr=$sec_test_target_addr \
    -Dspeculative_jump=$speculative_jump \
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
