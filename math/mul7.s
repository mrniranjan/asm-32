### This program demonstrates signed multiplication between 2 integers
###
.section .text
.globl _start
_start:
	movw $200, %bx	####
	imul $200, %bx ##Since we are doing signed multiplication, #bx which is 16-bit register has -32767 to +32768
			## The output 200 * 200 =40000  should fit in to the register. 
			##In this case it does not, so we would OF flag set
	movl $1, %eax
	int $0x80
/*
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/ashok/practice/alp/mul7...done.
(gdb) list
1       ### This program demonstrates signed multiplication between 2 integers
2       ###
3       .section .text
4       .globl _start
5       _start:
6               movw $200, %bx  ####
7               imul $200, %bx ##Since we are doing signed multiplication, #bx which is 16-bit register has -32767 to +32768
8                               ## The output 200 * 200 =40000  should fit in to the register. 
9                               ##In this case it does not, so we would OF flag set
10              movl $1, %eax
(gdb) break 5
Breakpoint 1 at 0x8048054: file mul7.s, line 5.
(gdb) r
Starting program: /home/ashok/practice/alp/mul7 

Breakpoint 1, _start () at mul7.s:6
6               movw $200, %bx  ####
(gdb) s
7               imul $200, %bx ##Since we are doing signed multiplication, #bx which is 16-bit register has -32767 to +32768
(gdb) p/d $bx
$1 = 200
(gdb) s
10              movl $1, %eax
(gdb) p/d $bx
$2 = -25536
(gdb) info reg eflags
eflags         0xa83    [ CF SF IF OF ]
(gdb) s
11              int $0x80
(gdb) s

Program exited with code 0100.
*/
