.section .data
a1:
	.word 10
a2:
	.word 20

.section .text
	.globl  _start
_start:
	la t0, a1
	lw t1, (t0)
	addi t0, t0, 4
	lw t2, (t0)
	add t3, t1, t2
exit:
	add x10, x0, t3
	li x17, 93
	ecall

