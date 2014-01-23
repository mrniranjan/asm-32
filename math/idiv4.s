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
	

/*
Breakpoint 1, _start () at idiv3.s:15
15              movw $-5, %cx
(gdb) s
16              movw $65535, %dx
(gdb) s
17              movw $-10, %ax
(gdb) p/d $cx
$1 = -5
(gdb) p/u $cx
$2 = 65531
(gdb) p/d $dx
$3 = -1
(gdb) p/u $dx
$4 = 65535
(gdb) p/d $ax
$5 = 0
(gdb) s
18              idiv %cx
(gdb) p/d $ax
$6 = -10
(gdb) p/u $ax
$7 = 65526
(gdb) s
19              movl %eax, %ebx
(gdb) s
20              mov $1, %eax
(gdb) s
21              int $0x80
(gdb) s

Program exited with code 02.

*/	
