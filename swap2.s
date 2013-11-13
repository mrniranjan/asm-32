#PURPOSE: This programs swaps contents of l1 with l2 
#l1 and l2 are both 32bit wide data, 
#use gdb to see the swapped conents
.section .data
l1:
.long 0x55667788
l2:
.long 0x99AABBCC
.section .text
.globl _start
_start:
	movl $0x11223344, %eax
	xchg l1, %eax
	xchg l2, %eax
	xchg l1, %eax
	movl $1, %eax
	int $0x80
