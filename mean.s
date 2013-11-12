#PURPOSE:	This program finds the mean from a given set of numbers in data_items
#
#VARIABLES:  The registers have the following uses
#
#	%edi - Holds the index of data item being examined
#	%ebx - Holds the current data item
#	%eax - Holds the sum computed 
#	Following memory location is used:
#	data_items: contains numbers for which mean have to be found. 

.section .data

data_items: 			# These are the numbers for which mean has to be found 
.long 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20

.section .text

.global _start

_start:

movl $0, %edi			# Initialize edi with value 0 
movl $0, %ebx			# initialize ebx with value 0

start_loop:			# Start loop
cmpl $20, %edi 			#check to see if we have entered the limit 
jge loop_exit
movl data_items(,%edi,4), %ebx	# load the corresponding value in ebx to which index register points to
addl %ebx, %eax			# add ebx to eax and store the value in eax
incl %edi			# increment edi
jmp start_loop



loop_exit:			# exit loop 

divl %edi 			#here eax is divided by edi and quotient is saved in eax 		
movl %eax, %ebx			#copy the quotient to ebx
movl $1, %eax			#call exit function
int $0x80			#interrupt linux
