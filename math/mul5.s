###This program demonstrates Signed Multiplication using mul
### here we demonstrate Multiplication of 2 16-bit numbers , where the result is 32-bit that is put in 
### registers ax,dx, 
###Note even if the result can be accomdated in ax, dx also gets modified. 
### The 16-bit result is put in eax
.section .text
.globl _start
_start:
	movw $350, %ax #we store 300 in ax
	imul %ax 
	movl $1, %eax
	int $0x80
/*
1       ###This program demonstrates Signed Multiplication using mul
2       ### here we demonstrate Multiplication of 2 16-bit numbers , where the result is 32-bit that is put in 
3       ### registers ax,dx, 
4       ###Note even if the result can be accomdated in ax, dx also gets modified. 
5       ### The 16-bit result is put in eax
6       .section .text
7       .globl _start
8       _start:
9               movw $350, %ax #we store 300 in ax
10              imul %ax 
(gdb) break 8
Breakpoint 1 at 0x8048054: file mul5.s, line 8.
(gdb) r
Starting program: /home/ashok/practice/alp/mul5 

Breakpoint 1, _start () at mul5.s:9
9               movw $350, %ax #we store 300 in ax
(gdb) s
10              imul %ax 
(gdb) s
11              movl $1, %eax
(gdb) p/d $ax
$1 = -8572
(gdb) p/u $ax
$2 = 56964
(gdb) p/u $dx
$3 = 1
(gdb) n
12              int $0x80
(gdb) n
*/
