#indirect_addressing_with_registers: accessing data in mem using pointers


.section .data
    constants:
        .int 5, 8, 17, 44, 50, 52, 60, 65, 70, 77, 80

.section .text
    .globl _start

_start:
    nop                         #used for debugging purposes

indirect_addressing_with_registers:
    movl constants, %eax            #mov constants mem value into eax
    movl $constants, %edi           #mov mem addr into edi
    movl $25, (%edi)               #mov immediate val 4b after edi ptr 
    movl $0, %edi                   #load 2nd index constants label 
    movl constants(, %edi, 1), %ebx  #mov above value 4 bytes from constants 

exit:
    movl $1, %eax                   #sys_exit system call
    movl $0, %ebx                   #exit code 0 successful execution 
    int $0x80
