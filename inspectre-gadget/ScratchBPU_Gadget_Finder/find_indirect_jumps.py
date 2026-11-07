#!/usr/bin/env python3
"""
Extract indirect jump/call instructions from any x86/x64 binary or object file
and produce a per-register summary.

Handles ELF (Linux), PE/COFF (Windows), and raw binaries regardless of compiler.

Required:    pip install capstone
Recommended: pip install pyelftools pefile

Outputs:
  output_register_indirect_jumps.csv  — one row per instruction
      address, mnemonic, target_register, offset

  summary.csv  — one row per x86 GPR
      register, call_count, jump_count
"""

import sys
import csv
import argparse
import io
import struct
from collections import defaultdict
from pathlib import Path

try:
    import capstone
    from capstone import x86_const
except ImportError:
    sys.exit("capstone not installed. Run: pip install capstone")


# ── Constants ─────────────────────────────────────────────────────────────────

INDIRECT_MNEMONICS = {"jmp", "jmpq", "call", "callq"}
JUMP_MNEMONICS     = {"jmp", "jmpq"}
CALL_MNEMONICS     = {"call", "callq"}

_PE_MACHINE = {
    0x8664: (capstone.CS_ARCH_X86, capstone.CS_MODE_64),
    0x014c: (capstone.CS_ARCH_X86, capstone.CS_MODE_32),
}

X86_64_REGS = [
    "RAX", "RBX", "RCX", "RDX", "RSI", "RDI", "RBP", "RSP",
    "R8",  "R9",  "R10", "R11", "R12", "R13", "R14", "R15",
]
X86_32_REGS = [
    "EAX", "EBX", "ECX", "EDX", "ESI", "EDI", "EBP", "ESP",
    "R8D", "R9D", "R10D", "R11D", "R12D", "R13D", "R14D", "R15D",
]
ALL_REGS = X86_64_REGS + X86_32_REGS


# ── Format loaders ────────────────────────────────────────────────────────────

def _load_elf(data: bytes):
    try:
        from elftools.elf.elffile import ELFFile
    except ImportError:
        print(
            "Warning: pyelftools not installed — treating ELF as raw binary.\n"
            "         Install with: pip install pyelftools",
            file=sys.stderr,
        )
        return [(0, data)], (capstone.CS_ARCH_X86, capstone.CS_MODE_64)

    elf = ELFFile(io.BytesIO(data))
    arch_str = elf.get_machine_arch()
    if arch_str == "x86_64":
        cs_params = (capstone.CS_ARCH_X86, capstone.CS_MODE_64)
    elif arch_str in ("IA-32", "x86"):
        cs_params = (capstone.CS_ARCH_X86, capstone.CS_MODE_32)
    else:
        cs_params = (capstone.CS_ARCH_X86, capstone.CS_MODE_64)

    sections = []
    for seg in elf.iter_segments():
        if seg.header.p_type == "PT_LOAD" and (seg.header.p_flags & 0x1):
            sections.append((seg.header.p_vaddr, seg.data()))
    if not sections:
        for sec in elf.iter_sections():
            if sec.header.sh_flags & 0x4:
                sections.append((sec.header.sh_addr, sec.data()))

    return sections, cs_params


def _load_pe(data: bytes):
    try:
        import pefile
    except ImportError:
        print(
            "Warning: pefile not installed — treating PE/COFF as raw binary.\n"
            "         Install with: pip install pefile",
            file=sys.stderr,
        )
        return [(0, data)], (capstone.CS_ARCH_X86, capstone.CS_MODE_64)

    try:
        pe = pefile.PE(data=data, fast_load=False)
    except pefile.PEFormatError as exc:
        print(f"Warning: pefile could not parse file ({exc}); falling back to raw.", file=sys.stderr)
        return [(0, data)], (capstone.CS_ARCH_X86, capstone.CS_MODE_64)

    cs_params  = _PE_MACHINE.get(pe.FILE_HEADER.Machine, (capstone.CS_ARCH_X86, capstone.CS_MODE_64))
    image_base = getattr(getattr(pe, "OPTIONAL_HEADER", None), "ImageBase", 0)
    sections   = []
    for sec in pe.sections:
        if sec.Characteristics & 0x20000020:
            sections.append((image_base + sec.VirtualAddress, sec.get_data()))
    return sections, cs_params


