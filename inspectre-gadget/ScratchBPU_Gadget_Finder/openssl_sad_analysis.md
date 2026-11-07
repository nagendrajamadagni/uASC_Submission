# OpenSSL SAD Gadget Analysis — Full Context Document

This document records the complete context of an InSpectre Gadget SAD (Secret-At-Dispatch)
analysis run against 15 OpenSSL build variants. It is written so that another agent or
researcher can pick up and continue the work without any prior context.

---

## 1. Background: Spectre and Transient Execution

Modern CPUs speculatively execute instructions before all prior conditions are resolved.
When a branch or indirect jump is mispredicted, the CPU rolls back the architectural state
(registers, memory writes) but does **not** roll back microarchitectural side effects such
as cache state changes. An attacker who can observe the cache can infer what data was
accessed during the speculative window.

The canonical Spectre attack has two phases:

1. **Trigger**: cause the CPU to speculatively execute code that accesses secret data.
2. **Observe**: use a cache timing side-channel (e.g., Flush+Reload) to determine which
   cache lines were loaded, recovering the secret value.

---

## 2. What is a SAD Gadget?

A **Secret-At-Dispatch (SAD) gadget** fires when an indirect jump or call instruction
executes while one or more general-purpose registers hold a **secret value** — regardless
of whether the jump target itself is attacker-controlled.

### Why indirect jumps matter

When the CPU encounters an indirect jump (`jmp *%rax`, `call *[rdi+0x40]`, PLT stubs),
it predicts the target using the Branch Target Buffer (BTB) before resolving the actual
address. It then speculatively executes instructions at the **predicted** target. In that
speculative window, all registers from before the jump are still live and available to
whatever code runs speculatively.

If any register holds a pointer to secret bytes, a gadget inside the speculative window
can use that pointer as a load address, pulling the secret into the cache, where it can
be observed by the attacker.

### SAD vs. other gadget types

| Gadget type | What it requires |
|---|---|
| **Transmission** | A secret-derived value is used as a memory load address (loads secret into cache) |
| **TFP** (Tainted Function Pointer) | The *jump target* is attacker-controlled (speculative redirect) |
| **SAD** | A *secret value* is live in a register at an indirect jump, regardless of who controls the target |

SAD gadgets are detected independently of TFP gadgets. A single indirect jump can
simultaneously be all three: TFP (attacker controls target), SAD (secret register is live),
and CODE_LOAD transmission (loading the function pointer itself leaks information).

### InSpectre detection

InSpectre Gadget detects SAD gadgets in `scanner.py:check_secret_at_dispatch`, called
from `exit_hook_before` every time symbolic execution reaches an indirect jump. It records:

- `jump_target_reg` — which register or memory expression is being jumped through
- `jump_target_expr` — the symbolic expression of the target
- `secret_regs` — list of registers that hold secret-annotated values at the moment of dispatch
- `secret_reg_exprs` — symbolic expression for each secret register's value
- `secret_reg_load_depths` — how many memory dereferences deep the secret is (1 = direct pointer)
- `secret_reg_addresses` — the symbolic address from which each secret was loaded (or `secret_src_<reg>` if it was seeded at entry)

---

## 3. The Complete Attack Chain

A SAD gadget alone does not extract bytes. It must be chained with a **transmission gadget**
in the speculative window. The full chain:

```
Step 1 — Attacker mistrains the CPU's branch predictor for the indirect jump
          (done repeatedly using a controlled process or from another execution context)

Step 2 — Victim process reaches the indirect jump
          CPU predicts the target (attacker-influenced via BTB mistrain)
          CPU speculatively executes code at the PREDICTED target

Step 3 — In the speculative window, a transmission gadget fires:
          e.g., MOV rax, [rsi]        ; rsi = pointer to secret bytes
               MOV rbx, [array + rax*8] ; loads cache line based on secret byte value

Step 4 — CPU detects misprediction, rolls back register state
          But the cache line loaded in Step 3 remains warm

Step 5 — Attacker probes cache lines (Flush+Reload)
          The warm cache line reveals the value of the secret byte
```

