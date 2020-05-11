.section .text
.globl _start
_start:
	call mysum
	movl $1, %eax
	int $0x80

.type mysum, @function
mysum:
	pushl %ebp
	movl %esp, %ebp
	subl $32, %esp
	movl $1, -32(%ebp)
	movl $2, -28(%ebp)
	movl $3, -24(%ebp)
	movl $4, -20(%ebp)
	movl $5, -16(%ebp)
	movl $0, -4(%ebp)
	leal -32(%ebp), %eax  #move the address 32 + ebp to eax
	movl %eax, -12(%ebp)
	movl $0, -8(%ebp)
	jmp .L2
.L3:
	movl -8(%ebp), %eax
	sall $2, %eax
	addl -12(%ebp), %eax
	movl (%eax), %eax
	addl %eax, -4(%ebp)
	movl -4(%ebp), %ebx
	addl $1, -8(%ebp)
.L2:
	cmpl $4, -8(%ebp)
	jle .L3
	movl %ebp, %esp
	popl %ebp
	ret
	