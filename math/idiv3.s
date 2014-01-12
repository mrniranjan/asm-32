#################################################################
#       Author: Niranjan R Mallapadi                            #
#       Email: niranjan.ashok@gmail.com                         #
#       Purpose: Simple Arithmetic Problems                     #
#       Copyright 2013 Niranjan R Mallapadi                     #
#       License: GNU GPLv3 http://www.gnu.org/licenses/gpl.html #

#	Purpose: This program illustrates Signed Division	#
#	We are dividing -10/-5 					#

.section .text
.globl _start
_start:
	movw $-5, %cx		#store -5 in cx, which is 2's complement of 5
	movw $-1, %dx		#we store -1 in $dx 
	movw $-10, %ax		#we stored -10 in ax, the reason being -10 has be stored such that msb should be in dx and lsb in ax
	idiv %cx		#Do signed multiplication
	movl %eax, %ebx		#store the result in ebx
	mov $1, %eax		#call exit system call
	int $0x80		#call master bruce wayne
	

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
