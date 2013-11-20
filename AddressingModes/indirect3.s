#PURPOSE: This program demonstrates another method of using Indirect Memory addressing 
#This program doesn't use an extra register %ecx as it was used in indirect1.s 
#we reference the value stored address mentioned in %ebx and add the value stored in %ebx
#Refer: http://stackoverflow.com/questions/18739142/unable-to-get-value-stored-in-memory-using-indirect-addressing-mode
.section .data
t1:	
.long 5
.section .text
.globl _start
_start:	
	movl $t1, %ebx		# we are passing the address to %ebx
	movl $5, %eax		# we are passing value 5 to %eax
	addl %eax, (%ebx)	# add the values in %eax, %ebx and store it in %ebx
	movl (%ebx), %ebx	# Move the value stored in the address stored in %ebx to %ebx	 
	movl $1, %eax		# call exit program
	int $0x80		# Call Master Bruce Wayne
