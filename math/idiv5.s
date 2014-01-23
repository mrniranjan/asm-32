#################################################################
#       Author: Niranjan R Mallapadi                            #
#       Email: niranjan.ashok@gmail.com                         #
#       Purpose: Simple Arithmetic Problems                     #
#       Copyright 2013 Niranjan R Mallapadi                     #
#       License: GNU GPLv3 http://www.gnu.org/licenses/gpl.html #

#	Purpose: This program illustrates Signed Division	#
#	We are dividing 2 32-bit numbers 			#
#		

.section .text
.globl _start
_start:
	movl $1048576, %ecx
	movl $-1, %edx		 
	movl $-2097152, %eax	
	idiv %ecx		
	movl %eax, %ebx		
	mov $1, %eax		
	int $0x80		#call master bruce
	
