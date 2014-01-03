#This program illustrates a function f(x) as following
#f(x)={2x for x > 2}
#f(x)={(x+2) for x <=2  }
# consider x to be an integer
# initially x is stored in ebx
# f(x) is stored in eax
# if x > 2 , then eax=ebx
# else if x <= 2 eax=2
.section .text
.globl _start
_start:
	movl $1, %ebx	#we are settin 1 as value for ebx
	mov $2, %eax	#initial value of eax is 2
	cmpl $2, %ebx	# compare 2 with value of ebx
	jle L0		# if ebx is less , then jmp to L0, else next instruction
	movl %ebx, %eax	# if x>2 , put x in to register eax 
	jmp L1

L0:
	addl %ebx, %eax
	jmp L1

L1:	movl $1, %eax
	int $0x80
