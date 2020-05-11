.section .data
factors:
	.int 0
.section .text
.globl _start
_start:
	pushl $factors
	pushl $8
	call ohmyfac
	push $factors
	call getmyfactors
	movl $1, %eax
	int $0x80

.type ohmyfac, @function
ohmyfac:

	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	movl 8(%ebp), %eax
	cdq
	movl 12(%ebp), %ebx
	movl %eax, -4(%ebp)
	movl $0, %edi
	movl $1, %ecx 

start_loop:
	movl $0, %edx
	cmpl %ecx, 8(%ebp)
	je end_loop
	movl -4(%ebp), %eax
	idiv %ecx
	cmpl $0, %edx
	je save_factors
	incl %ecx
	jmp start_loop

end_loop:
	movl $0, (%ebx, %edi)
	movl %ebp, %esp
	popl %ebp
	ret	
save_factors:
	movl %ecx, (%ebx, %edi)
	addl $4, %edi
	incl %ecx
	jmp start_loop

.type getmyfactors, @function
getmyfactors:
	pushl %ebp
	movl %esp, %ebp
	movl 8(%ebp), %ebx
	movl $0, %edi
	
start_fac_loop:
	movl (%ebx, %edi), %eax
	cmpl $0, %eax
	je end_fac_loop
	addl $4, %edi
	jmp start_fac_loop

end_fac_loop:
	movl %ebp, %esp
	popl %ebp
	ret
	
	