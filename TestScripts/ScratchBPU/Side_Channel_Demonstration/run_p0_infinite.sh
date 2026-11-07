#!/bin/bash
#
# Builds and runs the OpenSSL victim (process 0). It loops forever, so start it
# once and leave it running while you sweep the attacker with run_p1_measure.sh.
#
# The victim never cooperates with the attacker: it just loops calling PBKDF2.
# The attacker hands the core over by blocking in nanosleep. /dev/shm is still
# cleared before launching so nothing stale from an older build is left behind.

usage() {
    echo "Usage: $0 mode=run/asm [core_id=VALUE] [perf_cts=VALUE] [secret_value=VALUE]"
}

if [ "$#" -lt 1 ]; then
    usage
    exit 1
fi

#default value
mode="run"
core_id=0
perf_cts=320,205,206
secret_value=0x12345678

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
        secret_value)
            secret_value=$value
            ;;
        *)
            echo "Warning: Ignoring unrecognized option '$key'."
            ;;
    esac
done

if [[ "$mode" == "run" ]]; then
    output_file=results.csv
else
    output_file=victim.asm
fi

echo "Running in mode: $mode"
echo "Basic options - core_id: $core_id, perf_cts: $perf_cts, secret_value: $secret_value"

(cd ../.. && . vars.sh)
rm -rf /dev/shm/shm_pid_test

g++ -O2 -c -m64 -oa64.o ../../PMCTestA_pid.cpp
nasm -f elf64 -o b64.o -i../.. \
    -Dcounters=$perf_cts \
    -Dsecret_value=$secret_value \
    -Duse_spinlocks=0 \
    -Dvictim_yield=0 \
    -Dpbkdf2_iters=10000 \
    -Pvictim.nasm \
    ../../TemplateB64_infinite_openssl.nasm
g++ -no-pie -flto -m64 a64.o b64.o ./openssl-3.5.0/libcrypto.a -ox_victim -lpthread -lrt

if [[ "$mode" == "run" ]]; then
    echo "Performing run mode operations..."
    taskset -c $core_id ./x_victim
else
    echo "Performing asm mode operations..."
    objdump -d ./x_victim > $output_file
fi
