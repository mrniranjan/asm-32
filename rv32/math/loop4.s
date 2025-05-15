	# add all even numbers
	.section .data
arr:
	.long 1,2,3,4,5,6,7,8,9,10
	.section .text
	.globl _start
_start:
	la t0, arr
	li t1, 0 		# index
	li t2, 10 		# max index
	li t3, 0 		# current sum 
loop:
	addi t1, t1, 1 		# increment index
	blt t2, t1, exit 	# verify if we reached the end of the loop
	lw t4, 0(t0) 		# load the array element to t4
	addi t0, t0, 4 		# get the next array element
	andi t5, t4, 1 		# do and operation 
	beqz t5, add 		# if even jump to add branch 
	j loop 			# jump back to loop
add:
	add t3, t4, t3 		# add the even elements and save the result in t3
	j loop 			# jump back to loop 
	
exit:
	add x10, x0, t3 	# save the result in x10 
	li x17, 93 		# call the exit system call 
	ecall 			# exit 
	
