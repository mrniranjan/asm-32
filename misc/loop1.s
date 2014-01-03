#this program shows a simple loop
#for(i=0;i<n;i++)
#A[i]=i;
#
.section .data
ar1:
.long 1,2,3,4,5
ar2:
.long 
.section .text
.globl _start
_start:
	movl $ar1, %ebx
	movl $4, %ecx
	movl $0, %eax
	loop_start:
		jecxz exitloop
		movl ar1(,%ecx,4),%ebx
		movl %ebx, ar2(,%eax,4)
		incl %eax
		decl %ecx
		jmp loop_start
	exitloop:
		movl $1, %eax
		int $0x80	
