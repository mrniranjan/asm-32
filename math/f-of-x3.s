##This program implements the below construct
#y=0
#while (x>=0)
#{
#	x=x-y;
#	y=y+1;
#}
#we will use registers eax and ebx for x and y respectively

.section .text
.globl _start
_start:
	movl $5, %eax # x=5
	movl $0, %ebx # y=0
start_loop:
	cmpl $0, %eax
	jge L0
	jmp end_loop

L0:
	subl %ebx, %eax
	incl %ebx
	jmp start_loop
 
end_loop:
	movl $1, %eax
	int $0x80

