# Changelog: SecretAtDispatch Feature

## Overview

Added a new gadget class, **SecretAtDispatch**, which detects a previously untracked vulnerability: an indirect jump or call executed while one or more registers hold secret values, regardless of whether the jump target itself is attacker-controlled.

## Motivation

The existing TFP (Tainted Function Pointer / Dispatch Gadget) detector only flags indirect jumps where the jump *target* is derived from attacker-controlled or secret-tainted data. It does not consider the register state at the moment of dispatch.

However, the CPU speculatively fetches and begins executing instructions at the predicted target as soon as an indirect branch is encountered. Any register holding a secret value at that point is architecturally live in the speculative window. If the predicted target (or any gadget reachable from it) consumes that register in a cache-observable way, the secret can be leaked — even if the attacker had no influence over where the branch goes.

This is a distinct threat from both:
- **Transmission gadgets**: which require a secret-dependent memory *address*
- **TFP gadgets**: which require the jump *target* to be tainted

## New Files

### `analyzer/shared/secretAtDispatch.py`
Defines two classes:
- `SecretRegister` — captures a single register at dispatch time: its name, symbolic expression, load depth (how many memory hops the secret travelled through), and the address it was originally loaded from (extracted from its `LoadAnnotation`).
- `SecretAtDispatch` — the gadget object. Stores the PC of the indirect jump, which register or memory location is being jumped through (`jump_target_reg`, `jump_target_expr`), the list of `SecretRegister` instances live at that point, and the standard context fields (`branches`, `constraints`, `aliases`, `bbls`, `n_instr`, `contains_spec_stop`).

## Modified Files

### `analyzer/scanner/scanner.py`
- Added `secretAtDispatches: list[SecretAtDispatch]` to the `Scanner` class.
- Added `check_secret_at_dispatch(state, jump_target_reg, jump_target_expr)`: walks all x86 general-purpose registers, calls `contains_secret()` on each, and for every register that returns True extracts the `LoadAnnotation` to recover the original secret source address. If any secret registers are found, a `SecretAtDispatch` gadget is instantiated and appended.
- Called `check_secret_at_dispatch` from `exit_hook_before`, alongside the existing `check_tfp` and `check_transmission` calls. The check is independent: a single indirect jump can produce a TFP, a CODE_LOAD transmission, *and* a SecretAtDispatch gadget simultaneously.

### `analyzer/analysis/pipeline.py`
- Added `sad_filename` output path to `AnalysisPipeline`.
- Added `n_found_secret_at_dispatches` and `n_final_secret_at_dispatches` counters.
- Added `analyze_secret_at_dispatch(gadget)`: assigns UUID, name, and pc/address symbols, then writes the gadget to the configured CSV. No range or bits analysis passes are run at this stage; the raw symbolic expressions and load depths are sufficient for initial triage.

### `analyzer/analyzer.py`
- Threaded `sad_filename` through `analyse_gadget()` and `run()`.
- Added found/outputted log lines for the new gadget type.
- Added the post-scan loop over `s.secretAtDispatches` (used when `AnalyzeDuringScanning` is False).

### `analyzer/shared/config.py`
- Added `SecretAtDispatch: False` as the default (opt-in, consistent with `HalfSpectre`).

### `config_all.yaml`
- Added `SecretAtDispatch: True` (enabled in the reference all-features config).

### `inspectre` (CLI)
- Added `--sad-output` argument, passed through to `analyzer.run` as `sad_filename`.

## Output

Each detected gadget produces one row in the `--sad-output` CSV with the following columns:

| Column | Description |
|---|---|
| `uuid` | Deterministic or random UUID |
| `name` / `address` / `pc` | Entrypoint name, entrypoint address, instruction address |
| `pc_symbol` / `address_symbol` | Nearest symbol names |
| `n_instr` / `n_control_flow_changes` | Execution context metrics |
| `contains_spec_stop` | Whether an lfence/mfence/cpuid was seen before this point |
| `jump_target_reg` | Register or `"mem"` being jumped through |
| `jump_target_expr` | Symbolic expression of the jump target |
| `n_secret_regs` | Number of registers holding secret values |
| `secret_regs` | List of register names |
| `secret_reg_exprs` | Symbolic expressions for each secret register |
| `secret_reg_load_depths` | Load chain depth for each secret |
| `secret_reg_addresses` | Source address each secret was loaded from |
| `branches` / `constraints` / `aliases` / `bbls` | Standard path context |

## Usage

```bash
./inspectre analyze <BINARY> \
    --address-list <CSV> \
    --config config_all.yaml \
    --output out/gadgets.csv \
    --tfp-output out/tfp.csv \
    --sad-output out/sad.csv \
    --asm out/asm
```

To disable the feature, set `SecretAtDispatch: False` in the config YAML.
