	.section .data
arr1:
	.word 1, -2, -3, 4, -5, 6, 7, 8, 9, -10
sum: 
	.word 0
	.section .text
	.globl _start
_start:
	li t0, 0  #t0 contains value 0
	li t1, 10 #t1 contains value 10 
	la t2, arr1 # t2 contains arr1 address 
loop:
	lw t3, (t2) # t3 contains value 1 
	add t0, t0, t3  # add t3 + t0 and store the result in t0
	addi t2, t2, 4 # increment by 4
	addi t1, t1 , -1 # decrement the loop counter
	bnez t1, loop # if t1 is not zero, continue the loop
exit:
	add x10, x0, t0
	li x17, 93
	ecall
	
