section .text
    global clear_phr
    global shift_phr
    global set_phr

clear_phr:

    mov r10, 200
    jmp clear_phr_loop
    align 1<<16
    %rep (1<<16)-64
     nop
    %endrep
    clear_phr_loop:
    %rep 60
     nop
    %endrep
    dec r10
    jnz clear_phr_loop

    ret

shift_phr:

    mov r10, 193
    jmp shift_phr_loop
    align 1<<16
    %rep (1<<16)-64
     nop
    %endrep
    shift_phr_loop:
    %rep 60
     nop
    %endrep
    dec r10
    jnz shift_phr_loop

    ret

set_phr:

    mov r10, 200
    jmp clear_phr_loop2
    align 1<<16
    %rep (1<<16)-64
     nop
    %endrep
    clear_phr_loop2:
    %rep 60
     nop
    %endrep
    dec r10
    jnz clear_phr_loop2

    %assign i 0
    cmp edi, 0
    %rep 50
        je label_set_phr_0%+ i 
        nop
        label_set_phr_0%+ i:
        %assign i i+1
    %endrep
    cmp edi, 1
    %rep 50
        je label_set_phr_1%+ i 
        nop
        label_set_phr_1%+ i:
        %assign i i+1
    %endrep

    ret
