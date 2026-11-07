%include "../../../nops.inc"

%define repeat0  1             ; Number of repetitions of whole test. Default = 8
%define repeat1  1000           ; Repeat count for loop around testcode. Default = no loop
%define repeat2  1              ; Repeat count for repeat macro around testcode. Default = 100
%define noptype  2

%macro testinitc 0              ; Macro to call in each test before reading counters.
    mov dword[PrintCustomPMC], 1

;   Setup a linked-list pointer de-referencing
;   to increase size of speculation window

    lea rax, [UserData]
    mov [UserDataPtr], rax

    lea rax, [UserDataPtr]
    mov [UserDataPtrPtr], rax

    lea rax, [UserDataPtrPtr]
    mov [UserDataPtrPtrPtr], rax
%endmacro

%macro testcode 0               ; A multi-line macro executing any piece of test code.

    ; Step 1 - Train CBP
    %rep 100
        mov qword[UserData], 0
        SERIALIZE_OPT
        call start_gadget
    %endrep

    SERIALIZE_OPT

    ; Step 2 - Train IBP
    %rep 20
        rdrand rdx
        and rdx, 1
        mov qword[UserData], rdx
        SERIALIZE_OPT
        call start_test_ibranch
    %endrep

    SERIALIZE_OPT

    ; Step 3 - Try to overwrite IBP during speculation
    %rep 4
        mov qword[UserData], 1
        SERIALIZE_OPT
        call start_gadget
    %endrep

    SERIALIZE_OPT

    ; Step 4 - Measure if IBP is overwritten
    ; Measure if the indirect branch is mispredicted
    ; & if instruction at "gadget_ind_1" is hit
    
    clflush [UserData + 2048]
    mov qword[UserData], speculative_jump
    SERIALIZE_OPT
    call start_test_ibranch
    SERIALIZE_OPT
    READ_PMC_START
    mov rdx, [UserData + 2048]
    READ_PMC_END

    %rep 512
     nop
    %endrep
%endmacro

%macro SERIALIZE_OPT 0
    mfence
    xor eax, eax
    cpuid
%endmacro

; Shift the PHR by the given number of doublets

%macro SHIFT_PHR 2
    mov rax, %1
    jmp shift_phr_%+ %2
    align 1<<16
    %rep (1<<16)-64
     nop
    %endrep
    shift_phr_%+ %2:
    %rep 64-8
     nop
    %endrep
    dec rax
    cmp rax, 0
    jg shift_phr_%+ %2
%endmacro

; Set the given number of doublets to 1 in the PHR

%macro SET_PHR 2
    %assign i 0
    %rep %1
        cmp qword[UserData], 1 ; Here is UserData is set to 1, the PHR value 
			       ; changes for the two indirect branches and
			       ; prevents collisions in the IBP
        je set_phr_eq_%+ %2_%+ i
        %rep 64
         nop
        %endrep
        set_phr_eq_%+ %2_%+ i:
        %rep 64
         nop
        %endrep
        %assign i i+1
    %endrep
%endmacro

section .sec_gadget exec
start_gadget:
    SHIFT_PHR 195, 0
    SERIALIZE_OPT

    ; Access 3-level Pointer to access condition variable
    mov rax, [UserDataPtrPtrPtr]
    mov rbx, [rax]
    mov rcx, [rbx]
    mov rdx, [rcx]
    cmp rdx, 1
    je gadget_cond
    lea rax, [gadget_ind_1] ; Write the address of gadget_1
			    ; into the IBP during speculation
gadget_ibranch_pc:
    jmp rax
    %rep 4096
     nop
    %endrep
gadget_ind_0:
    %rep 4096
     nop
    %endrep
gadget_ind_1:
    mov rax, [UserData + 2048]
    %rep 4096
     nop
    %endrep
gadget_cond:
    %rep 64
     nop
    %endrep
    ret

section .sec_test_ibranch exec
start_test_ibranch:
    lea r10, [target_test_0]
    lea r9, [target_test_1]
    cmp qword[UserData], 1
    cmovz r10, r9
    mov qword[UserData+64], r10
    SERIALIZE_OPT

    SHIFT_PHR 195, 1
    SET_PHR 50, 1
    align 1<<16

test_ibranch_pc:
    jmp qword[UserData+64]
    %rep 512
     nop
    %endrep
target_test_0:
    %rep 512
     nop
    %endrep
    ret
target_test_1:
    %rep 512
     nop
    %endrep
    ret
