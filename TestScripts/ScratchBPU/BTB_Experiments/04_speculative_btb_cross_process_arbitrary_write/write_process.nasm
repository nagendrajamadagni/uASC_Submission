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

%endmacro

%macro testcode 0               ; A multi-line macro executing any piece of test code.
acquire_spinlock_0_0:
    mov   eax, 1
    mov   rbx, [PSharedMemory]
    xchg  eax, dword[rbx]
    test  eax, eax
    jnz   acquire_spinlock_0_0

; Step 1 - Train CBP

    %rep 100
      mov qword[UserData], 0
      lea r11, [gadget_ind_1]
      SERIALIZE_OPT
      call start_gadget
    %endrep

    SERIALIZE_OPT


    ; Step 3 - Try to overwrite BTB during speculation
    %rep 5
        mov qword[UserData], 1 ; Change condition here
        clflush [UserData]
        clflush [UserDataPtr]
        clflush [UserDataPtrPtr]
        clflush [UserDataPtrPtrPtr]
        mov r11, 0x1000883   ; = read process's dummy_target_0 (RE-SYNC if either layout changes)
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
align 1<<24
start_gadget:

    SERIALIZE_OPT

    ; Access 3-level Pointer
    mov rax, [UserDataPtrPtrPtr]
    mov rbx, [rax]
    mov rcx, [rbx]
    mov rdx, [rcx]
    ; Pad BEFORE the compare so the fixed 13-byte tail (cmp=4, je=6, jmp r11=3)
    ; lands the indirect jmp's END at PC[23:0]=0x80, while keeping `je` DIRECTLY
    ; above the indirect jmp (no padding inserted between them).  0x73 = 0x80 - 13.
    times (0x73 - ($ - start_gadget)) nop
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
align 1<<24
start_test_ibranch:
    lea r10, [target_test_0]
    lea r9, [target_test_1]
    cmp qword[UserData], 1
    cmovz r10, r9
    mov qword[UserData+64], r10
    SERIALIZE_OPT

    SHIFT_PHR 195, 1

    SET_PHR 15, 101
    %rep 0x1e
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
        SET_PHR 15, k
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

