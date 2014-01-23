.section .data
.section .text
.globl _start
_start:
	movb $8, %bl
	sal $2, %bl	##Arithmetic shift left
	movl $1, %eax
	int $0x80

