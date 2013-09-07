.section .data
data_items:
	.long 3,67,34,0,45,75,54,34,44,33,22,11,66,222

.section .text
.globl _start
_start:
	movl $0, %edi				#initialize edi to 0
	movl $data_items+0 , %edx		# we are storing address of first element in edx
	movl $data_items+56, %ecx		#we are storing the address of last element to ecx
	movl data_items(,%edi,4), %eax
	movl %eax, %ebx
start_loop:
	cmpl %edx, %ecx				#we are checking if edx has moved to last element
	je loop_exit
	addl $4, %edx
	incl %edi
	movl data_items(,%edi,4), %eax
	cmpl %ebx, %eax
	jle start_loop
	
	movl %eax, %ebx
	jmp start_loop

loop_exit:
	movl $1, %eax
	int $0x80
