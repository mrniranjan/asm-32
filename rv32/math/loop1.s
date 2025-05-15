.section .data

arr:
	.long 1,2,3,4,5
.section .text
	.globl _start
_start:
	li t0,  0  		# total sum of all numbers in arr
	li t1, 5  		# loop counter
	la t2, arr 		# store the address of arr to t2
loop:
	lw t3, 0(t2) 		# get the first value 1 from t2 to t3
	add t0, t0, t3 		# t0, t0 + t3 , 
	addi t2, t2, 4  	# get the next number from arr 
	addi t1, t1, -1 	# decrement t1 
	bnez t1, loop 		# branch not equal to zero to loop
exit:
	add x10, x0, t0 	# move the sum to x10 
	li x17, 93		# call the exit
	ecall		
