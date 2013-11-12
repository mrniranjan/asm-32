.section .text
.globl _start

_start:

movl $10, %eax
movl $5, %edi

movl $0, %edx
divl %edi 		//divide eax by edi 
movl %eax, %ebx 	
mov $1, %eax
int $0x80
