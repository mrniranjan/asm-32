###This program illustrates CF flag of eflags register
##CF flag is when the instruction when executed does a carry-in or carry-out 
## In the below program we are passing 253 to bl (lsb of ebx), and adding 3 , 
## adding 253 + 3 results in a carry-out , CF flag gets enabled. 
.section .text
.globl _start
_start:
		movb $0xfd, %bl	# store 253 in bl 
		addb $3, %bl	# adding 3 to 253 causes carry-out causing the bl to reset to 0
		movl $1, %eax	# call exit system call
		int $0x80	# call master bruce wayne
