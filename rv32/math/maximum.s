	.section .data
data_items:
	.word 3,67,44,23,22 
	.section .text
	.globl _start
_start:
	la x5, data_items
	addi x7, x0, 0
	la x2, data_items
	lw x6, 16(x5)
	lw x10, (x2)
start_loop:
	beq x10, x6, exit
	addi x2, x2, 4
	lw x7, 0(x2)
	blt x7, x10, start_loop
	lw x10, x4
	j start_loop
exit:	
	li x17, 93
	ecall
