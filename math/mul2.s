###This program demonstrates Signed Multiplication using imul
### here we demonstrate Multiplication of 2 8-bit Signed numbers , where the result is  16-bit
### The 16-bit result is put in ax
### Since it's a sign bit, 7th bit is used to store sign, so effective we can use -127 to +127
.section .text
.globl _start
_start:
	movb $125, %al	#we store 5 in lower 8-bits of eax, 
	imul %al 	#we use %al as source, Result if 16-bit would be stored in ax
	movl $1, %eax
	int $0x80

/*
1       ###This program demonstrates Signed Multiplication using imul
2       ### here we demonstrate Multiplication of 2 8-bit Signed numbers , where the result is  16-bit
3       ### The 16-bit result is put in ax
4       ### Since it's a sign bit, 7th bit is used to store sign, so effective we can use -127 to +127
5       .section .text
6       .globl _start
7       _start:
8               movb $125, %al  #we store 5 in lower 8-bits of eax, 
9               imul %al        #we use %al as source, Result if 16-bit would be stored in ax
10              movl $1, %eax
(gdb) break 7
Breakpoint 1 at 0x8048054: file mul2.s, line 7.
(gdb) r
Starting program: /home/ashok/practice/alp/mul2 

Breakpoint 1, _start () at mul2.s:8
8               movb $125, %al  #we store 5 in lower 8-bits of eax, 
(gdb) s
9               imul %al        #we use %al as source, Result if 16-bit would be stored in ax
(gdb) s
10              movl $1, %eax
(gdb) info reg ax
ax             0x3d09   15625
(gdb) s
11              int $0x80
(gdb) s
*/
