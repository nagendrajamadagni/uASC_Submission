# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Project Does

InSpectre Gadget is a research tool for discovering and evaluating Spectre-class transient execution vulnerabilities in binaries. It performs symbolic execution on binary code to find **transmission gadgets** (data leaks through CPU cache side-channels), **dispatch gadgets** (tainted function pointers), **secret-dependent branches**, **half-Spectre** (MDS-variant) gadgets, and **secret-at-dispatch gadgets** (secret register values live at an indirect jump, regardless of whether the jump target is tainted).

Published at USENIX Security 2024.

## Commands

**Install dependencies:**
```bash
pip install -r requirements.txt
```

**Run the analyzer:**
```bash
./inspectre analyze <BINARY> --address-list <CSV> --config config_all.yaml --output out/gadgets.csv --tfp-output out/tfp.csv --sad-output out/sad.csv --asm out/asm
```

**Run the analyzer on a single function with pre-seeded secret registers:**
```bash
./inspectre analyze <BINARY> --address <HEX> --name <NAME> --secret-regs rdi,rsi,rdx --config config_all.yaml --sad-output out/sad.csv --asm out/asm
```

**Run the reasoner (post-analysis exploitability scoring):**
```bash
./inspectre reason gadgets.csv gadgets-reasoned.csv
```

**Inspect a gadget by UUID:**
```bash
./inspectre show <ASM_FOLDER> <UUID>
```

**Format code:**
```bash
python3 -m autopep8 --ignore E302 --recursive --in-place analyzer
```

**Run unit tests:**
```bash
cd tests/unit-tests && bash run-all.sh
# or: python3 -m unittest
```

**Run all integration tests:**
```bash
cd tests/test-cases && bash test-all.sh
```

**Run a single integration test:**
```bash
cd tests/test-cases && bash test-single.sh <TEST_CASE_NAME>
# Update reference output:
bash test-single.sh <TEST_CASE_NAME> --update
```

## Architecture

The tool follows a three-stage pipeline:

### Stage 1: Scanner (`analyzer/scanner/`)
Uses **angr** for symbolic execution. Registers and stack are initialized as attacker-controlled symbols. The scanner hooks all loads, stores, and calls to track data flow via **annotations** (`annotations.py`). It propagates "secret" and "transmission" labels through the symbolic state. Discovered gadgets are appended to lists on the `Scanner` object (`scanner.py`).

The memory model (`memory.py`) is custom — symbolic loads return fresh symbols, enabling tracking of tainted data through memory. Five gadget types are detected: `Transmission`, `TaintedFunctionPointer`, `HalfGadget`, `SecretDependentBranch`, `SecretAtDispatch` (defined in `analyzer/shared/`).

### Stage 2: Analysis Pipeline (`analyzer/analysis/pipeline.py`)
Takes gadgets from the scanner and runs ordered analysis passes:
- `baseControlAnalysis` → `pathAnalysis` → `requirementsAnalysis` → `rangeAnalysis` → `bitsAnalysis` → `tfpAnalysis` / `transmissionAnalysis`
- `asmprinter` generates annotated assembly output

Results are written to CSV files. The `rangeAnalysis` pass uses pluggable strategies (`analysis/range_strategies/`) to infer value ranges for symbolic expressions.

### Stage 3: Reasoner (`reasoner/`)
Post-processes CSVs to determine exploitability. `reasoner.py` detects the schema and routes to `transmissionReasoner.py` or `tfpReasoner.py`. Adds exploitability scores and human-readable reasoning columns to output CSV.

### Entry Points
- `analyzer/analyzer.py` — loads binary with angr, invokes scanner, runs analysis pipeline, writes output
- `reasoner/reasoner.py` — reads CSV, routes to specialized reasoner
- `inspectre` — top-level CLI dispatcher

### Pre-Seeded Secret Inputs (`--secret-regs` / address-list 3rd column)
The scanner can be told that certain registers or memory symbols already hold secret values at a function's entry point, without requiring those values to have been loaded via an attacker-controlled address during the analyzed trace. This is useful for **dispatch stubs and library functions** that receive secret-derived arguments from their caller (e.g. GMP `__gmpn_addmul_1` receiving limb pointers in `rdi`/`rsi`).

