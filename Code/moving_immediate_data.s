#moving immediate data: mov immediate data between registers & memory


.section .data

.section .bss
    .lcomm buffer 1

.section .text
    .globl _start

_start:
    nop                     #used for debugging purposes

mov_immediate_data_to_register:
    movl $100, %eax         #mov 100 into the EAX register
    movl $0x50, buffer      #mov 0x50 into buffer memory location

exit:
    movl $1, %eax           #sys_exit system call
    movl $0, %ebx           #exit code 0 successful execution 
    int $0x80               #call sys_exit
