#Purpose: This program illustrates Register addressing mode. 
#INPUT: NONE 
#OUTPUT: echo $?
#Variables: var1: is variable declared in memory which is symbol to a array of numbers
#Note here var1 is declared as .byte, which means each member of array would take 1 byte
.section .data
var1:			
.byte 25,27,29,31,33
.section .text
.globl _start
	_start:
		movl $var1, %edi	# copy the address that var represents to %edi
		movb 0(%edi), %bl	# Get the first list element in lsb of %ebx
		movb 1(%edi), %dl	# Get the 2nd list element in lsb of %edx
		movb 2(%edi), %al	# Get the 3rd list element in lsb of %eax
		movb 3(%edi), %cl	# Get the 4th list element in lsb of %ecx
		movl $1, %eax		# call exit system call
		int $0x80		# call bruce wayne 

#Run this program through gdb 
#(gdb) info registers
#eax            0x1d     29
#ecx            0x1f     31
#edx            0x1b     27
#ebx            0x19     25
