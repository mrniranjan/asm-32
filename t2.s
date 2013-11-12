#PURPOSE:	This program finds  the maxmimum number of a 
#		set of data items.
#

#VARIABLES:	The register have the following uses:
#
#	%edi -	Holds the index of the data item being examined
#	%ebx - 	Holds the Larget data item found 
#	%eax - 	current data item
#
#	The following memory locations are used:
#
#	data_items - contains the item data. A  0 is used
#		     to terminate the data
#
.section .data

data_items:			# These are the data items
.long	6,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text

.globl _start

_start:
movl $0, %edi
movl data_items(,%edi,4), %eax	#load the first byte of data
movl %eax, %ebx
movl $data_items + 52, %edx
start_loop:
	cmpl (%edx),%eax	# check to see if the we've hit the end
	je  loop_exit
	incl %edi
	movl data_items(,%edi,4), %eax
	cmpl	%ebx, %eax	#compare values
	jle	start_loop	#jump to loop beginning if the new one isn't bigger

movl	%eax, %ebx
jmp 	start_loop

loop_exit:
	# ebx is the reutrn value, and it already has the number
	movl $1, %eax
	int $0x80
