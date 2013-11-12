.section .data
.section .text
.globl _start
_start:
	pushl $17
	pushl $15
	call sum
	addl $8, %esp
	movl $1, %eax
	int $0x80
.type sum, @function
sum:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %ecx
	movl 12(%ebp), %ebx
	addl %ecx,%ebx
	movl %ebp,%esp
	popl %ebp
	ret
