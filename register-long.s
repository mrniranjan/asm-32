#Purpose: This program illustrates Register addressing mode or also called indirect addressing mode
#INPUT: NONE
#OUTPUT: echo $?
#Variables: var1: is variable declared in memory which is symbol to a array of numbers
#Note here var1 is declared as integer which means each member of array would take 8 bytes
.section .data
var1:
.long 25,26,27,28
.section .text
.globl _start
	_start:
		movl $var1, %edi # copy the address that var represents to %edi
		movl (%edi), %eax  # Get the first list element in  %eax
		movl 4(%edi), %ebx # Get the 2nd list element in  %ebx
		movl 8(%edi), %ecx # Get the 3rd list element in %ecx
		movl 12(%edi), %edx # Get the 4th list element in %ebx
		movl $1, %eax 	 # call exit system call
		int $0x80	#call bruce wayne

# Run the program through gdb to get the values of registers eax,ebx,ecx,edx


