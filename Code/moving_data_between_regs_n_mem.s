#moving_data_between_regs_n_mem: mov data between regs and mem


.section .data
    constant:
        .int 10

.section .text
    .globl _start

_start:
    nop                     #used for debugging purposes

mov_immediate_data_between_regs_n_mem:
    movl $777, %eax         #mov immediate value 777 to eax
    movl %eax, constant     #mov eax value into constant mem value 

exit:
    movl $1, %eax           #sys_exit system call
    movl $0, %ebx           #exit code 0 successful execution
    int $0x80               #call sys_exit
