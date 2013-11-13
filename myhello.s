.section .data
str1: 	 
.ascii "asdf\0"
.section .text
.globl _start
_start:
	movl $0, %edi
	movl $str1+0, %edx
	movl $str1+5, %ecx
	movl (,%edi,1), %eax
	
start_loop:
	cmpl %edx, %ecx
	je loop_exit
	incl %edi
	jmp start_loop
loop_exit:
	movl %edi, %ebx
	movl $1, %eax
	int $0x80

	

