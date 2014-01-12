#################################################################
#       Author: Niranjan R Mallapadi                            #
#       Email: niranjan.ashok@gmail.com                         #
#       Purpose: Simple Arithmetic Problems                     #
#       Copyright 2013 Niranjan R Mallapadi                     #
#       License: GNU GPLv3 http://www.gnu.org/licenses/gpl.html #

#	Purpose: This program illustrates Signed Division	#
#	We are dividing -125/-25 using function divide		#
#	Function divide(dividend,divisor)			#

.section .text
.globl _start
_start:
	movb $-5, %cl
	movl $0, %edx
	movw $-10, %ax
	idiv %cl
	movl %eax, %ebx
	mov $1, %eax
	int $0x80
	

	