def _load_coff_bare(data: bytes):
    if len(data) < 20:
        raise ValueError("too small")
    machine, nsections = struct.unpack_from("<HH", data, 0)
    if machine not in _PE_MACHINE:
        raise ValueError(f"unrecognised COFF machine type {machine:#06x}")
    cs_params     = _PE_MACHINE[machine]
    opt_hdr_size, = struct.unpack_from("<H", data, 16)
    sec_table_off = 20 + opt_hdr_size
    sections      = []
    for i in range(nsections):
        off = sec_table_off + i * 40
        raw_size, raw_ptr, chars = struct.unpack_from("<III", data, off + 16)
        if chars & 0x20000020 and raw_size:
            sections.append((0, data[raw_ptr: raw_ptr + raw_size]))
    if not sections:
        raise ValueError("no executable sections found")
    return sections, cs_params


def load_executable_sections(path: Path):
    data  = path.read_bytes()
    magic = data[:4]

    if magic == b"\x7fELF":
        return _load_elf(data)
    if data[:2] == b"MZ":
        return _load_pe(data)
    try:
        return _load_coff_bare(data)
    except (ValueError, struct.error):
        pass

    print(
        f"Warning: '{path.name}' has no recognised header "
        "(not ELF / PE / COFF) — disassembling entire file as raw x64.",
        file=sys.stderr,
    )
    return [(0, data)], (capstone.CS_ARCH_X86, capstone.CS_MODE_64)


# ── Operand parsing ───────────────────────────────────────────────────────────

def _reg(cs, reg_id: int) -> str:
    return cs.reg_name(reg_id).upper()


def _fmt_disp(disp: int) -> str:
    if disp == 0:
        return ""
    return hex(disp) if disp > 0 else f"-{hex(-disp)}"


def parse_jump_operand(cs, instr):
    """Return (target_register, offset_str, operand_type) or None.

    operand_type is 'reg' for  jmp rax   (direct register value)
                    'mem' for  jmp [rax]  (dereference register, jump to loaded address)
    """
    if not instr.operands:
        return None

    op = instr.operands[0]

    if op.type == x86_const.X86_OP_REG:
        return (_reg(cs, op.reg), "", "reg")

    if op.type == x86_const.X86_OP_MEM:
        mem = op.mem
        if mem.base == x86_const.X86_REG_RIP:
            return None

        has_base  = mem.base  != 0
        has_index = mem.index != 0

        if not has_base and not has_index:
            return None

        if has_base:
            base_reg     = _reg(cs, mem.base)
            offset_parts = []
            if has_index:
                idx = _reg(cs, mem.index)
                offset_parts.append(f"{mem.scale}*{idx}" if mem.scale != 1 else idx)
            disp_str = _fmt_disp(mem.disp)
            if disp_str:
                offset_parts.append(disp_str)
            return (base_reg, " + ".join(offset_parts), "mem")

        idx          = _reg(cs, mem.index)
        offset_parts = []
        if mem.scale != 1:
            offset_parts.append(f"*{mem.scale}")
        disp_str = _fmt_disp(mem.disp)
        if disp_str:
            offset_parts.append(disp_str)
        return (idx, " + ".join(offset_parts), "mem")

    return None


# ── Disassembly ───────────────────────────────────────────────────────────────

def find_indirect_jumps(cs, vma: int, data: bytes, include_calls: bool):
    cs.detail = True
    for instr in cs.disasm(data, vma):
        mnem = instr.mnemonic.lower()
        if mnem not in INDIRECT_MNEMONICS:
            continue
        if not include_calls and mnem in CALL_MNEMONICS:
            continue
        result = parse_jump_operand(cs, instr)
        if result is None:
            continue
        target_reg, offset, op_type = result
        yield (instr.address, instr.mnemonic, target_reg, offset, op_type)


