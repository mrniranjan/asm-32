#PURPOSE This program swaps the contents of l1 with l2 using %eax register
#we use xchg instruction to swap contents 
.section .data
l1:
.int 0x1234
l2:
.int 0x2345
.section .text
.globl _start
_start:
	xchg l1, %ecx
	xchg l2, %ecx
	xchg l1, %ecx
	movl $1, %eax
	int $0x80
