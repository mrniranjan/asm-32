# This program multiple value in variable 2 with
# values in var1. 
.section .data
var1:
	.int 1,2,3,4,5
var2:
	.int 2
.section .text
.globl _start
_start:
	pushl $var1
	pushl var2
	call multiplyby2
	movl $1, %eax
	int $0x80
.type multiplyby2, @function
multiplyby2:
	pushl %ebp
	movl %esp, %ebp
	addl $4, %edi
	movl 8(%ebp), %ecx
	movl 12(%ebp), %ebx
start_loop:
	cmpl $20, %edi
	je exit
	movl (%ecx, %edi), %eax
	mul %ebx
	addl $4, %edi
	jmp start_loop


exit:
	movl %ebp, %esp
	popl %ebp
	ret
	

	