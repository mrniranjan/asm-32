#This program divides values in variable var1 with
# value in var2
.section .data
var1:
	.int 5
.section .text
.globl _start
_start:
	call divideby5
	movl $1, %eax
	int $0x80
.type divideby5, @function
divideby5:
	pushl %ebp
	movl %esp, %ebp
	movl $-4, %edi
	pushl $5
	pushl $10
	pushl $15
	pushl $20
	pushl $25

start_loop:
	movl $0, %edx
	mov var1, %eax
	cmpl $-20, %edi
	je exit_loop
	movl (%ebp, %edi), %ecx
	div %ecx
	addl $-4, %edi
	jmp start_loop
	
exit_loop:
	movl %ebp, %esp
	popl %ebp
	ret
	
	