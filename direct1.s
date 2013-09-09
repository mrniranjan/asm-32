#Purpose: This program shows another example of direct addressing mode
# We store value 1 in memory, That memory is represented symbolically using t1
# Copy t1 to %al and call exit system call
.section .data
t1:			# Declare symbolic representation for location where value 1 is stored.
.byte 1			# the size of 1 byte
t2:
.byte 20
.section .text		
.globl _start				
mov t1, %al		# Using Direct addressing mode we are passing address as an operand to %al 
mov t2, %bl		# we are passing address (t2) as one of the operands
int $0x80 		# calling Master Bruce Wayne

