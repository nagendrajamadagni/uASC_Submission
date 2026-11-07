#!/bin/bash

usage() {
    echo "Usage: $0 <mode=run/asm> <number_of_reads=num_reads> [core_id=VALUE] [perf_cts=VALUE]"
}

if [ "$#" -lt 1 ]; then
    usage
    echo "Using default values"
    # exit 1
fi

#default value
mode="run"
core_id=1
perf_cts=320,205,206,219
number_of_reads=1

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
	number_of_reads)
	    number_of_reads=$value
	    ;;
        core_id)
            core_id=$value
            ;;
        perf_cts)
            perf_cts=$value
            ;;
        *)
            echo "Warning: Ignoring unrecognized option '$key'."
            ;;
    esac
done

collision=$((1 - collision))
number_of_reads=$((number_of_reads - 1))

if [[ "$mode" == "run" ]]; then
    output_file=results.out
else
    output_file=test.asm
fi

(cd ../../.. && . vars.sh)
g++ -O2 -c -m64 -oa64.o ../../../PMCTestA.cpp
nasm -f elf64 -o b64.o -i../../.. \
    -Dcounters=$perf_cts \
    -Dnumber_of_reads=$number_of_reads \
    -Pspeculative_ibp.nasm \
    ../../../TemplateB64.nasm
g++ -g -no-pie -flto -m64 a64.o b64.o -ox_test -lpthread

if [[ "$mode" == "run" ]]; then
    echo "Performing run mode operations..."
    echo -e "\n@   repeat1: $repeat1_input" >> $output_file
    echo -e "\n@@   Clock     L2_Miss     BrIndir     BrMispInd     BrMispCon" > $output_file
    taskset -c $core_id ./x_test >> $output_file
    cat $output_file
else
    echo "Performing asm mode operations..."
    objdump -d ./x_test > $output_file
fi
