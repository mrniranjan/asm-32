###This program demonstrates Signed Multiplication using imul
### here we demonstrate Multiplication of 2 8-bit Signed numbers , where the result is also 8-bit
.section .text
.globl _start
_start:
	movb $5, %al	#we store 5 in lower 8-bits of eax, 
	imul %al 	#we use %al as source and destination
	movl $1, %eax
	int $0x80