- CLI: `--secret-regs rdi,rsi,rdx` for single-address mode; or add a colon-separated third column to the `--address-list` CSV: `0x4d9f0,__gmpn_addmul_1,rdi:rsi:rdx:rcx`.
- Implementation: `Scanner.__init__` stores `secret_inputs`; `initialize_regs_and_stack` has a third pass that overwrites the specified registers with `SecretAnnotation(controlled=False)` BVS symbols, or stores secret-tagged values at resolved symbol addresses.
- Annotation semantics: `controlled=False` means the value is tracked as secret but the analysis does not claim the attacker can steer the load address. The `secret_reg_addresses` column in the SAD CSV shows `secret_src_<reg>` as the provenance label.

### Configuration (`config_all.yaml`)
Key options: `controlled_registers`, `controlled_stack`, `MaxBB` (max basic blocks, default 5), `Z3Timeout` (default 10s), `TaintedFunctionPointers`, `SecretDependentBranches`, `HalfSpectre`, `SecretAtDispatch`, `AnalyzeDuringScanning`, `AggressiveSpeculation`.

### Shared Data Structures (`analyzer/shared/`)
`transmission.py`, `taintedFunctionPointer.py`, `halfGadget.py`, `secretDependentBranch.py`, `secretAtDispatch.py` define the gadget classes. `astTransform.py` provides symbolic AST manipulation utilities used across analysis passes. `config.py` handles config loading.

### SecretAtDispatch Gadget (`analyzer/shared/secretAtDispatch.py`)
A **SecretAtDispatch** gadget is detected whenever an indirect jump or call is executed while any general-purpose register holds a secret value — regardless of whether the jump target itself is attacker-controlled or tainted. This is distinct from TFP gadgets (which require the jump *target* to be tainted) and transmission gadgets (which require a secret-dependent memory *address*).

The threat model: the CPU speculatively executes code at the predicted dispatch target. Any register holding a secret is live in that speculative window and can be consumed by whatever gadget executes speculatively, potentially leaking the secret through a cache side-channel.

Detection happens in `scanner.py:check_secret_at_dispatch`, called from `exit_hook_before` alongside `check_tfp`. A single indirect jump can simultaneously produce a TFP, a CODE_LOAD transmission, and a SecretAtDispatch gadget — they are independent and all reported.

Each gadget records: `jump_target_reg` (which register/memory is being jumped through), `jump_target_expr`, and a list of `SecretRegister` objects — one per tainted register — each storing the register name, its symbolic expression, load depth, and the address the secret was originally loaded from (via `LoadAnnotation.read_address_ast`).

Output is written to the `--sad-output` CSV. The feature is enabled with `SecretAtDispatch: True` in the config (on by default in `config_all.yaml`, off in the hardcoded defaults).

### Adding New Gadget Types
The pattern for adding a gadget type is consistent across all five types:
1. Define the gadget class in `analyzer/shared/` with a `to_dict()` method
2. Add a detection method `check_<type>` to `Scanner` in `scanner.py`, guarded by a config flag
3. Call it from the appropriate hook (`load_hook_after`, `store_hook_before`, or `exit_hook_before`)
4. Add `analyze_<type>` to `AnalysisPipeline` in `pipeline.py`; assign UUID, name, symbols, run analysis passes, write CSV
5. Thread the output filename through `analyse_gadget` and `run` in `analyzer.py`
6. Add the CLI argument to `inspectre`
7. Add the config flag default to `config.py` and `config_all.yaml`

### Tests
- **Unit tests** (`tests/unit-tests/`): Python `unittest`, test individual analysis components
- **Integration tests** (`tests/test-cases/`, 48 cases): Run the full pipeline on small binaries and diff output against reference CSVs
- **Test queries** (`tests/test-queries/`): SQL queries for validating output properties
