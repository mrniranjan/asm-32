##This program exchanges 2 numbers stored in Memory as NumA and NumB
##exchangeNums(NumA,NumB)
.section .data
NumA:
.long 8
NumB:
.long 9
.section .text
.globl _start
_start:
	movl $NumA, %ecx
	movl $NumB, %edx
	pushl NumB
	pushl NumA
	call exchangeNums
	addl $8, %esp
	movl $1, %eax
	int $0x80
.type exchangeNums, @function
exchangeNums:
	movl 4(%esp), %eax
	xchg %eax, 8(%esp)
	mov %eax, 4(%esp)
	ret

	
