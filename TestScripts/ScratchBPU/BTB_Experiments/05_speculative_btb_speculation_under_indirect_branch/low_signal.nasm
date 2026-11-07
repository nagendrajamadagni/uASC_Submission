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

    call malicious_target_0
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

    ; Step 1 - Train IBP to have 1 pair of victim indirect branch
    %rep 20
        call start_test_ibranch
    %endrep

    ; Victim branch exists and has targets set to target_test_0 and target_test_1

    SERIALIZE_OPT

    ; Step 2 - Train IBP to have another branch that collides with the victim branch in the IBP
    %rep 100
        lea r11, [dummy_target_0]
        SERIALIZE_OPT
        call start_collision
    %endrep

    SERIALIZE_OPT

    
    EVICT_IBP 

    SERIALIZE_OPT

   ; Now the test_ibranch is replaced in the IBP
    
   ; Step 3 - Try to overwrite IBP during speculation

    %rep 5 * speculative_jump
	    lea r11, [malicious_target_0] ; Different target from Step 2 which has never been loaded
        SERIALIZE_OPT
        call start_test_ibranch
    %endrep

    SERIALIZE_OPT

   ; start_test_ibranch should speculatively jump to collision branch and jump to malicious target via the gadget

   ; Step 4 - Check if over-writing has occured in the IBP

    ;EVICT_IBP 

    ;SERIALIZE_OPT

   
    clflush [UserData+1024]
    clflush [malicious_target_0]
    SERIALIZE_OPT

    lea r11, [dummy_target_0]
    clflush [dummy_target_0]
    SERIALIZE_OPT
    call start_collision

    READ_PMC_START
      mov r9, [malicious_target_0]
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

section .sec_collision exec
start_collision:
    lea r10, [start_gadget_0] ; Load gadget 0
    mov qword[UserData + 64], r10
    SERIALIZE_OPT

    %rep 7
      nop
    %endrep

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

section .sec_test_ibranch exec
start_test_ibranch:
    lea r10, [target_test_0] ; Load target_test_0
    mov qword[UserData+64], r10
    clflush [UserData+64]
    SERIALIZE_OPT
test_ibranch_pc:
    jmp qword[UserData+64] ; Jump to target_test_0
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

