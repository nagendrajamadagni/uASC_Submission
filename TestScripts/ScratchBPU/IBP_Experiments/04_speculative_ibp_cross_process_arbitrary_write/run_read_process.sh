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
perf_cts=320,205,206
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
        speculative_jump)
            if [[ "$value" == "0" || "$value" == "1" ]]; then
            speculative_jump=$value
            else
            echo "Error: speculative_jump must be one of '0' or '1'."
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
        *)
            echo "Warning: Ignoring unrecognized option '$key'."
            ;;
    esac
done

if [[ "$mode" == "run" ]]; then
    output_file=results.csv
else
    output_file=read_process_objdump.asm
fi

now="$(date)"
echo "Experiment date and time: $now" > $output_file
echo "Basic options - core_id: $core_id, perf_cts: $perf_cts, output_file: $output_file" >> $output_file

echo "Running in mode: $mode"
echo "Basic options - core_id: $core_id, perf_cts: $perf_cts, output_file: $output_file"

(cd ../../.. && . vars.sh)

num_alaised_branch=1
g++ -O2 -c -m64 -oa64.o ../../../PMCTestA_pid.cpp
nasm -f elf64 -o b64.o -i../../.. \
    -Dcounters=$perf_cts \
    -Dspeculative_jump=$speculative_jump\
    -Pread_process.nasm \
    ../../../TemplateB64_smt.nasm
g++ -no-pie -flto -m64 a64.o b64.o -ox_test_p1 -lpthread -lrt

if [[ "$mode" == "run" ]]; then
    echo "Performing run mode operations..."
    echo -e "\n   Clock     L2_Miss     BrIndir     BrMispInd" >> $output_file
    taskset -c $core_id ./x_test_p1 >> $output_file
    cat $output_file
else
    echo "Performing asm mode operations..."
    objdump -d ./x_test_p1 > $output_file
fi
