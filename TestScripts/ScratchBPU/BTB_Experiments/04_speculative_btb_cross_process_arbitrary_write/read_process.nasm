%include "../../../nops.inc"

%define nthreads 1
%define repeat0  1              ; Number of repetitions of whole test. Default = 8
%define repeat1  1000            ; Repeat count for loop around testcode. Default = no loop
%define repeat2  1               ; Repeat count for repeat macro around testcode. Default = 100
%define noptype  1

%macro testinit_once 0
    %rep 10
      call dummy_target_0
      call dummy_target_1
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
%rep 1
acquire_spinlock_1_1:
    mov   eax, 1
    mov   rbx, [PSharedMemory2]
    xchg  eax, dword[rbx]
    test  eax, eax
    jnz   acquire_spinlock_1_1
%endrep

    clflush [dummy_target_0]
    clflush [dummy_target_1]
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
%rep 1
release_spinlock_0_1:
    SERIALIZE
    mfence
    mov rbx, [PSharedMemory]
    dec dword[rbx]
%endrep

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

section .sec_test_ibranch exec
align 1<<24
start_test_ibranch:
    lea r10, [target_test_0]
    lea r9, [target_test_1]
    cmp qword[UserData], 1
    cmovz r10, r9
    mov qword[UserData+64], r10
    clflush [UserData+64]
    SERIALIZE_OPT


   %if speculative_jump
    ; speculative_jump=1: ALIGN the reader's indirect jmp so its END lands at PC[23:0]=0x80,
    ; i.e. the SAME BTB entry as the write process's gadget_ibranch_pc -> it can read the
    ; injected target.  (BTB keys on the instruction end; jmp [mem] is 6 bytes, 0x7a=0x80-6.)
    times (0x7a - ($ - start_test_ibranch)) nop
   %endif
    ; speculative_jump=0: no padding -> the branch stays at its natural (lower) offset, so its
    ; END != 0x80.  It indexes a DIFFERENT BTB entry and cannot read the injected target.
test_ibranch_pc:
    jmp qword[UserData+64]
    %rep 512
     nop
    %endrep
    ret
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


section .sec_dummy_target_0 exec

%rep 512
nop
%endrep


dummy_target_0:
mov r9, [UserData+512]
%rep 100
  nop
%endrep
ret

dummy_target_1:
mov r9, [UserData+512]
%rep 100
  nop
%endrep
ret
