	.section .data
arr:
	.long 1,2,3,4,5,6,7,8,9,10
	.section .text
	.globl _start
_start:
	li t0, 0 		# holds the index
	la t1, arr 		# holds the address of arr
	li t2, 10 		# holds the max index 
	li t4, 0 		# current total sum
loop:
	lw t3, 0(t1)  		# load the first element of t1 to t3 
	add t4, t4, t3 		# add t3 with t4 which is 0 for the first time 
	addi t0, t0, 1 		# increment the index
	beq t0, t2, exit 	# check if index is equivalent to max index
	add t1, t1, 4 		# increment t3 with 4 to move t3 with next element
	j loop			# jump to loop , unconditional jump

exit:
	add x10, x0, t4 	# save the result in x10 
	li x17, 93 		# call exit system call 
	ecall

	
	
