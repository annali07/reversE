#cmov_instructions: conditional move instruction 


.section .data
    result:
        .asciz "The smallest value is "
    lr:
        .ascii ".\n"
    constants:
        .int 43, 144, 32, 549, 600, 7, 10, 11

.section .bss
    .comm answer, 1

.section .text
    .globl _start

_start:
    nop                                 #used for debugging purposes

    movl constants, %ebx                #mov array values into ebx
    movl $1, %edi                       #load 2nd index constants label 

find_smallest_value:
    movl constants(, %edi, 4), %eax     #mov value 4 bytes from constants
    cmp %ebx, %eax                      #compare ebx to eax 
    cmovb %eax, %ebx                     #compare below eax to ebx 
    inc %edi                            #increment edi to move through array 
    cmp $8, %edi                        #check where we are in array
    jne find_smallest_value             #jne to begining of loop
    addl $0x30, %ebx                    #convert int to ascii
    movl %ebx, answer                   #move new value of ebx to answer label 

    movl $4, %eax                       #sys_write
    movl $1, %ebx                       #stdout
    movl $result, %ecx                  #mov result into ecx
    movl $23, %edx                      #mov 23 bytes into edx
    int $0x80                           #call sys_write

    movl $4, %eax                       #sys_write
    movl $1, %ebx                       #stdout
    movl $answer, %ecx                  #mov answer label into ecx
    movl $1, %edx                       #mov 1 byte into edx
    int $0x80                           #call sys_write

    movl $4, %eax                       #sys_write
    movl $1, %ebx                       #stdout
    movl $lr, %ecx                      #mov lr label into ecx
    movl $2, %edx                       #mov 1 bytes into edx
    int $0x80                           #call sys_write

exit:
    movl $1, %eax                       #sys_write
    movl $0, %ebx                       #exit code 0 succeessful execution 
    int $0x80                           #call sys_exit