The SAD gadget provides **Step 2**: a register with a secret pointer is live at an indirect
jump. The transmission gadget provides **Step 3**: code at the speculative target uses that
register to load secret bytes into cache.

### Why "even partial leaks" can be catastrophic

The impact of a partial leak depends heavily on what the secret is:

- **Cryptographic keys (AES-256, Ed25519)**: 256-bit entropy. You need ~28-31 of 32 bytes
  before brute force becomes feasible. Partial leaks are significant but not immediately fatal.
- **Passwords**: Typical entropy 30-50 bits. Even 4-6 leaked characters plus the known
  character set dramatically narrows dictionary attacks — potentially from billions of
  candidates to tens. Combined with public context (like an SRP salt), even partial
  knowledge enables offline attacks with no server interaction.
- **MAC keys**: Any partial leak of an HMAC/CMAC key enables brute-force forgery. The
  attacker needs the full key to forge, but partial knowledge + offline search is cheap
  for short or derived keys.

---

## 4. OpenSSL Analysis Pipeline

### Target

OpenSSL `libcrypto.so.3` built with GCC and Clang at 15 optimization levels:

```
clang_O0  clang_O1  clang_O2  clang_O3  clang_Ofast  clang_Og  clang_Os  clang_Oz
gcc_O0    gcc_O1    gcc_O2    gcc_O3    gcc_Ofast    gcc_Og    gcc_Os
```

Binaries are at: `/home/njamadagni/gadget_search/openssl/builds/<BUILD>/libcrypto.so.3`

### Analysis files

| File | Purpose |
|---|---|
| `secret_leaker/openssl_secret_regs_raw_only.csv` | Master template: 48 functions with secret register annotations. Human-readable, with `#` comments. |
| `secret_leaker/openssl_secret_regs.csv` | Extended list including functions with expanded key structs (not raw bytes). |
| `secret_leaker/gen_build_csv.py` | Resolves function names to per-build addresses via `nm -D`, writes a clean comment-free `address_list.csv` into each build dir. |
| `secret_leaker/run_openssl_sad.sh` | Runs one full analysis: calls `gen_build_csv.py`, then `./inspectre analyze`. Takes BUILD_NAME as argument. |
| `config_sad_only.yaml` | InSpectre config: SAD only (TFP/SDB/HalfSpectre disabled), MaxBB=5, Z3Timeout=10000ms. |

### Template CSV format

`openssl_secret_regs_raw_only.csv` uses the InSpectre address-list format with a third column:

```
hex_address,function_name,secret_reg1:secret_reg2
```

The addresses in this template are from the **gcc_O3** build. `gen_build_csv.py` discards
them and resolves fresh addresses for each build via `nm -D libcrypto.so.3`. The secret
register column is the same for all builds (calling convention is fixed).

**Critical**: InSpectre's `parse_gadget_list` does NOT skip `#` comment lines. The
`gen_build_csv.py` script strips all comments before writing the per-build CSV.

### Why per-build address resolution

Each compiler/optimization combination produces different symbol offsets. Using the same
hex addresses across builds would point into arbitrary code. `nm -D` gives the correct
RVA for each build. Version suffixes like `@@OPENSSL_3.0.0` are stripped with
`.split("@@")[0]`.

### Running a build

```bash
cd /home/njamadagni/inspectre-gadget
bash secret_leaker/run_openssl_sad.sh gcc_O3
```

Results go to `/home/njamadagni/gadget_search/openssl/results/<BUILD>/`:
- `sad.csv` — gadget output
- `run.log` — full InSpectre stdout/stderr
- `gen_csv.log` — address resolution log (lists any missing functions with `WARNING: MISSING:`)
- `asm/` — annotated assembly for each analyzed function

### Known issues fixed during this analysis

