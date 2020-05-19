.section .text
.globl _start
_start:
	pushl $4
	call ohhmyfac
	movl $1, %eax
	int $0x80

.type ohhmyfac, @function
ohhmyfac:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	movl 8(%ebp), %ecx
	movl %ecx, -4(%ebp)
start_loop:
	movl -4(%ebp), %eax
	decl %ecx
	imull %ecx, %eax
	movl %eax, -4(%ebp)
	cmpl $1, %ecx
	je end_loop
	jmp start_loop

end_loop:
	movl -4(%ebp), %ebx
	movl %ebp, %esp
	popl %ebp
	ret
	
	