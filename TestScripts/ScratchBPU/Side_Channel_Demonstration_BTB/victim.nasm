%include "../../nops.inc"

%define nthreads 1
%define repeat0  1              ; Number of repetitions of whole test.
%define repeat1  100            ; Repeat count for loop around testcode.
%define repeat2  1              ; Repeat count for repeat macro around testcode.
%define noptype  2

; ---------------------------------------------------------------------------
; Barebones OpenSSL victim (the writer).
;
; Each round it calls strlen(password) and then PKCS5_PBKDF2_HMAC(password, ...).
;
; strlen(password) is the carrier: it goes through strlen@plt = `jmp
; *strlen@GOT(%rip)`. The attacker has trained that BTB entry (aliased by
; PC[23:0]) to point at pkey_fake_import, whose `call *(%rax)` then runs
; speculatively with rax = rdi = password and writes *password -- the secret --
; into the shared BTB. The real PKCS5_PBKDF2_HMAC call afterwards uses the
; length strlen measured.
;
; No cooperation with the attacker: no shared token, no sched_yield, no
; self-flush. The attacker takes itself off the core with nanosleep and opens
; the strlen@GOT speculation window by evicting the shared dTLB entry while the
; victim runs.  password / salt / key_len / out_key and the externs strlen /
; EVP_sha256 / PKCS5_PBKDF2_HMAC all come from the template.
; ---------------------------------------------------------------------------

%macro SERIALIZE_OPT 0
    mfence
    xor eax, eax
    cpuid
%endmacro

%macro testinitc 0
    ; Force lazy binding of strlen once, up front. The attack stalls strlen@plt
    ; every round, so its GOT slot must already hold the final libc address --
    ; otherwise the first stall lands in the dynamic resolver, not the window.
    mov rdi, password
    call strlen
%endmacro

; Carrier (strlen->pkey write) calls per round. find_target_addr.py passes
; -Dvictim_calls; default 5 (paired with the direct-gadget readback).
%ifndef victim_calls
%define victim_calls 5
%endif

%macro testcode 0
    %rep victim_calls
      SERIALIZE_OPT
      call start_test_ibranch
      SERIALIZE_OPT
    %endrep
%endmacro

section .sec_test_ibranch exec
start_test_ibranch:
    ; 16-byte reserve: a slot to stash strlen's result, sized so the ABI stack
    ; alignment at the two library calls below is the same as a plain
    ; EVP_sha256/PBKDF2 sequence.
    sub rsp, 16
    mov rdi, password
test_ibranch_pc:
    call strlen                   ; strlen@plt: the stalled, secret-carrying branch
    mov [rsp], rax                ; stash measured passlen across EVP_sha256

    call EVP_sha256
    mov r9, rax                   ; 6th arg: digest
    SERIALIZE_OPT

    ; PKCS5_PBKDF2_HMAC(pass, passlen, salt, saltlen, iter, digest, keylen, out)
    push out_key                  ; 8th arg: out
    push key_len                  ; 7th arg: keylen
    mov rdi, password
    mov rsi, [rsp+16]             ; 2nd arg: measured passlen (slot is +16 past
                                  ; the two args just pushed)
    mov rdx, salt
    mov rcx, salt_len
    mov r8, 10000                 ; 5th arg: PBKDF2 iteration count
    call PKCS5_PBKDF2_HMAC
    add rsp, 16                   ; drop the two stack args
    add rsp, 16                   ; release the reserved slot
    ret
