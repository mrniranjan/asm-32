### This program demonstrates signed multiplication between 2 16-bit integers 
###
.section .text
.globl _start
_start:
	movw $25, %ax		### we are using 16-bit registers
	imul $25, %ax, %bx 	##Since we are doing signed multiplication, 16th bit will be used for signed, so the range is -32767<->+32768
				## The output 25 * 25, will be performed and stored in bx
				# In this case there is no overflow
	movl $1, %eax
	int $0x80

