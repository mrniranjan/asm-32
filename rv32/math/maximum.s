	.section .data
data_items:
	.word 99,3,67,44,23,102,22 
	.section .text
	.globl _start
_start:
	la x5, data_items # load first items address to x5
	la x2, data_items # store first items address to x2
	lw x6, 28(x5)  # last item 22 is stored in x6
        lw x10, (x2)  # x10 stores the current maximum
start_loop:
	lw x15, (x2)  # move the current value stored in address x2 to x10
	beq x15, x6, exit   # compare x10 and x6 are equal
	addi x2, x2, 4  # increment address stored in x2 to 4 
	lw x4, 0(x2)   #store first value stored in address stored in x2 to x7
	blt x4, x10, start_loop #compare x4 and x10 x7 < x10 jump to start_loop
	add x10, x4, 0  # store thevalue in x4 
	j start_loop
exit:	
	li x17, 93
	ecall
