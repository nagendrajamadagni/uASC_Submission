#!/bin/bash
#
# Builds and runs the attacker (process 1) for one measurement pass. The victim
# must already be running (see run_p0_infinite.sh), otherwise the attacker's
# nanosleep hands the core to nothing and no secret is ever written.
#
# This script does NOT patch attacker.ld. Run find_target_addr.py at least once
# first so every fake function sits on top of its libcrypto counterpart --
# any change to victim.nasm rebases the whole OpenSSL image.

usage() {
    echo "Usage: $0 mode=run/asm [core_id=VALUE] [repeat=VALUE] [perf_cts=VALUE]"
    echo "          [secret_value=VALUE] [get_higher_bits=0/1] [leak_final_6=0/1] [num_align=VALUE]"
    echo "          [sleep_ns=VALUE] [train_count=VALUE] [num_rounds=VALUE]"
    echo "          [pwsc_trials=VALUE] [pwsc_threshold=VALUE]"
}

if [ "$#" -lt 1 ]; then
    usage
    exit 1
fi

#default value
mode="run"
core_id=0
repeat=1
perf_cts=320,205,206
secret_value=0x12345678
get_higher_bits=0
leak_final_6=0
num_align=0
sleep_ns=48000000
train_count=100
num_rounds=100
# Peek-a-Walk knobs; only take effect at get_higher_bits=1.
pwsc_trials=120
pwsc_threshold=25

for arg in "$@"; do
    key=$(echo $arg | cut -f1 -d=)
    value=$(echo $arg | cut -f2 -d=)

    case $key in
        repeat)
            repeat=$value
            ;;
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
        get_higher_bits)
            get_higher_bits=$value
            ;;
        leak_final_6)
            leak_final_6=$value
            ;;
        num_align)
            num_align=$value
            ;;
        sleep_ns)
            sleep_ns=$value
            ;;
        train_count)
            train_count=$value
            ;;
        num_rounds)
            num_rounds=$value
            ;;
        pwsc_trials)
            pwsc_trials=$value
            ;;
        pwsc_threshold)
            pwsc_threshold=$value
            ;;
        *)
            echo "Warning: Ignoring unrecognized option '$key'."
            ;;
    esac
done

if [[ "$mode" == "run" ]]; then
    output_file=results.csv
else
    output_file=attacker.asm
fi

now="$(date)"
echo "Experiment date and time: $now" > $output_file
echo "Basic options - core_id: $core_id, repeat: $repeat, perf_cts: $perf_cts, output_file: $output_file" >> $output_file
echo "Attack options - secret_value: $secret_value, get_higher_bits: $get_higher_bits, leak_final_6: $leak_final_6, num_align: $num_align, sleep_ns: $sleep_ns, train_count: $train_count, num_rounds: $num_rounds, pwsc_trials: $pwsc_trials, pwsc_threshold: $pwsc_threshold" >> $output_file

echo "Running in mode: $mode"
echo "Basic options - core_id: $core_id, repeat: $repeat, perf_cts: $perf_cts, output_file: $output_file"
echo "Attack options - secret_value: $secret_value, get_higher_bits: $get_higher_bits, leak_final_6: $leak_final_6, num_align: $num_align, sleep_ns: $sleep_ns, train_count: $train_count, num_rounds: $num_rounds, pwsc_trials: $pwsc_trials, pwsc_threshold: $pwsc_threshold"

(cd ../.. && . vars.sh)

g++ -O2 -c -m64 -oa64.o ../../PMCTestA_pid.cpp
nasm -f elf64 -o b64.o -i../.. \
    -Dcounters=$perf_cts \
    -Dsecret_value=$secret_value \
    -Dget_higher_bits=$get_higher_bits \
    -Dleak_final_6=$leak_final_6 \
    -Dnum_align=$num_align \
    -Duse_spinlocks=0 \
    -Dsleep_ns=$sleep_ns \
    -Dtrain_count=$train_count \
    -Dnum_rounds=$num_rounds \
    -Dpwsc_trials=$pwsc_trials \
    -Dpwsc_threshold=$pwsc_threshold \
    -Pattacker.nasm \
    ../../TemplateB64_openssl_cross.nasm
g++ -no-pie -flto -m64 a64.o b64.o ./Peek-a-Walk-Modified/pwsc_library/build/pwsc.a \
    -ox_attacker -T attacker.ld -lpthread -lrt

if [[ "$mode" == "run" ]]; then
    echo "Performing run mode operations..."
    for (( i=0; i<$repeat; ++i ))
    do
        echo -e "\n   Clock     L2_Miss     BrIndir     BrMispInd" >> $output_file
        taskset -c $core_id ./x_attacker >> $output_file
    done
else
    echo "Performing asm mode operations..."
    objdump -d ./x_attacker > $output_file
fi
