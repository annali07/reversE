#moving_data_between_registers: mov data between registers


.section .data

.section .text
    .globl _start

_start:
    nop                     #used for debugging purposes

    movl $22, %edx          #mov immediate value into EDX

mov_data_between_registers:
    movl %edx, %eax         #mov the value in EDX into EAX

exit:
    movl $1, %eax           #sys_exit system call
    movl $0, %ebx           #exit code 0 successful execution
    int $0x80               #call sys_exit
