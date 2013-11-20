#Purpose: This program illustrates Register addressing mode or also called indirect addressing mode
#INPUT: NONE
#OUTPUT: echo $?
#Variables: var1: is variable declared in memory which is symbol to a array of numbers
#Note here var1 is declared as integer which means each member of array would takes 4 bytes
.section .data
var1:
.int 25,26,27,28
.section .text
.globl _start
	_start:
		movl $var1, %edi  # copy the address that var represents to %edi
		mov (%edi), %ax  # Get the first list element in  %eax
		mov 4(%edi), %bx # Get the 2nd list element in  %ebx
		mov 8(%edi), %cx # Get the 3rd list element in %ecx
		mov 12(%edi), %dx # Get the 4th list element in %ebx
		movl $1, %eax 	  # call exit system call
		int $0x80	  #call bruce wayne

# Run the program through gdb to get the values of registers eax,ebx,ecx,edx
#(gdb) info registers
#eax            0x19     25
#ecx            0x1b     27
#edx            0x1c     28
#ebx            0x1a     26


