.section .text
.globl _start
_start:
	pushl $5
	call square
	movl $1, %eax
	int $0x80

.type square,function
square:
	pushl %ebp
	movl %esp,%ebp
	movl 8(%ebp), %ebx
	imul 8(%ebp), %ebx
	movl %ebp, %esp
	popl %ebp
	ret

