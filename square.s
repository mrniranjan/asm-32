#PURPOSE:	Program computes square of a number. Example
#		5 * 5 = 25
.section .data

.section .text
.globl _start
_start:
	push $8		#push first argument
	call square	#call the function square
	addl $8, %esp
	
	movl $1, %eax
	int $0x80

.type square, @function
square:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp

	movl 8(%ebp), %ebx
	imul %ebx, %ebx
	movl %ebx, -4(%ebp)
	jmp end_power

end_power:
	movl -4(%ebp), %eax
	movl	%ebp, %esp
	popl	%ebp
	ret
