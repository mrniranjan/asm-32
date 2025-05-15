	# add all odd numbers use jalr and jal instructions
	.section .data
arr:
	.long 1,2,3,4,5,6,7,8,9,10
	.section .text
	.globl _start
_start:
	la t0, arr
	li t1, 0  		# index
	li t2, 10		# maximum index
	li t3, 0		# current sum of odd numbers
loop:
	addi t1, t1, 1		# increment index
	blt t2, t1, exit	# check if we have reached the end of array
	lw t4, 0(t0) 		# load the array element
	addi t0, t0, 4		# move the pointer to next array element
	jal ra, process_element	# call process_element subroutine
	j loop

process_element:
	andi t5, t4, 1 		# do an and operation
	bnez t5, add_odd	# if it's not equal to zero
	jalr x0, ra, 0		# retun to caller 

add_odd:
	add t3, t4, t3		# add the odd numbers and store result in t3
	jalr x0, ra, 0		# return to the caller

exit:
	add x10, x0, t3	        # store the result in x10
	li x17, 93		# call exit system call 
	ecall 			# exit-
