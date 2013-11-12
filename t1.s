.section .data
myvar: .long 4,3,2,1

.section .text
.globl _start
_start:
movl $0, %edi
lea myvar+0, %eax
movl $myvar+4, %ebx
movl $myvar+8, %ecx
movl $myvar+12, %edx
movl $myvar+16, %edi
movl $1, %ebx
movl $1, %eax
int $0x80
	
