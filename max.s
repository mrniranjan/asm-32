#PURPOSE:	This program finds the maximum number of a 
#		set of data items.
#
#VARIABLES:	Theregisters have the following uses:
#
#	%edi	- 	Holds the index of the data item being examined
#	%eax	-	Current data item
#	%ebx	-	Largest data item found
#
#
#	data_items	-	Contains the item data, A 0 is used to terminate
#				the data
#
#
.section .data

data_items:
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text

.globl _start
_start:
movl $0, %edi				# move 0 in to the index register
movl data_items(,%edi,4), %eax		# load the first byte of data
movl %eax, %ebx				# since this is the first item %eax is the biggest

start_loop:				# start loop
cmpl $0, %eax				# Check to see if we have hit the end
je loop_exit
incl %edi				# Load next value
movl data_items(,%edi,4), %eax		
cmpl %ebx, %eax				# move the value as the largest
jle start_loop				# Jump to loop beginning if the new one isn't bigger

movl	%eax, %ebx			# move the value as the largest
jmp	start_loop			# Jump to loop beginning

loop_exit:
					# %ebx is the return value, and it already has the number
movl $1, %eax
int $0x80

