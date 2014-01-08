###This program demonstrates Signed Multiplication using mul
### here we demonstrate Multiplication of 2 16-bit numbers , where the result is 32-bit that is put in 
### registers ax,dx, 
###Note even if the result can be accomdated in ax, dx also gets modified. 
### The 16-bit result is put in eax
.section .text
.globl _start
_start:
	movw $15000, %ax #we store 15000 in ax
	imul %ax 	#In this case 15000 is treatd as signed, the range for signed numbers is -32768 to +32768
	movl $1, %eax
	int $0x80
