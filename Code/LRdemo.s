@ LR Demo - Link Register Demo

    .global_start

_start:
    mov r7, #0x30
    b no_return             @ branch to no_return function which never returns

no_return:
    mov r7, #1              
    bl my_function          @ go to myfunc , bl loads the return address of wrap up
                            @ into lr

wrap_up:
    mov r7, #0x12           
    b exit                  @ branch to exit

my_function:
    mov r0, #10
    mov pc, lr



exit:
    mov r7, #1
    svc 0
