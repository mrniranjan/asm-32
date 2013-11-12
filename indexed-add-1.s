#Purpose: Indexed addressing mode
#
#Variables
.section .data

t1:
.long 5,6,7,8

.section .text
.globl _start
_start:
movl $0, %edi
movl $0, %eax
movl $0, %ebx
start_loop:
cmpl $4, %edi
je loop_exit
movl t1(,%edi,4), %eax
add %eax, %ebx
incl %edi
cmpl $4, %edi
jle start_loop

loop_exit:
movl $1, %eax;
int $0x80
