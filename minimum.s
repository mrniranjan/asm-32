#Purpose: To find minimum number (lowest) from series of numbers
#
#INPUT: The series of numbers are: 3,67,34,222,45,75,54,34,44,33,22,11,66,5
#
#OUTPUT: Lowest number: 5
#
#
.section .data
data_items:

.long 3,67,34,222,45,75,54,34,44,33,22,11,66,5,1,-1,223

.section .text
.globl _start

_start:
movl $1, %edi
movl data_items(,%edi,4), %eax 
movl %eax, %ebx

start_loop:
cmp $223, %eax
je loop_exit
incl %edi 
movl data_items(,%edi,4), %eax
cmpl %ebx, %eax 
jge start_loop

movl %eax, %ebx
jmp start_loop

loop_exit:
movl $1, %eax
int $0x80