1. **InSpectre appends to existing `sad.csv`** instead of overwriting. Fixed by adding
   `rm -f "$RESULT_DIR/sad.csv"` at the start of `run_openssl_sad.sh` before `inspectre analyze`.

2. **CRYPTO_gcm128_init, CRYPTO_ctr128_encrypt, CRYPTO_ccm128_init** were initially included
   with their `void *key` parameter annotated as secret. In fact that parameter receives an
   `AES_KEY*` struct containing the **expanded key schedule** (round keys), not raw key bytes.
   All three were removed from `openssl_secret_regs_raw_only.csv`. They remain in the
   extended `openssl_secret_regs.csv`.

3. **EVP_PKEY_new_raw_private_key_ex** was initially annotated with `rdx` as the secret
   register. The correct register is `rcx`. The function signature is:
   ```c
   EVP_PKEY_new_raw_private_key_ex(OSSL_LIB_CTX *libctx,   // rdi
                                   const char   *keytype,   // rsi
                                   const char   *propq,     // rdx ← NOT secret (property query string)
                                   const unsigned char *priv, // rcx ← SECRET (raw private key)
                                   size_t len)              // r8
   ```
   Annotating `rdx` caused a false-positive SAD gadget for `propq` (a non-secret string).

---

## 5. Secret Register Annotations — What Each Function Contributes

The calling convention is System V AMD64 ABI:
`rdi`=arg1, `rsi`=arg2, `rdx`=arg3, `rcx`=arg4, `r8`=arg5, `r9`=arg6.

At O1+, the compiler spills arguments to callee-saved registers (`rbx`, `rbp`, `r12`–`r15`)
early in the prologue. These copies stay live throughout the function and are visible as
additional secret registers at dispatch sites.

| Function | Secret reg | What it holds |
|---|---|---|
| `AES_set_encrypt_key` | `rdi` | Pointer to raw AES key bytes (128/192/256-bit) |
| `AES_set_decrypt_key` | `rdi` | Same |
| `DES_set_key` / `_checked` / `_unchecked` | `rdi` | Pointer to 8-byte raw DES key block |
| `BF_set_key` | `rdx` | Pointer to raw Blowfish key bytes |
| `CAST_set_key` | `rdx` | Pointer to raw CAST key bytes |
| `Camellia_set_key` | `rdi` | Pointer to raw Camellia key bytes |
| `RC4_set_key` | `rdx` | Pointer to raw RC4 key bytes |
| `RC2_set_key` | `rdx` | Pointer to raw RC2 key bytes |
| `IDEA_set_encrypt_key` | `rdi` | Pointer to raw IDEA key bytes |
| `SEED_set_key` | `rdi` | Pointer to raw SEED key bytes |
| `HMAC` | `rsi` | Pointer to raw HMAC key bytes |
| `HMAC_Init_ex` / `HMAC_Init` | `rsi` | Pointer to raw HMAC key bytes |
| `EVP_MAC_init` | `rsi` | Pointer to raw MAC key bytes (any algorithm) |
| `EVP_EncryptInit_ex` / `DecryptInit_ex` / `CipherInit_ex` | `rcx` | Pointer to raw cipher key bytes |
| `DES_string_to_key` / `DES_string_to_2keys` | `rdi` | Pointer to raw password string (used to derive DES key) |
| `EVP_BytesToKey` | `rcx` | Pointer to raw passphrase/key material |
| `PKCS5_PBKDF2_HMAC` / `_SHA1` | `rdi` | Pointer to raw password |
| `EVP_PBE_scrypt` / `_ex` | `rdi` | Pointer to raw password |
| `EVP_PBE_CipherInit` / `_ex` | `rsi` | Pointer to raw password |
| `PKCS5_PBE_keyivgen` / `_ex` | `rsi` | Pointer to raw password |
| `PKCS12_key_gen_asc` / `_ex` | `rdi` | Pointer to ASCII password |
| `PKCS12_key_gen_utf8` / `_ex` | `rdi` | Pointer to UTF-8 password |
| `PKCS12_key_gen_uni` / `_ex` | `rdi` | Pointer to Unicode password bytes |
| `PKCS12_gen_mac` | `rsi` | Pointer to password |
| `PKCS8_encrypt` / `_ex` | `rdx` | Pointer to passphrase |
| `CMS_decrypt_set1_password` | `rsi` | Pointer to password |
| `SRP_Calc_x` / `SRP_Calc_x_ex` | `rdx` | Pointer to raw SRP password string |
| `SRP_create_verifier` / variants | `rsi` | Pointer to raw SRP password string |
| `EVP_PKEY_new_raw_private_key` | `rdx` | Pointer to raw private key bytes (Ed25519, X25519, etc.) |
| `EVP_PKEY_new_raw_private_key_ex` | `rcx` | Same (shifted by extra libctx/keytype/propq args) |

