#PURPOSE: This program finds maximum from the list of numbers defined
#	by data_items
# 	We are using address of the last element of the list to know that we have come to 
# 	The end of the list and exit

#INPUT: data to program is provided through the list data_items defined in memory

#OUTPUT: Output of the program is the meaximum number from the list

#variables: %ebx: Current maximum number
#	    %eax: Contains address of the current item on the list
#	    %edx: contains Address of the last element of the list
#		

.section .data
data_items:
.long 3,67,34,17,45,75,54,34,44,33,22,11,66,222

.section .text
.globl _start
	_start:
		movl $data_items, %eax 	# move starting address to %eax
		movl (%eax), %ebx  	# Here we are moving the first to current maximum
		movl %eax, %edx		# copy starting address to edx 
		addl $52, %edx 		# starting address plus 52 is the ending address, 
					# assuming we are counting the indexes from 0
	
		start_loop:
			cmpl %eax, %edx		# we are comparing addresses 
			je loop_exit		# if addresses are same exit
			addl $4, %eax		# add 4 to the current addres
			cmpl %ebx, (%eax)	# cmpl the next value to the current maximum
			jle start_loop		#  if the next value is less , jump back to start_loop
		movl (%eax), %ebx		# else copy the next value as current maximum
		jmp start_loop			# jump back to start_loop
		
		loop_exit:			
			movl $1, %eax		# we call exit system call
			int $0x80		# call john wayne
