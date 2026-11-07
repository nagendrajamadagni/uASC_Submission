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

    %rep 10
        mov qword[UserData], 0
        mov qword[UserData+1024], 0
	lea rax, [target_ibranch_reader]
	mov qword[UserData+128], rax
        SERIALIZE_OPT
        call start_spec_reader

        mov qword[UserData], 1
        mov qword[UserData+1024], 1
	lea rax, [target_ibranch_reader]
	mov qword[UserData+128], rax
        SERIALIZE_OPT
        call start_spec_reader
    %endrep

%endmacro

%macro testcode 0
step_1:
    ; Step 1 - Mistrain injection_cbranch and and allocate IBP entry for injection_ibranch
    %rep 100
        lea rax, [target_ibranch_injection]
	mov [UserData+128], rax
        mov qword[UserData], 0
        mov qword[UserData+1024], 1
        SERIALIZE_OPT
        call start_spec_injection
    %endrep

    SERIALIZE_OPT


    ; Step 3 - Speculatively inject IBP entry
    %rep 4
        mov qword[UserData], 1
        mov qword[UserData+1024], 1
	lea rax, [start_malicious_target]
	mov [UserData+128], rax
        clflush [UserData]
        clflush [UserDataPtr]
        clflush [UserDataPtrPtr]
        clflush [UserDataPtrPtrPtr]
        SERIALIZE_OPT
        call start_spec_injection
    %endrep

    SERIALIZE_OPT

    ; Step 4 - Check if test_ibranch is mispredicted to target_ibranch_injection
    ; If yes, the IBP entry was successfully speculatively overwritten in Step 3

    ; Test speculative reader gadget
    mov qword[UserData+1536], 0 ; Counter for reader loop iterations
start_check_reader:
    ; Out-of-place mistraining for spec_reader_cbranch

    %rep 10
        mov qword[UserData], 0
        mov qword[UserData+1024], 1
        SERIALIZE_OPT
        call start_aliased_cbranch
    %endrep

    ; Use dummy_ibranch to force ibranch prediction to use IBP
    %rep 10
        rdrand rdx
        and rdx, 1
        mov qword[UserData], rdx
        SERIALIZE_OPT
        call start_dummy_ibranch
    %endrep

    %rep 1
        mov qword[UserData], 1
        mov qword[UserData+1024], 1
        clflush [start_malicious_target]
	lea rax, [target_ibranch_reader]
	mov qword[UserData+128], rax
        SERIALIZE_OPT
        call start_spec_reader
    %endrep
    inc qword[UserData+1536]
    cmp qword[UserData+1536], 100
check_reader_loop_end:
    jl start_check_reader

    ; Check if "target_ibranch_injection" is still in IBP
    READ_PMC_START
    mov rdx, [start_malicious_target]
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
        cmp qword[UserData+1024], 1 ; Here is UserData is set to 1, the PHR value
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

section .sec_spec_injection exec
start_spec_injection:
    ;lea rax, [target_ibranch_injection]
    ;mov qword[UserData+128], rax
    clflush [UserData+128]
    SHIFT_PHR 195, 0
    SET_PHR 50, 0
    align 1<<16
    SERIALIZE_OPT

    ; Access 3-level Pointer to access condition variable
    %rep 128 + 1
      nop
    %endrep
    mov rax, [UserDataPtrPtrPtr]
    mov rbx, [rax]
    mov rcx, [rbx]
    mov rdx, [rcx]

    ; Access 1-level Pointer to access condition variable
    ; %rep 128 + 9
    ;   nop
    ; %endrep
    ; mov rdx, [UserData]

    cmp rdx, 1
pc_cbranch_injection:
    je target_cbranch_injection
pc_ibranch_injection:
    jmp qword[UserData+128]
    %rep 4096
     nop
    %endrep
target_ibranch_injection:
    %rep 4096
     nop
    %endrep
target_cbranch_injection:
    %rep 64
     nop
    %endrep
    ret

section .sec_spec_reader exec
start_spec_reader:
    ;lea rax, [target_ibranch_reader]
    ;mov qword[UserData+128], rax
    ;clflush [UserData+128]
    SHIFT_PHR 195, 1
    SET_PHR 50, 1
    align 1<<16
    SERIALIZE_OPT

    ; Access 1-level Pointer to access condition variable
    %rep 64 + 10
      nop
    %endrep
    mov rdx, qword[UserData]
    cmp rdx, 1
pc_cbranch_reader:
    je target_cbranch_reader
    %rep 64
     nop
    %endrep
pc_ibranch_reader:
    jmp qword[UserData+128]
    %rep 1024
     nop
    %endrep
target_ibranch_reader:
    %rep 1024
     nop
    %endrep
target_cbranch_reader:
    %rep 64
     nop
    %endrep
    ret

section .sec_aliased_cbranch exec
start_aliased_cbranch:
    SHIFT_PHR 195, 2
    SET_PHR 50, 2
    align 1<<16
    SERIALIZE_OPT

    %rep 64 + 10
      nop
    %endrep
    mov rdx, [UserData]
    cmp rdx, 1
pc_cbranch_aliased:
    ; Aliased with cbranch_reader in CBP (not BTB) to do out-of-place mistraining
    je target_cbranch_aliased
    %rep 2048
     nop
    %endrep
target_cbranch_aliased:
    %rep 8
     nop
    %endrep
    ret

section .sec_dummy_ibranch exec
start_dummy_ibranch:
    mov r10, qword[UserData]
    mov qword[UserData+1024], r10
    lea r10, [target_dummy_0]
    lea r9, [target_dummy_1]
    cmp qword[UserData], 1
    cmovz r10, r9
    mov qword[UserData+64], r10
    SERIALIZE_OPT

    ; SHIFT_PHR 195, 4
    ; SET_PHR 10, 4
    ; align 1<<16

pc_ibranch_dummy:
    jmp qword[UserData+64]
    %rep 512
     nop
    %endrep
target_dummy_0:
    %rep 512
     nop
    %endrep
    ret
    %rep 512
     nop
    %endrep
target_dummy_1:
    %rep 512
     nop
    %endrep
    ret


%rep 512
  nop
%endrep

section .sec_malicious_target exec
start_malicious_target:
    mov r9, [UserData+2048]
    %rep 512
      nop
    %endrep
