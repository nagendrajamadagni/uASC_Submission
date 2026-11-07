#!/usr/bin/env python3
"""
Resolve InSpectre SAD address-list CSV for a specific OpenSSL or BoringSSL build.

Reads the function-name/secret-reg template (openssl_secret_regs_raw_only.csv by
default), looks up each function's address in the build's shared library via nm -D,
and writes a clean (comment-free) address_list.csv that InSpectre can consume
directly.

Functions absent from the symbol table (e.g. inlined at high -O levels) are skipped
with a WARNING logged both to stdout and to a log file.

Usage:
    python3 gen_build_csv.py <build_dir> [--template PATH] [--output PATH] [--log PATH]
                                         [--binary-name NAME]

BoringSSL builds use --binary-name libcrypto.so together with
--template boringssl_secret_regs_raw_only.csv.
"""

import argparse
import subprocess
import sys
from pathlib import Path

TEMPLATE_DEFAULT = Path(__file__).parent / "openssl_secret_regs_raw_only.csv"


def parse_template(path):
    """Return list of (function_name, secret_reg) from the template CSV."""
    entries = []
    with open(path) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            parts = line.split(",")
            if len(parts) != 3:
                print(f"WARNING: skipping malformed template line: {line!r}", file=sys.stderr)
                continue
            _addr, name, reg = parts
            entries.append((name.strip(), reg.strip()))
    return entries


def get_nm_symbols(binary_path):
    """Run nm -D and return {bare_function_name: '0xADDR'} for all T/W symbols."""
    result = subprocess.run(
        ["nm", "-D", str(binary_path)],
        capture_output=True, text=True, check=True
    )
    symbols = {}
    for line in result.stdout.splitlines():
        parts = line.split()
        if len(parts) < 3:
            continue
        addr_str, sym_type, sym_name = parts[0], parts[1], parts[2]
        if sym_type not in ("T", "W"):
            continue
        try:
            addr_int = int(addr_str, 16)
        except ValueError:
            continue
        if addr_int == 0:
            continue
        bare_name = sym_name.split("@@")[0]
        symbols[bare_name] = hex(addr_int)
    return symbols


def main():
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("build_dir", help="Path to the build directory")
    parser.add_argument("--template", default=str(TEMPLATE_DEFAULT),
                        help="Template CSV with function names and secret regs")
    parser.add_argument("--output", default=None,
                        help="Output CSV (default: <build_dir>/address_list.csv)")
    parser.add_argument("--log", default=None,
                        help="Log file (default: <build_dir>/gen_csv.log)")
    parser.add_argument("--binary-name", default="libcrypto.so.3",
                        help="Shared library filename inside build_dir "
                             "(default: libcrypto.so.3; BoringSSL uses libcrypto.so)")
    args = parser.parse_args()

    build_dir = Path(args.build_dir)
    binary = build_dir / args.binary_name
    output_csv = Path(args.output) if args.output else build_dir / "address_list.csv"
    log_path = Path(args.log) if args.log else build_dir / "gen_csv.log"

    if not binary.exists():
        print(f"ERROR: binary not found: {binary}", file=sys.stderr)
        sys.exit(1)

    entries = parse_template(args.template)
    symbols = get_nm_symbols(binary)

    found, missing = [], []
    for name, reg in entries:
        if name in symbols:
            found.append((symbols[name], name, reg))
        else:
            missing.append(name)

    log_lines = [
        f"Build:    {build_dir}",
        f"Binary:   {binary}",
        f"Template: {args.template}",
        f"Resolved: {len(found)}/{len(entries)}",
    ]
    if missing:
        log_lines.append(f"\nWARNING: {len(missing)} function(s) not found in symbol table (skipped):")
        for name in missing:
            log_lines.append(f"  MISSING: {name}")
    log_lines.append(f"\nOutput:   {output_csv} ({len(found)} entries)")

    log_text = "\n".join(log_lines)
    print(log_text)
    log_path.write_text(log_text + "\n")

    with open(output_csv, "w") as f:
        for addr, name, reg in found:
            f.write(f"{addr},{name},{reg}\n")


if __name__ == "__main__":
    main()
