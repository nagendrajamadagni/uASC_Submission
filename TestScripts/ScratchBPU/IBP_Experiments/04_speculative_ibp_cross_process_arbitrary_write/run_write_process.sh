#!/bin/bash

usage() {
    echo "Usage: $0 <mode=run/asm> [core_id=VALUE] [perf_cts=VALUE]"
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
        *)
            echo "Warning: Ignoring unrecognized option '$key'."
            ;;
    esac
done

if [[ "$mode" == "run" ]]; then
    output_file=results.csv
else
    output_file=write_process_objdump.asm
fi

echo "Running in mode: $mode"
echo "Basic options - core_id: $core_id, perf_cts: $perf_cts"

(cd ../../.. && . vars.sh)
rm -rf /dev/shm/shm_pid_test

num_alaised_branch=1
g++ -O2 -c -m64 -oa64.o ../../../PMCTestA_pid.cpp
nasm -f elf64 -o b64.o -i../../.. \
    -Dcounters=$perf_cts \
    -Pwrite_process.nasm \
    ../../../TemplateB64_infinite.nasm
g++ -no-pie -flto -m64 a64.o b64.o -ox_test_p0 -lpthread -lrt

if [[ "$mode" == "run" ]]; then
    echo "Performing run mode operations..."
    taskset -c $core_id ./x_test_p0
else
    echo "Performing asm mode operations..."
    objdump -d ./x_test_p0 > $output_file
fi
