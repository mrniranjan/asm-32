### This program demonstrates signed multiplication between 2 integers
###
.section .text
.globl _start
_start:
	movl $1500, %ebx ### we are using 32-bit registers
	imul $1500, %ebx ##Since we are doing signed multiplication,
			## The output 1500 * 1500 = 2250000  should fit in to the register ebx
	movl $1, %eax
	int $0x80


/*

Reading symbols from /home/ashok/practice/alp/mul8...done.
(gdb) list
1       ### This program demonstrates signed multiplication between 2 integers
2       ###
3       .section .text
4       .globl _start
5       _start:
6               movl $1500, %ebx ### we are using 32-bit registers
7               imul $1500, %ebx ##Since we are doing signed multiplication,
8                               ## The output 1500 * 1500 = 2250000  should fit in to the register ebx
9               movl $1, %eax
10              int $0x80
(gdb) break 5
Breakpoint 1 at 0x8048054: file mul8.s, line 5.
(gdb) r
Starting program: /home/ashok/practice/alp/mul8 

Breakpoint 1, _start () at mul8.s:6
6               movl $1500, %ebx ### we are using 32-bit registers
(gdb) s
7               imul $1500, %ebx ##Since we are doing signed multiplication,
(gdb) p/d $ebx
$1 = 1500
(gdb) s
9               movl $1, %eax
(gdb) p/d $ebx
$2 = 2250000
(gdb) s
10              int $0x80
(gdb) s

Program exited with code 020.
(gdb) 
*/
