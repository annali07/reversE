#moving_data_between_mem_n_regs: mov data between mem and regs


.section .data
    constant:
        .int 10

.section .text
    .globl _start

_start:
    nop                         #used for debugging purposes

mov_immediate_data_between_mem_n_regs:
    movl constant, %ecx         #mov constant value into EAS register

exit:
    movl $1, %eax               #sys_exit system call
    movl $0, %ebx               #exit code 0 successful execution 
    int $0x80                   #call sys_exit
