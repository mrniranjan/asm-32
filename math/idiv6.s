#################################################################
#       Author: Niranjan R Mallapadi                            #
#       Email: niranjan.ashok@gmail.com                         #
#       Purpose: Simple Arithmetic Problems                     #
#       Copyright 2013 Niranjan R Mallapadi                     #
#       License: GNU GPLv3 http://www.gnu.org/licenses/gpl.html #

#       Purpose: This program illustrates Signed Division       #
#       We are dividing 2 8-bit numbers  	                #
.section .text
.globl _start
_start:
	movb $100, %cl
	movb $10, %al
	idiv %cl 
	movl %eax, %ebx
	movl $1, %eax
	int $0x80


