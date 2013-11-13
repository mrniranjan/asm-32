#PURPOSE: This program demonstrates another method of using Indirect Memory addressing 
#This program doesn't use an extra register %ecx as it was used in indirect1.s 
#we reference the value stored address mentioned in %ebx and add the value stored in %ebx
.section .data
t1:	
.long 5
.section .text
.globl _start
_start:	
	movl $t1, %ebx		# we are passing the address to %ebx
	movl $5, %eax		# we are passing value 5 to %eax
	addl (%ebx), %eax	# add the values in %eax, %ebx and store it in %ebx
	movl %eax, %ebx		#	 
	movl $1, %eax		# call exit program
	int $0x80		# Call Master Bruce Wayne
