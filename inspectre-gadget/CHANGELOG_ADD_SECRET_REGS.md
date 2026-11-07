# Changelog: Pre-Seeded Secret Inputs Feature

## Overview

Added support for specifying **pre-seeded secret inputs** at analysis entrypoints. This allows the tool to be told that certain registers or memory symbols already hold secret values when a function is entered — without requiring those values to have been loaded via an attacker-controlled address during the analyzed trace.

## Motivation

The existing secret-taint model only marks a value as secret after a memory load through an attacker-controlled address. This means that for **dispatch stubs** and **library functions** that receive secret-derived arguments from their caller, the tool finds no SecretAtDispatch gadgets — even though the registers are architecturally live at the indirect jump.

For example, `__gmpn_addmul_1` is a two-instruction stub:
```asm
mov rax, QWORD PTR [rip+0x57029]   ; load cpu-dispatch table
jmp QWORD PTR [rax+0x18]           ; jump to cpu-specific impl
```
`rdi`, `rsi`, `rdx`, and `rcx` — which in practice carry GMP limb pointers and lengths derived from secret `mpz_t` data — are never loaded within those two instructions, so the old analysis reported 0 SAD gadgets. With pre-seeded secret inputs, the caller's knowledge that those registers are secret-tainted can be communicated directly to the tool.

## Modified Files

### `inspectre` (CLI)

- Added `--secret-regs REG[,REG...]` argument for single-entrypoint (`--address`) mode. Comma-separated list of register names (e.g. `rdi,rsi,rdx,rcx`) or binary symbol names to treat as pre-loaded secrets at the entrypoint.
- Extended `--address-list` CSV format to support an optional third column: a colon-separated list of register/symbol names (`0x4d9f0,__gmpn_addmul_1,rdi:rsi:rdx:rcx`). Rows with only two columns are treated as having no pre-seeded secrets (fully backward-compatible).
- Comma separators from `--secret-regs` are normalised to colons before the unified split, so both input paths produce the same `list[str]`.

### `analyzer/analyzer.py`

- `analyse_gadget()` gains a `secret_inputs=None` parameter (list of strings) and forwards it to `Scanner`.
- `run()` unpacks the third element of each gadget entry and passes it to `analyse_gadget`.

### `analyzer/scanner/scanner.py`

- `Scanner.__init__` accepts `secret_inputs=None` and stores it as `self.secret_inputs`.
- `initialize_regs_and_stack` has a new third pass (runs after the existing attacker-controlled register pass):
  - **Register names** (any name in `get_x86_registers()`): the existing `AttackerAnnotation` BVS is replaced with a fresh `SecretAnnotation(controlled=False)` BVS of the same width. A `placeholder_addr` BVS (`secret_src_<reg>`) is used as the `read_address_ast` so the SAD output column shows a clear provenance label rather than a raw address.
  - **Symbol names**: the symbol is resolved via `state.project.loader.find_symbol()`. A `SecretAnnotation`-tagged BVS of the symbol's byte size is stored into the initial memory model (as a `MemOp` store), exactly like the attacker-controlled stack region setup. An unknown symbol name logs a critical warning and is skipped.

## Annotation semantics

Pre-seeded secrets use `SecretAnnotation(controlled=False)`. This means:
- `contains_secret()` returns True → `check_secret_at_dispatch` reports the register.
- `propagate_annotations()` on a load through this value produces `TransmissionAnnotation(controlled=False)` — the value is tracked as a secret but the analysis does not claim the attacker can steer the load address.

This is distinct from attacker-controlled registers (`AttackerAnnotation`) and from secrets loaded during the trace (`SecretAnnotation(controlled=True)`).

## Usage

**Single function:**
```bash
./inspectre analyze <BINARY> \
    --config config_all.yaml \
    --address 0x4d9f0 \
    --name __gmpn_addmul_1 \
    --secret-regs rdi,rsi,rdx,rcx \
    --sad-output out/sad.csv \
    --asm out/asm
```

**Address list (CSV):**
```
# addresses.csv
0x4d9f0,__gmpn_addmul_1,rdi:rsi:rdx:rcx
0x271a0,mpz_pow_ui,
```
```bash
./inspectre analyze <BINARY> \
    --config config_all.yaml \
    --address-list addresses.csv \
    --sad-output out/sad.csv \
    --asm out/asm
```

## Example result

Running on `libgmp.so` at `__gmpn_addmul_1` with `--secret-regs rdi,rsi,rdx,rcx` produces 1 SAD gadget at `0x4d9f7` (the `jmp QWORD PTR [rax+0x18]`) with all four argument registers reported as secret — accurately reflecting the speculative window available to whatever gadget executes at the predicted dispatch target.
