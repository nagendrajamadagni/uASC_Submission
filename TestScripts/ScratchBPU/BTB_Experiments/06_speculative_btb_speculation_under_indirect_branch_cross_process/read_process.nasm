%include "../../../nops.inc"

%define nthreads 1
%define repeat0  1              ; Number of repetitions of whole test. Default = 8
%define repeat1  1000            ; Repeat count for loop around testcode. Default = no loop
%define repeat2  1               ; Repeat count for repeat macro around testcode. Default = 100
%define noptype  1

%macro testinit_once 0
    %rep 10
      call dummy_target_0
      call malicious_target_0
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

    %rep 100
        lea r11, [dummy_target_0]
        SERIALIZE_OPT
        call start_collision
    %endrep

    SERIALIZE_OPT


release_spinlock_0_1:
    SERIALIZE
    mfence
    mov rbx, [PSharedMemory]
    dec dword[rbx]

acquire_spinlock_again:
    mov   eax, 1
    mov   rbx, [PSharedMemory2]
    xchg  eax, dword[rbx]
    test  eax, eax
    jnz   acquire_spinlock_again

    clflush [malicious_target_0]
    SERIALIZE_OPT

    lea r11, [dummy_target_0]
    clflush [dummy_target_0]
    SERIALIZE_OPT
    call start_gadget_0 ; Directly call the gadget to mis-speculate

    READ_PMC_START
      mov r9, [malicious_target_0]
    READ_PMC_END


release_spinlock_again:
    SERIALIZE
    mfence
    mov rbx, [PSharedMemory2]
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

section .sec_gadget_0 exec
start_gadget_0:
    jmp r11 ; Insert/Fetch malicious_target into IBP
    %rep 512
      nop
    %endrep
    ret

%rep 512
  nop
%endrep

section .sec_gadget_1 exec
start_gadget_1:
    jmp r11 ; Speculatively fetch/insert malicious target
    %rep 512
      nop
    %endrep
   ret

%rep 512
  nop
%endrep

section .sec_collision exec
start_collision:
    lea r10, [start_gadget_0] ; Load gadget 0
    mov qword[UserData + 64], r10
    SERIALIZE_OPT

    ; Pad so collision_ibranch_pc lands at the same section-relative offset
    ; (0x20) as test_ibranch_pc in write_process, so the two indirect
    ; branches end up at the same absolute address cross-process.
    times (0x20 - ($ - start_collision)) nop

collision_ibranch_pc:
    jmp qword[UserData+64] ; PHR is different after jmp rdx
    %rep 512
     nop
    %endrep
collision_ind_0:
    %rep 512
     nop
    %endrep
    ret
collision_ind_1:
    %rep 4096
     nop
    %endrep
    ret

section .sec_dummy_target exec
dummy_target_0:
    mov r9, [UserData+512]
    %rep 512
      nop
    %endrep
    ret

%rep 512
  nop
%endrep

section .sec_malicious_target exec
malicious_target_0:
    mov r9, [UserData+1024]
    %rep 512
      nop
    %endrep
    ret

%rep 512
  nop
%endrep