---

## 6. Completed Runs and Results

As of analysis completion, four GCC builds have been run with the fully-corrected 48-entry
CSV (both fixes applied):

| Build | Gadget rows | Unique functions |
|---|---|---|
| gcc_O0 | 7 | 5 |
| gcc_O1 | 12 | 9 |
| gcc_O2 | 18 | 11 |
| gcc_O3 | 20 | 12 |

Results are at:
```
/home/njamadagni/gadget_search/openssl/results/
  gcc_O0/sad.csv
  gcc_O1/sad.csv
  gcc_O2/sad.csv
  gcc_O3/sad.csv
```

The remaining 11 builds (all Clang variants plus gcc_Ofast/Og/Os) have not been run with
the corrected CSV and need fresh runs.

---

## 7. Gadget Catalog (Priority Order)

Functions are ranked by the danger of a **partial** secret leak.

---

### TIER 1 — Partial bytes are immediately catastrophic

#### `SRP_Calc_x` / `SRP_Calc_x_ex` / `SRP_create_verifier_BN_ex`

**Present in**: gcc_O1 (`_ex` only), gcc_O2 (both), gcc_O3 (both).
**Absent in**: gcc_O0 (see Section 8 for why).

**Signature**:
```c
BIGNUM *SRP_Calc_x(const BIGNUM *s,    // rdi — salt (public)
                   const char   *user, // rsi — username (public)
                   const char   *pass) // rdx ← SECRET — raw password string
```

`SRP_Calc_x` is a two-instruction wrapper that zeros `rcx` and `r8` and jumps to
`SRP_Calc_x_ex`. The secret is in `rdx` at function entry.

**What happens inside the function**:
The function computes `x = SHA1(s || SHA1(user || ":" || pass))`. InSpectre explores
multiple symbolic paths through the function. On each path it eventually reaches a PLT
call (e.g., `EVP_DigestInit_ex`). At that point:

- `r13` = clean callee-saved copy of the original `rdx` (password pointer). This is the
  most reliable secret register — it holds the unmodified password pointer.
- `rdx` = password pointer with low byte potentially clobbered by the null-check
  (`sete %dl` at instruction `0x294bd3`). The symbolic expression for `rdx` at dispatch is:
  `rdx[63:8] .. 0 .. (if rdx == 0x0 then 1 else 0)` — the upper 56 bits are still the
  password address, only the low byte is contaminated.

Multiple gadget rows appear per function (3 for `Calc_x`, 4 for `Calc_x_ex`) because
InSpectre found that many symbolic paths all reaching the same dispatch site.

**Why partial leaks are catastrophic**:

SRP is designed so the server never sees the password. The protocol sends `s` (the salt)
in cleartext as the first message. An attacker who can eavesdrop on the SRP handshake
already has the salt and the username. SHA-1 has no work factor (it is designed to be fast).

Given: salt `s` (public), username (public), partial password characters (leaked),
the attacker runs an offline dictionary attack:
```
for each candidate password:
    x = SHA1(s || SHA1(user || ":" || candidate))
    if candidate[:leaked_bytes] == leaked_prefix:
        check against SRP transcript
```

