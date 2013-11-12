#PURPOSE:	This program uses the sum function to find sum of three numbers:
#		sum(3,5,7) 

.section .data
.section .text
.globl _start
_start:
	push $7		#push 7 to stack
	push $5		#push 5 to stack
	push $3		#push 3 to stack
	call sum	#call sum function
	addl $12, %esp	#move the stack pointer back
	movl $1, %eax 	#call the exit function
	int $0x80

.type sum, @function 
sum:
	pushl %ebp	#save the old ebp in stack
	movl %esp, %ebp	#make stack pointer the base pointer
	subl $4, %esp	#make room for the result to be stored
	
	movl 8(%ebp), %ebx	#put the first value 3 in ebx
	movl 12(%ebp), %ecx	#put the second value 5 in ecx
	addl %ecx, %ebx		#add the value and store the result in ebx
	
	movl %ebx, -4(%ebp)	#store the current result 
	movl 16(%ebp), %ecx	#put the third value 7 in ecx
	addl %ecx, %ebx		#add the value in ecx (7) to the %ebx(8) and store in ebx(15)
	movl %ebx, -4(%ebp)	#store the result 
	jmp end_sum

end_sum:
	movl -4(%ebp), %eax	#save the result in eax
	movl %ebp, %esp		#restore the stack pointer
	popl %ebp		#restore the base pointer
	ret
