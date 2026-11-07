# Running the end-to-end demonstration

This leaks a 32-bit secret out of an OpenSSL victim from a separate,
unprivileged process. The victim does not cooperate: it just loops calling
`PKCS5_PBKDF2_HMAC`.

## 1. Download Pre-requisites

`./build_libcrypto.sh`

Downloads OpenSSL and compiles it. Use only clang 14, as our testing environment used clang 14 and all byte offsets in the attacker is based on this. In a future release, we will make this work with any compiler.

## 2. Check the setup (1 minute)

```
./find_target_addr.py --verify_only
```

Needs no MSR driver and no isolated core. It should end with:

```
[OK]  All 13 chain offsets match attacker.nasm
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
