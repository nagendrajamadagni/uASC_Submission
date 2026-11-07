%include "../../../nops.inc"

%define nthreads 1
%define repeat0  1              ; Number of repetitions of whole test. Default = 8
%define repeat1  100              ; Repeat count for loop around testcode. Default = no loop
%define repeat2  1              ; Repeat count for repeat macro around testcode. Default = 100
%define noptype  2

%macro testinitc 0
    lea rax, [UserData]
    mov [UserDataPtr], rax

    lea rax, [UserDataPtr]
    mov [UserDataPtrPtr], rax

    lea rax, [UserDataPtrPtr]
    mov [UserDataPtrPtrPtr], rax

    mov rbx, [PSharedMemory]
    mov dword[rbx], 0

    mov rbx, [PSharedMemory2]
    mov dword[rbx], 1
    call victim_target

%endmacro

%macro testcode 0               ; A multi-line macro executing any piece of test code. 
acquire_spinlock_0_0:
    mov   eax, 1 ; eax has 1
    mov   rbx, [PSharedMemory]
    xchg  eax, dword[rbx] ; PShared Memory has 1, eax has 0
    test  eax, eax
    jnz   acquire_spinlock_0_0 ; If not 0 spin, if 0 continue - 0 in smem implies 0 process hold it

; Step 1 - Train CBP

    %rep 100
      mov qword[UserData], 0
      lea r11, [gadget_ind_1]
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
    %rep 5
        mov qword[UserData], 1
	    lea r11, [victim_target]
        clflush [UserDataPtrPtrPtr]
        clflush [UserDataPtrPtr]
        clflush [UserDataPtr]
        clflush [UserData]
        SERIALIZE_OPT
        call start_gadget
    %endrep

    SERIALIZE_OPT


release_spinlock_1_0:
    SERIALIZE
    mfence
    mov rbx, [PSharedMemory2]
    dec dword[rbx]
    
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
        cmp qword[UserData], 1
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

%macro SET_PHR_EVEN 1
    cmp rdx, 1
    %rep 50
     nop
    %endrep
    je set_phr_even_%+ %1
    align 1<<6
    set_phr_even_%+ %1:
    %rep 77H
     nop
    %endrep
%endmacro


section .sec_gadget exec
start_gadget:
    SHIFT_PHR 195, 0
    SET_PHR_EVEN 0

    SHIFT_PHR 15, 201
    SERIALIZE_OPT

    ; Access 3-level Pointer
    mov rax, [UserDataPtrPtrPtr]
    mov rbx, [rax]
    mov rcx, [rbx]
    mov rdx, [rcx]
    cmp rdx, 1
    je gadget_cond
gadget_ibranch_pc:
    jmp r11
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
    lea r10, [target_test_0]
    lea r9, [target_test_1]
    cmp qword[UserData], 1
    cmovz r10, r9
    mov qword[UserData+64], r10
    SERIALIZE_OPT

    SHIFT_PHR 195, 1
    SET_PHR_EVEN 1

    SHIFT_PHR 15, 101
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

align 1<<19
section .sec_victim_target exec
victim_target:
  %rep 512
    nop
  %endrep