# ── Summary helpers ───────────────────────────────────────────────────────────

def build_summary(rows):
    calls        = defaultdict(int)
    jumps        = defaultdict(int)
    unknown_regs = set()

    for row in rows:
        reg  = row["target_register"]
        mnem = row["mnemonic"].lower()
        if mnem in JUMP_MNEMONICS:
            jumps[reg] += 1
        elif mnem in CALL_MNEMONICS:
            calls[reg] += 1
        if reg not in ALL_REGS:
            unknown_regs.add(reg)

    regs = list(ALL_REGS)
    for r in sorted(unknown_regs):
        if r not in regs:
            regs.append(r)

    return [(r, calls[r], jumps[r]) for r in regs], unknown_regs


# ── Entry point ───────────────────────────────────────────────────────────────

def main():
    parser = argparse.ArgumentParser(
        description=(
            "Find all indirect jump/call instructions in an x86/x64 binary and "
            "write two output files: a per-instruction CSV and a per-register summary."
        ),
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Outputs:
  output_register_indirect_jumps.csv   address, mnemonic, target_register, offset
  summary.csv                          register, call_count, jump_count

Examples:
  %(prog)s /lib/x86_64-linux-gnu/libc.so.6
  %(prog)s kernel.o --no-calls
  %(prog)s program.exe --arch x64
""",
    )
    parser.add_argument("binary", help="Binary or object file to analyze")
    parser.add_argument(
        "--jumps-out", default="output_register_indirect_jumps.csv", metavar="FILE",
        help="Per-instruction output CSV (default: output_register_indirect_jumps.csv)",
    )
    parser.add_argument(
        "--summary-out", default="summary.csv", metavar="FILE",
        help="Per-register summary CSV (default: summary.csv)",
    )
    parser.add_argument("--arch", choices=["x86", "x64"], default=None,
                        help="Override detected architecture")
    parser.add_argument("--no-calls", action="store_true",
                        help="Report jmp instructions only, skip indirect calls")
    args = parser.parse_args()

    path = Path(args.binary)
    if not path.exists():
        sys.exit(f"Error: {args.binary}: no such file")

    sections, cs_params = load_executable_sections(path)

    if args.arch:
        cs_params = {
            "x64": (capstone.CS_ARCH_X86, capstone.CS_MODE_64),
            "x86": (capstone.CS_ARCH_X86, capstone.CS_MODE_32),
        }[args.arch]

    cs = capstone.Cs(*cs_params)

    rows = []
    for vma, data in sections:
        for addr, mnemonic, target_reg, offset, op_type in find_indirect_jumps(
            cs, vma, data, include_calls=not args.no_calls
        ):
            rows.append({
                "address":         hex(addr),
                "mnemonic":        mnemonic,
                "target_register": target_reg,
                "offset":          offset if offset else "<no_offset>",
                "operand_type":    op_type,
            })

    # Write per-instruction CSV
    jumps_path = Path(args.jumps_out)
    fieldnames = ["address", "mnemonic", "target_register", "offset", "operand_type"]
    with open(jumps_path, "w", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)
    print(f"Found {len(rows)} indirect jump/call instructions → {jumps_path}", file=sys.stderr)

    # Write per-register summary CSV
    summary_rows, unknown_regs = build_summary(rows)
    if unknown_regs:
        print(
            f"Note: {len(unknown_regs)} register(s) not in the canonical x86 GPR list "
            f"(appended at end): {', '.join(sorted(unknown_regs))}",
            file=sys.stderr,
        )
    summary_path = Path(args.summary_out)
    with open(summary_path, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["register", "call_count", "jump_count"])
        writer.writerows(summary_rows)
    print(f"Register summary → {summary_path}", file=sys.stderr)


if __name__ == "__main__":
    main()
