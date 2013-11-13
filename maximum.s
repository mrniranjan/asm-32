.section .data
data_items:
	.long 3,67,34,0,45,75,54,34,44,33,22,11,66,222

.section .text
.globl _start
_start:
	movl $0, %edi			# initialize edi to 0
	movl $data_items+0 , %edx	# we are storing address of first element in edx
	movl $data_items+56, %ecx	# we are storing the address of last element to ecx
	movl data_items(,%edi,4), %eax
	movl %eax, %ebx
start_loop:
	cmpl %edx, %ecx			# we are checking if edx has moved to last element
	je loop_exit			# if starting and ending address are same we exit the loop
	addl $4, %edx			# We want to move by 4 bytes so we increment edx by 4 
	incl %edi			# We increment %edi by 1 
	movl data_items(,%edi,4), %eax	# Access the next data item
	cmpl %ebx, %eax			# compare the current item with existing largest value
	jle start_loop			# if the current item is less, we repeat
	
	movl %eax, %ebx			# if current item is highest, we interchange and update ebx with highest value
	jmp start_loop			# we repeat steps till we reach end of the loop

loop_exit:
	movl $1, %eax			# call exit system call
	int $0x80			# Call Bruce Wayne
