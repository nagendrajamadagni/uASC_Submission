"""
SecretAtDispatch gadget.

Represents an indirect jump or call where one or more registers hold secret
values at the time of dispatch. Regardless of whether the jump target itself
is attacker-controlled, the speculative window opened by the indirect branch
exposes those register values to whatever code runs speculatively.
"""

import claripy
from collections import OrderedDict

from .utils import ordered_branches, ordered_constraints


class SecretRegister:
    """
    A register that contains a secret value at the time of an indirect dispatch.
    """
    reg: str
    expr: claripy.ast.BV
    load_depth: int
    secret_address_expr: claripy.ast.BV  # the address the secret was loaded from

    def __init__(self, reg: str, expr: claripy.ast.BV, load_depth: int,
                 secret_address_expr: claripy.ast.BV):
        self.reg = reg
        self.expr = expr
        self.load_depth = load_depth
        self.secret_address_expr = secret_address_expr

    def __repr__(self):
        return (f"SecretRegister(reg={self.reg}, expr={self.expr}, "
                f"depth={self.load_depth}, secret_addr={self.secret_address_expr})")

    def to_dict(self):
        return OrderedDict([
            ("reg", self.reg),
            ("expr", str(self.expr)),
            ("load_depth", self.load_depth),
            ("secret_address_expr", str(self.secret_address_expr)
             if self.secret_address_expr is not None else ""),
        ])


class SecretAtDispatch:
    """
    A SecretAtDispatch gadget is triggered when an indirect jump or call is
    executed while one or more registers contain secret values.

    The threat: the CPU speculatively executes instructions at the predicted
    dispatch target. Any register holding a secret at that point is live in the
    speculative window and can be consumed by whatever gadget the branch
    speculatively lands on.
    """
    uuid: str
    name: str
    address: int
    pc: int
    pc_symbol: str
    address_symbol: str

    # The register (or "mem") holding the jump target, and its expression.
    jump_target_reg: str
    jump_target_expr: claripy.ast.BV

    # All registers that contain secret values at the dispatch point.
    secret_registers: list

    n_instr: int
    n_control_flow_changes: int
    contains_spec_stop: bool

    aliases: list
    branches: list
    constraints: list
    bbls: list

    def __init__(self, pc: int, jump_target_reg: str, jump_target_expr: claripy.ast.BV,
                 secret_registers: list, bbls: list, branches: list, constraints: list,
                 aliases: list, n_instr: int, n_control_flow_changes: int,
                 contains_spec_stop: bool):
        self.uuid = ""
        self.name = ""
        self.address = 0
        self.pc = pc
        self.pc_symbol = ""
        self.address_symbol = ""

        self.jump_target_reg = jump_target_reg
        self.jump_target_expr = jump_target_expr
        self.secret_registers = list(secret_registers)

        self.n_instr = n_instr
        self.n_control_flow_changes = n_control_flow_changes
        self.contains_spec_stop = contains_spec_stop

        self.bbls = list(bbls)
        self.branches = list(branches)
        self.constraints = list(constraints)
        self.aliases = list(aliases)

    def __repr__(self):
        return f"""
        uuid: {self.uuid}
        name: {self.name}
        address: {hex(self.address)}
        pc: {hex(self.pc)}
        n_instr: {self.n_instr}
        contains_spec_stop: {self.contains_spec_stop}

        jump_target_reg: {self.jump_target_reg}
        jump_target_expr: {self.jump_target_expr}

        secret_registers ({len(self.secret_registers)}):
            {self.secret_registers}

        bbls: {[hex(x) for x in self.bbls]}
        branches: {ordered_branches(self.branches)}
        constraints: {ordered_constraints(self.constraints)}
        aliases: {self.aliases}
        """

    def to_dict(self):
        d = OrderedDict([
            ("uuid", self.uuid),
            ("name", self.name),
            ("address", hex(self.address)),
            ("address_symbol", self.address_symbol),
            ("pc", hex(self.pc)),
            ("pc_symbol", self.pc_symbol),
            ("n_instr", self.n_instr),
            ("n_control_flow_changes", self.n_control_flow_changes),
            ("contains_spec_stop", self.contains_spec_stop),
            ("jump_target_reg", self.jump_target_reg),
            ("jump_target_expr", str(self.jump_target_expr)),
            ("n_secret_regs", len(self.secret_registers)),
            ("secret_regs", str([sr.reg for sr in self.secret_registers])),
            ("secret_reg_exprs", str([str(sr.expr) for sr in self.secret_registers])),
            ("secret_reg_load_depths", str([sr.load_depth for sr in self.secret_registers])),
            ("secret_reg_addresses", str([str(sr.secret_address_expr)
                                          for sr in self.secret_registers])),
            ("branches", ordered_branches(self.branches)),
            ("constraints", ordered_constraints(self.constraints)),
            ("bbls", str([hex(x) for x in self.bbls])),
            ("aliases", str([str(x.to_BV()) for x in self.aliases])),
        ])
        return d
