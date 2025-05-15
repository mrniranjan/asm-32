.section .data
arr:
	.long 1, -2, -3, 4, -5, -6, 7, 8, -9 ,10
.section .text
	.globl _start
_start:
	li t0, 0 		# t0 holds the sum,  initialize to 0
	li t1, 10 		# t1 holds the loop counter, initialize to 10
	la t2, arr 		# t2 holds the base address of the array arr

loop:
	lw t3, 0(t2) 		 # load the current array element in to t3
	bltz t3, add_neg	 # if t3 is negative, jump to add_neg
	j next
add_neg:
	add t0, t0, t3 		# add the current element to t0
next:
	addi t2, t2, 4 		# move the next array element 
	addi t1, t1, -1 	# decrement the loop counter
	bnez t1, loop 		# if t1 is not zero, continue the loop

exit:
	add x10, x0, t0
	li x17, 93
	ecall
 
	
