	.section .data
arr:
	.long 1, -2, -3, 4, 5, -6, 7, 8, -9, 10
	.section .text
	.globl _start
_start:
	li a0, 0
	li t1, 10
	la t2, arr
	li a1, 0 
loop:
	lw t3, 0(t2)
	bltz t3, count_neg
	add a0, a0, t3
	j next

count_neg:
	addi a1, a1, 1
	j next
next:
	addi t2, t2, 4
	addi t1, t1, -1
	bnez t1, loop
exit:
	add x10, x0, a0
	li x17, 93
	ecall
