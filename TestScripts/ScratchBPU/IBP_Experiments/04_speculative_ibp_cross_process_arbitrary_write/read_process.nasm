%include "../../../nops.inc"

%define nthreads 1
%define repeat0  1              ; Number of repetitions of whole test. Default = 8
%define repeat1  1000            ; Repeat count for loop around testcode. Default = no loop
%define repeat2  1               ; Repeat count for repeat macro around testcode. Default = 100
%define noptype  1

%macro testinit_once 0
    %rep 10
      call dummy_target_0
      mfence
      SERIALIZE
    %endrep
%endmacro

%macro testinitc 0              ; Macro to call in each test before reading counters.
    mov dword[PrintCustomPMC], 1

    lea rax, [UserData]
    mov [UserDataPtr], rax

    lea rax, [UserDataPtr]
    mov [UserDataPtrPtr], rax

    lea rax, [UserDataPtrPtr]
    mov [UserDataPtrPtrPtr], rax
%endmacro

%macro testcode 0               ; A multi-line macro executing any piece of test code.
acquire_spinlock_1_1:
    mov   eax, 1
    mov   rbx, [PSharedMemory2]
    xchg  eax, dword[rbx]
    test  eax, eax
    jnz   acquire_spinlock_1_1

    clflush [UserData+512]
    SERIALIZE_OPT

    mov rdx, 1
    mov qword[UserData], rdx

    mfence
    SERIALIZE

    call start_test_ibranch
    SERIALIZE_OPT

    READ_PMC_START
    mov r11, [UserData+512]
    READ_PMC_END

release_spinlock_0_1:
    SERIALIZE
    mfence
    mov rbx, [PSharedMemory]
    dec dword[rbx]

   %rep 512
     nop
    %endrep

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

%macro SERIALIZE_OPT 0
    mfence
    xor eax, eax
    cpuid
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

%rep 0x50000
  nop
%endrep

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

    %if speculative_jump
    SHIFT_PHR 15, 101 
    %endif

    align 1<<16
    %rep 0
     nop
    %endrep

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
section .sec_dummy_target_0 exec
dummy_target_0:
mov r9, [UserData+512]
%rep 100
  nop
%endrep
ret
