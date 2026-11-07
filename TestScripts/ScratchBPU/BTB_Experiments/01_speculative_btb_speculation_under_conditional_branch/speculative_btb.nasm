%include "../../../nops.inc"

%define repeat0  1              ; Number of repetitions of whole test. Default = 8
%define repeat1  1000           ; Repeat count for loop around testcode. Default = no loop
%define repeat2  1              ; Repeat count for repeat macro around testcode. Default = 100
%define noptype  2

%macro testinitc 0              ; Macro to call in each test before reading counters.
    mov dword[PrintCustomPMC], 1
    lea rax, [UserData]
    mov [UserDataPtr], rax

    lea rax, [UserDataPtr]
    mov [UserDataPtrPtr], rax

    lea rax, [UserDataPtrPtr]
    mov [UserDataPtrPtrPtr], rax

open_msr_file:
    mov rdi, msr_file
    mov rsi, open_flag
    mov rax, syscall_open
    syscall                
    mov [UserData+128], rax ; file desriptor
    mfence
    SERIALIZE
%endmacro

%macro testafter3 0 
close_msr_file:
    mov rdi, [UserData+128]
    mov rax, syscall_close
    syscall
    mfence
    SERIALIZE
%endmacro

%macro testcode 0               ; A multi-line macro executing any piece of test code.

    ; Step 1 - Train CBP
    %rep 100
        mov qword[UserData], 0
        SERIALIZE_OPT
        call start_gadget
    %endrep

    ; COMMAND_IBPB 1

    SERIALIZE_OPT

    ; Step 2 - Train IBP
    %rep 10
        rdrand r8
        and r8, 1
        lea r11, [gadget_ind_1]
        mov r9, sec_test_ibranch_addr
        SERIALIZE_OPT
        call r9
        
        xor r8, 1
        lea r11, [gadget_ind_1]
        mov r9, sec_test_ibranch_addr
        SERIALIZE_OPT
        call r9
    %endrep

    SERIALIZE_OPT

    ; Step 2.5 - Evict IBP
    %rep 10
        rdrand rdx
        and rdx, 1
        mov qword[UserData], rdx
        SERIALIZE_OPT
        call start_evict_ibp
        xor qword[UserData], 1
        SERIALIZE_OPT
        call start_evict_ibp
    %endrep

    SERIALIZE_OPT

    ; Step 3 - Try to overwrite BTB during speculation
    %rep 4
        mov qword[UserData], 1
        clflush [UserData]
        clflush [UserDataPtr]
        clflush [UserDataPtrPtr]
        clflush [UserDataPtrPtrPtr]
        SERIALIZE_OPT
        call start_gadget
    %endrep

    SERIALIZE_OPT

    ; Step 4 - Measure if BTB is overwritten
    ; Measure if the indirect branch is mispredicted
    ; & if instruction at "gadget_ind_1" is hit
    %assign test_target_addr (sec_test_target_addr+51)
    mov r8, 0 ; 0 leads to collision but 1 does not cause collision
    lea r11, [gadget_ind_1]
    mov r9, sec_test_ibranch_addr
    mov r11, test_target_addr
    clflush [r11]
    clflush [gadget_ind_1]
    SERIALIZE_OPT

    call r9
    SERIALIZE_OPT

    ; !! check the section address in run.sh !!
    ; If PC[47:32] of test ibranch is different from that of gadget ibranch,
    ; it will not speculatively jump to gadget_ind_1,
    ; because BTB only records 32-bit address.
    
    READ_PMC_START
    mov rdx, [gadget_ind_1]
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

%macro SET_PHR 2
    %assign i 0
    %rep %1
        cmp rdx, 1
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

%macro COMMAND_IBPB 1
    mov dword[syscall_input], %1
    mov rdi, [UserData+128]    ; First argument: file descriptor
    mov rsi, syscall_input          ; Second argument: pointer to data
    mov rdx, 8             ; Third argument: count (number of bytes to write)
    mov r10, 73            ; Fourth argument: offset
    mov rax, syscall_pwrite
    syscall
%endmacro

section .sec_evict_ibp exec
start_evict_ibp:
    %assign k 2
    %rep 6
        lea r10, [target_evict_0_%+ k]
        lea r9, [target_evict_1_%+ k]
        mov rdx, qword[UserData]
        cmp rdx, 1
        cmovz r10, r9
        SHIFT_PHR 195, k
        SET_PHR 25, k
        SERIALIZE_OPT
        %rep k<<7
         nop
        %endrep
    evict_ibranch_pc_%+ k:
        jmp r10
        %rep 512
         nop
        %endrep
    target_evict_0_%+ k:
        %rep 512
         nop
        %endrep
    target_evict_1_%+ k:
        %rep 512
         nop
        %endrep
    %assign k k+1
    %endrep
    ret

section .sec_gadget exec
    nop
    align 1<<16
start_gadget:
    SHIFT_PHR 195, 0
    SERIALIZE_OPT

    ; Access 3-level Pointer
    clflush [UserData]
    mov rax, [UserDataPtrPtrPtr]
    mov rbx, [rax]
    mov rcx, [rbx]
    mov rdx, [rcx]
    cmp rdx, 1
    je gadget_cond ;nop6
    lea r10, [gadget_ind_1]
gadget_ibranch_pc:
    jmp r10
    %rep 4096
     nop
    %endrep
gadget_ind_0:
    %rep 4096
     nop
    %endrep
gadget_ind_1:
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
    mov rdx, r8
    lea r10, [target_test_0]
    lea r9, [target_test_1]
    cmp rdx, 1
    cmovz r10, r9
    SHIFT_PHR 195, 1
    SET_PHR 25, 1 ; Ensure that IBP entry is different
    SERIALIZE_OPT

    %if speculative_jump
    align 1<<16
    %rep 37
     nop
    %endrep
    %endif
    clflush [r11]
    SERIALIZE_OPT
    ; nop
test_ibranch_pc:
    jmp r10
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

section .sec_test_target exec
    %rep 51
     nop
    %endrep
test_target:
    %rep 64
     nop
    %endrep
