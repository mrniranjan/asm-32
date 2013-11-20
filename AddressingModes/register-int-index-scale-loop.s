#Purpose: This program illustrates Register addressing mode or also called indirect addressing mode
#	Here we are calculating Effective address using :
#	Effective Address: displacement(base,index,scale)
#	i.e (effective Address=displacement + [base + index * scale])
#INPUT: NONE
#OUTPUT: echo $?
#Variables: var1: is variable declared in memory which is symbol to a array of numbers
#Note here var1 is declared as integer which means each member of array would takes 4 bytes
#Lets assume we want increment all the values of the array by 1 and we need to access the 
#array using displacement, index, scale, base is omitted
.section .data
var1:
.int 10,11,12,13
.section .text
.globl _start
	_start:
		movl $var1, %edi
		movl %edi, %ecx
		movl $0, %esi	#Since Index should be a register, %esi will be index register
		addl $12, %ecx  # we need ending address to come out of loop
		
	start_loop:
		cmpl %edi, %ecx
		jg loop_exit
		addl $1, var1(,%esi,4)
		incl %esi
		addl $4, %edi 
		movl (%edi), %ebx
		jmp start_loop
	loop_exit:
		movl $1, %eax
		int $0x80

		