For a typical 10-character password with only 6 characters leaked, the search space drops
from ~10^10 to ~10^4 (assuming known character set). No server interaction is required.
Millisecond recovery.

**Real-world deployments using SRP**:
- Apple HomeKit / HAP (HomeKit Accessory Protocol) — SRP-6a for device pairing. The
  "secret" is the 8-digit device PIN (only ~27 bits of entropy). Any leak is fatal.
- 1Password — uses SRP to authenticate to 1password.com without transmitting the master
  password. Master password compromise exposes the entire vault.
- TLS-SRP (RFC 5054) — TLS ciphersuites used in some enterprise VPNs and internal services.
- RADIUS/EAP-SRP — network authentication.

---

### TIER 2 — Authentication key compromise (message forgery)

#### `EVP_MAC_init` ← present in ALL FOUR builds

**Signature**:
```c
int EVP_MAC_init(EVP_MAC_CTX *ctx,           // rdi
                 const unsigned char *key,    // rsi ← SECRET — pointer to raw MAC key bytes
                 size_t keylen,              // rdx
                 const OSSL_PARAM params[])  // rcx
```

**What the function does** (from disassembly — gcc_O3):
```asm
EVP_MAC_init:
  mov    (%rdi),    %rax      ; rax = ctx->meth      (pointer to EVP_MAC struct)
  mov  0x40(%rax), %rax      ; rax = meth->init      (function pointer at vtable offset 0x40)
  test   %rax,     %rax      ; if meth->init == NULL → error
  je     <error>
  mov  0x8(%rdi),  %rdi      ; rdi = ctx->algctx     (algorithm-specific inner context)
  jmp   *%rax                ; ← SAD dispatch #1
```

`EVP_MAC_init` is a 5-instruction dispatch stub. It never touches `rsi`. The key pointer
rides through unchanged to whichever implementation's `init` function gets called
(`ossl_hmac_init`, `ossl_cmac_init`, `ossl_poly1305_init`, etc.).

**Two dispatch sites per run**:

1. **Internal vtable dispatch** (`pc_symbol = EVP_MAC_init`):
   - Jump target: `LOAD[LOAD[rdi] + 0x40]` — this is also `rax`. The jump target IS `rax`.
   - Secret registers: `rsi` (MAC key), `rax` (vtable fn pointer — code address), `rdi`
     (inner context)
   - `rax` is SIMULTANEOUSLY the jump target and tainted (depth 2 from attacker-controlled
     `rdi`). This makes this dispatch a **TFP gadget** as well as a SAD gadget. An attacker
     who controls the `EVP_MAC_CTX` object can steer speculative execution to any function
     pointer, and `rsi` (the MAC key) is live during that speculative execution.

2. **PLT dispatch** (`pc_symbol = _init`):
   - Jump target: fixed GOT entry — not attacker-steerable
   - Secret registers: `rsi` (MAC key), `rax` (vtable pointer, carried forward)

**What `rsi` contains**: A pointer to the raw bytes of the MAC key in memory. The actual
key bytes are at the address stored in `rsi`. Their length depends on the algorithm: 32
bytes for HMAC-SHA256 or Poly1305, 16 bytes for HMAC-SHA1 or CMAC-AES128, etc.

**What leaking `rax` gives**: `rax` is a code pointer (vtable entry, e.g., `ossl_hmac_init`).
It is NOT the key. Leaking it defeats ASLR for `libcrypto.so.3`. This is useful for
chaining further attacks but does not by itself expose the MAC key.

**What leaking `rsi` gives**: Direct access to the MAC key. With the full key, an attacker
can forge any HMAC/CMAC/Poly1305-authenticated message — session tokens, API signatures,
integrity-protected data, etc. This covers all MAC algorithms routed through the EVP
framework.

**Coverage**: Every OpenSSL application that uses `EVP_MAC_init` for HMAC, CMAC, Poly1305,
SipHash, BLAKE2-MAC, or GMAC is affected. This is the most widely-used MAC interface in
OpenSSL 3.x.

