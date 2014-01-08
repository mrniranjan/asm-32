###This program demonstrates Un-Signed Multiplication using mul
### here we demonstrate Multiplication of 2 8-bit numbers , where the result is  16-bit
### The 16-bit result is put in ax
.section .text
.globl _start
_start:
	movb $200, %al	#we store 200 in lower 8-bits of eax, 
	mul %al 	#In this case 200 is treatd as un-signed and result is stored in ax
	movl $1, %eax
	int $0x80
