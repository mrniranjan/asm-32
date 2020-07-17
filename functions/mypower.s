#This power function where 2 values x and y are pushed
# to stack and the function calculates x raised to the power of y
.section .data
LC0:
	.string "%d\n"

.section .text
.globl main
main:
	pushl $3 # push y 
	pushl $2 # push x
	call mypower
	movl $1, %eax
	int $0x80

.type mypower, @function
mypower:
	pushl %ebp
	movl %esp, %ebp
	subl $4, %esp
	movl 8(%ebp), %ebx # we got 2 in %ebx
	movl 12(%ebp), %ecx # we got 3 in %ecx
	movl %ebx, -4(%ebp)

loop_start:
	cmpl $1, %ecx
	je end_power
	movl -4(%ebp), %eax
	imull %ebx, %eax
	movl %eax, -4(%ebp)
	decl %ecx
	jmp loop_start

end_power:
	movl -4(%ebp), %eax
	pushl %eax
	pushl %ebx
	pushl %eax
	pushl $LC0
	call printf
	movl %ebp, %esp
	popl %ebp
	ret
	
	