---

#### `HMAC_Init_ex` — present in gcc_O2, gcc_O3

**Signature**:
```c
int HMAC_Init_ex(HMAC_CTX *ctx,       // rdi
                 const void *key,     // rsi ← SECRET
                 int key_len,         // rdx
                 const EVP_MD *md,    // rcx
                 ENGINE *impl)        // r8
```

**Secret registers at dispatch**:
- `rsi` — original key pointer (depth 1, from `secret_src_rsi`)
- `r13` — callee-saved copy of `rsi` (O2+ spills argument to `r13` early in prologue)
- `r15` — loaded from `LOAD[rdi]` — this is the HMAC_CTX's internal `EVP_MD_CTX*` or
  previously-stored key pointer. It is depth 1 from `rdi` (the context object).

Three registers simultaneously holding the HMAC key pointer at the PLT dispatch means
an attacker has multiple paths to reach the key in the speculative window.

---

### TIER 3 — Password leaked, no work factor

#### `DES_string_to_key` / `DES_string_to_2keys` — present in gcc_O1, O2, O3

**Signature**:
```c
void DES_string_to_key(const char *str, DES_cblock *key)
//                      rdi ← SECRET    rsi
```

**Dispatch event**: The first instruction after the prologue is `call strlen@plt`. Before
that call, the prologue saves `rdi` to a callee-saved register (`rbp` at O1, `rbx` at
O2/O3). At the PLT jump:
- `rdi` = the password pointer (unchanged — about to be passed to strlen)
- `rbp`/`rbx` = callee-saved copy of password pointer

Both registers hold the password pointer at dispatch.

**Use case**: Kerberos authentication (DES-CBC-CRC, DES-CBC-MD5 enctypes). In Active
Directory environments with legacy enctypes enabled, this function is called for every
Kerberos TGT request — i.e., every Windows domain login.

**Why partial leaks are bad**: The password is a user-chosen domain credential. Typical
entropy: 30-50 bits. DES keys are only 56 effective bits and have been brute-forceable
since 1998. Leaking any characters of the password enables narrowed dictionary attacks
against the domain account.

**Absent in gcc_O0**: At O0, the prologue does `push rbp; mov %rsp, %rbp` style setup
but does not spill `rdi` to a callee-saved register before the first PLT call. InSpectre
does not see it as live.

---

#### `PKCS12_key_gen_asc_ex` / `utf8_ex` / `uni` / `uni_ex` — present in all four builds

These functions derive encryption keys from a PKCS12 passphrase using the PKCS12 KDF
(based on SHA-1 iteration). The passphrase pointer is in `rdi`. At the first PLT dispatch:
- `rdi` = original passphrase pointer (still live)
- `rbx` (O2/O3) or `rax` (O0) = copy of passphrase pointer

**Use case**: Protecting exported private key files (`.pfx` / `.p12` containers). The
passphrase is user-chosen. Compromise enables private key extraction.

---

#### `PKCS8_encrypt_ex` — present in all four builds

```c
int PKCS8_encrypt_ex(int pbe_nid, const EVP_CIPHER *cipher,
                     const char *pass, int passlen,  // rdx ← SECRET
                     ...)
```

The passphrase is in `rdx`. At O1+ it is also spilled to `r15` or `rbp`. Protects stored
private keys in PKCS8 format (PEM files with `-----BEGIN ENCRYPTED PRIVATE KEY-----`).

---

### TIER 4 — Password with work factor (slower offline attack)

#### `EVP_PBE_scrypt_ex` — present in all four builds

scrypt is a memory-hard KDF. The password pointer (`rdi`, spilled to `rbp` at O1+) is
live at the first PLT dispatch. The work factor (N, r, p parameters) substantially
increases offline attack cost — but partial knowledge of the password bytes still narrows
the search space, especially for dictionary attacks. scrypt does not eliminate the threat,
it only raises the bar.

