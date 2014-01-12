#################################################################
#       Author: Niranjan R Mallapadi                            #
#       Email: niranjan.ashok@gmail.com                         #
#       Purpose: Simple Arithmetic Problems                     #
#       Copyright 2013 Niranjan R Mallapadi                     #
#       License: GNU GPLv3 http://www.gnu.org/licenses/gpl.html #

#	Purpose: This program illustrates Signed Division	#
#	We are dividing -125/-25 using function divide		#
#	Function divide(dividend,divisor)			#


.section .data
divisor:
.byte -25
dividend:
.byte -125
.section .text
.globl _start
_start:
	pushl divisor	# Push divisor
	pushl dividend	# Push dividend
	call divide
	movl $8, %esp
	movl %eax, %ebx
	movl $1, %eax
	int $0x80
.type divide,@function
divide:
	pushl %ebp	#save old ebp register
	movl %esp,%ebp	#use ebp register to access stack
	
	#We need to move dividend to edx, eax
	#where msb is edx, lsb is eax
	
	movl $0, %edx		#edx is 0
	movl 8(%ebp), %eax	#we move dividend to eax 
	movl 12(%ebp), %ecx	#we store the divisor to ecx
	idiv %ecx		#result i.e quotient is saved in eax
	movl %ebp, %esp
	popl %ebp
	ret
