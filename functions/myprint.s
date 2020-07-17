# This program calls the printf system call
# This program is based on https://github.com/vsergeev/apfcp/tree/master/examples
# This program uses the example mentioned in fibonacci.S
# on how to call print function	
.section .data
formatStr:
	.ascii "%d\n\0" # printf() format string
.section .text
.globl main
main:
	movl $0, %ecx
	movl $1, %ebx
	movl $1, %eax
	call myprint
	movl $1, %eax
	int $0x80

.type myprint, @function
myprint:
	pushl %ecx
	pushl %ebx
	pushl %eax
	pushl $formatStr
	call printf
	addl $4, %esp
	popl %eax
	popl %ebx
	popl %ecx
	ret

	

	
	
