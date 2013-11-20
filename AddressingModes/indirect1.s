#PURPOSE: This program demonstrates Indirect Memory Address method
#In this program registers being used are %eax,%ebx, %ecx. 
#We first pass the address to register %ecx
#Then reference the value from the address using Indirect Memory address method (%ecx) 
# Add the values stored in %eax and %ebx
.section .data
t1:	
.long 5
.section .text
.globl _start
_start:	
	movl $t1, %ecx		#we are passing the address where value 5 is stored to %ecx
	movl $5, %eax		#we are passing value 5 to %eax
	movl (%ecx), %ebx	#Using indirect addressing mode we are getting the value from t1 and passing it to ebx
	addl %eax, %ebx		# add the values in %eax, %ebx and store it in %ebx
	movl $1, %eax		# call exit program
	int $0x80		# Call Master Bruce Wayne