#### `EVP_PBE_CipherInit_ex` — present in gcc_O3 only

Password-based encryption context init. The password `rsi` is spilled to `rbp` at O3.
Only appears in the most aggressively optimized build, suggesting it's structurally
reachable only when certain inlining decisions are made.

---

### TIER 5 — High-value key but partial leaks require most of it

#### `EVP_PKEY_new_raw_private_key_ex` — present in gcc_O3 ONLY

**Signature**:
```c
EVP_PKEY *EVP_PKEY_new_raw_private_key_ex(
    OSSL_LIB_CTX        *libctx,  // rdi
    const char          *keytype, // rsi
    const char          *propq,   // rdx — NOT secret (property query string)
    const unsigned char *priv,    // rcx ← SECRET — raw private key bytes
    size_t              len)      // r8
```

**What `rcx` holds**: A pointer to the 32-byte raw private key for Ed25519 or X25519
(or 57 bytes for Ed448/X448). This is the private scalar — the most sensitive possible
key material. Compromise of the private key breaks all past and future sessions for that
key.

**Why only gcc_O3**: The path to the first dispatch site where `rcx` is still live as a
callee-saved register only manifests with gcc's highest optimization level. At lower levels,
the function's structure differs enough that InSpectre's MaxBB=5 budget exhausts before
reaching that point, or `rcx` has been consumed and not spilled.

**Why Tier 5**: Full 32 bytes are needed for the brute-force attack to be feasible.
Leaking 12 of 32 bytes leaves 160 bits unknown — far beyond any conceivable brute force.
However, any leak breaks ASLR and provides a pointer to the key in memory, enabling a
chained transmission gadget to read the full key.

---

## 8. Cross-Build Patterns

### Why gcc_O0 finds fewer gadgets

At `-O0`, GCC generates unoptimized code that pushes all function arguments to the stack
at the prologue and uses `push`/`pop` sequences for callee-saved registers. By the time
the first PLT call fires, `rdi`/`rsi`/`rdx` have typically been stored on the stack (not
in callee-saved registers). InSpectre's SAD detector only checks architectural registers,
not stack contents — so it does not see the secret as "live" at the dispatch.

This is **not a defense**. The real CPU is equally vulnerable at O0. It is an artifact
of InSpectre's register-level detection combined with MaxBB=5 exploration depth.

At O1+, the register allocator assigns callee-saved registers (`rbx`, `rbp`, `r12`–`r15`)
to hold function arguments that survive across calls. These spills happen at the prologue
— before any dispatch fires — so the secret is live in named registers throughout the
function body.

### Gadget count scaling with optimization

| Build | Unique gadget functions | New functions vs. prior level |
|---|---|---|
| O0 | 5 | baseline |
| O1 | 9 | +SRP_Calc_x_ex, +SRP_create_verifier_BN_ex, +DES_string_to_key, +DES_string_to_2keys |
| O2 | 11 | +SRP_Calc_x (wrapper now visible), +HMAC_Init_ex |
| O3 | 12 | +EVP_PKEY_new_raw_private_key_ex, +EVP_PBE_CipherInit_ex |

### Multiple paths for the same function

SRP functions show 3-4 gadget rows each. These are distinct symbolic paths through the
function that InSpectre explored — each path leads to the same PLT dispatch (e.g.,
`EVP_DigestInit_ex`) but arrived there via a different sequence of branches. The gadget
is real and reachable from all of them.

---

## 9. Technical Details for InSpectre

### Configuration used (`config_sad_only.yaml`)

```yaml
TaintedFunctionPointers: False
SecretDependentBranches: False
HalfSpectre: False
SecretAtDispatch: True
MaxBB: 5
Z3Timeout: 10000
```

Transmission and TFP detection are disabled to focus solely on SAD gadgets and reduce
analysis time. A full run with all gadget types enabled would produce TFP gadgets for
`EVP_MAC_init` (the vtable dispatch where `rax` is simultaneously the tainted jump target
and a secret-annotated value).

