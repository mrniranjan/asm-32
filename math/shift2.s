.section .data
.section .text
.globl _start
_start:
	movb $8, %bl
	shr $1, %bl
	movl $1, %eax
	int $0x80

