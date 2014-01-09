### This program demonstrates signed multiplication between 2 integers
###
.section .text
.globl _start
_start:
	movw $150, %bx	####
	imul $150, %bx ##Since we are doing signed multiplication, #bx which is 16-bit register has -32767 to +32768
			## The output 150 * 150 =22500  should fit in to the register. In this case it does

	movl $1, %eax
	int $0x80

/*
(gdb) list
1       ### This program demonstrates signed multiplication between 2 integers
2       ###
3       .section .text
4       .globl _start
5       _start:
6               movw $150, %bx  ####
7               imul $150, %bx ##Since we are doing signed multiplication, #bx which is 16-bit register has -32767 to +32768
8                               ## The output 150 * 150 =22500  should fit in to the register. In this case it does
9
10              movl $1, %eax
(gdb) break 5
Breakpoint 1 at 0x8048054: file mul6.s, line 5.
(gdb) r
Starting program: /home/ashok/practice/alp/mul6 

Breakpoint 1, _start () at mul6.s:6
6               movw $150, %bx  ####
(gdb) s
7               imul $150, %bx ##Since we are doing signed multiplication, #bx which is 16-bit register has -32767 to +32768
(gdb) p/d $bx
$1 = 150
(gdb) p/u $bx
$2 = 150
(gdb) s
10              movl $1, %eax
(gdb) p/u $bx
$3 = 22500
(gdb) info reg eflags
eflags         0x206    [ PF IF ]
(gdb) s
11              int $0x80
(gdb) s

Program exited with code 0344.
(gdb) 

*/