### Seeding secret registers

InSpectre is told which registers hold secrets at function entry via the third column of
the address-list CSV:

```
0x1ebe60,EVP_MAC_init,rsi
```

This causes `scanner.py:initialize_regs_and_stack` to overwrite `rsi` with a fresh BVS
symbol carrying `SecretAnnotation(controlled=False)`. The `controlled=False` flag means
InSpectre tracks the value as secret but does NOT claim the attacker can steer the load
address. The `secret_reg_addresses` column in the output shows `secret_src_rsi` as the
provenance label for such seeds.

### Load depth semantics

- **Depth 1**: The register directly holds the secret (or a copy of a seed register).
  Example: `rsi` at entry to `EVP_MAC_init`, which is the key pointer itself.
- **Depth 2**: The register holds a value loaded from a secret-derived address.
  Example: `rax = LOAD[LOAD[rdi] + 0x40]` — two dereferences from `rdi`.

Depth 1 is the more immediately useful for an attacker: the register IS the pointer to
the secret bytes, and using it directly as a load address in a transmission gadget leaks
the secret. Depth 2 means the attacker would need to reason about what's at the
secret-derived address, which may not be the raw secret bytes.

### The `_init` dispatch symbol

Many gadgets fire at `pc_symbol = _init`. This refers to the PLT resolver stub — the
indirect jump in the PLT that goes through the GOT. When a function calls `strlen@plt`
or `EVP_DigestInit_ex@plt`, the PLT trampoline executes an indirect jump through a GOT
entry. InSpectre records this as a dispatch at the `_init` section. The jump target is
a fixed GOT entry and is NOT attacker-controllable in these cases.

---

## 10. File Locations Summary

```
/home/njamadagni/inspectre-gadget/
  inspectre                                   — top-level CLI
  config_sad_only.yaml                        — SAD-only analysis config
  secret_leaker/
    openssl_secret_regs_raw_only.csv          — 48-entry template (raw secrets only)
    openssl_secret_regs.csv                   — extended template (includes expanded structs)
    gen_build_csv.py                          — resolves addresses per build
    run_openssl_sad.sh                        — runs one build end-to-end
    openssl_sad_analysis.md                   — this document

/home/njamadagni/gadget_search/openssl/
  builds/
    gcc_O0/libcrypto.so.3                     — binary
    gcc_O0/address_list.csv                   — resolved addresses for this build
    gcc_O1/ ... gcc_O3/ ...                   — same structure for each build
    clang_O0/ ... clang_Oz/
  results/
    gcc_O0/sad.csv                            — SAD gadgets (clean run)
    gcc_O0/run.log                            — full InSpectre log
    gcc_O0/gen_csv.log                        — address resolution log
    gcc_O0/asm/                               — annotated assembly per function
    gcc_O1/ gcc_O2/ gcc_O3/                   — same (clean runs)
```

---

## 11. Remaining Work

The following builds have NOT been run with the fully-corrected 48-entry CSV:

**Needs rerun** (tainted or incomplete):
- `clang_O0` — tainted (had CRYPTO_*128_* + wrong EVP_PKEY_ex register)
- `clang_O1` — partial fix only (CRYPTO_* removed, EVP_PKEY_ex still `rdx`)
- `clang_O2` — tainted + killed early (1 gadget result is incomplete)
- `clang_O3` — partial fix + killed early (1 gadget result is incomplete)

**Never run**:
- `clang_Ofast`, `clang_Og`, `clang_Os`, `clang_Oz`
- `gcc_Ofast`, `gcc_Og`, `gcc_Os`

To run all remaining builds:
```bash
cd /home/njamadagni/inspectre-gadget
for b in clang_O0 clang_O1 clang_O2 clang_O3 clang_Ofast clang_Og clang_Os clang_Oz \
          gcc_Ofast gcc_Og gcc_Os; do
  bash secret_leaker/run_openssl_sad.sh "$b"
done
```
