### We are passing 2 arguments
.globl mymul
mymul:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %eax
	movl 12(%ebp), %ebx
	xchg (%eax), %ecx
	xchg (%ebx), %edx
	imul %ecx,%edx
	xchg %ecx, (%eax)
	xchg %edx, (%ebx)
	movl %ebp, %esp
	popl %ebp
	ret
