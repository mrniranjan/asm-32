#This program will replace first and last numbers
# the 

.section .data
a1:
	.int 55,11,45,22,2,16
key:
	.int 0
.section .text
.globl _start
_start:
	pushl a1
	call mysort
	movl $1, %eax
	int $0x80

.type mysort, @function
mysort:
	pushl %ebp
	movl %esp, %ebp
	movl $0, %edi #i = 0
	movl $0, %edx # j = 0
outer_loop:
	movl a1(,%edi,4), %ebx # key
	cmpl $5, %edi
	je exit_outer_loop
	movl %ebx, key
	movl %edi, %ebx
	subl $1, %ebx
	movl %ebx, %edx
inner_loop:
	cmpl $0, %edx
	jle xchange
	cmpl a1(, %edx, 4), %ecx
	cmpl %ecx, key
	jg swap
swap:	
	movl %edx, %eax
	addl $1, %eax
	movl a1(,%eax,4), %ebx
	movl %ebx, a1(,%edi,4)
	decl %edx
	jmp inner_loop
	
xchange:
	addl $1, %edx
	movl %ecx, a1(,%edx,4)
	incl %edi
	jmp outer_loop

exit_outer_loop:
	movl %ebp, %esp
	popl %ebp
	ret
	
	
	
	