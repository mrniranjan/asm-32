	.section .data
arr:
	.long 1, -2, -3, 4, -5, -6, 7, 8, -9, 10
	.section .text
	.globl _start
_start:
	li t0, 0
	li t1, 10
	la t2, arr
loop:
	lw t3, 0(t2)
	bltz t3, next
	add t0, t0, t3
	j next
next:
	addi t2, t2, 4
	addi t1, t1, -1
	bnez t1, loop
exit:
	add x10, x0, t0
	li x17, 93
	ecall
