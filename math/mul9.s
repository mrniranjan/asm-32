### This program demonstrates signed multiplication between 2 16-bit integers 
###
.section .text
.globl _start
_start:
	movw $25, %ax		### we are using 16-bit registers
	imul $25, %ax, %bx 	##Since we are doing signed multiplication, 16th bit will be used for signed, so the range is -32767<->+32768
				## The output 25 * 25, will be performed and stored in bx
				# In this case there is no overflow
	movl $1, %eax
	int $0x80

/*
(gdb) list
1       ### This program demonstrates signed multiplication between 2 8-bit integers 
2       ###
3       .section .text
4       .globl _start
5       _start:
6               movw $25, %ax           ### we are using 8-bit registers
7               imul $25, %ax, %bx      ##Since we are doing signed multiplication, 7th bit will be used for signed, so the range is -127 - +128
8                                       ## The output 5 * 5, will be performed and stored in bl , 
9                                       # In this case there is no overflow
10              movl $1, %eax
(gdb) break 5
Breakpoint 1 at 0x8048054: file mul9.s, line 5.
(gdb) r
Starting program: /home/ashok/practice/alp/mul9 

Breakpoint 1, _start () at mul9.s:6
6               movw $25, %ax           ### we are using 8-bit registers
(gdb) s
7               imul $25, %ax, %bx      ##Since we are doing signed multiplication, 7th bit will be used for signed, so the range is -127 - +128
(gdb) p/d $ax
$1 = 25
(gdb) s
10              movl $1, %eax
(gdb) p/d $ax
$2 = 25
(gdb) p/d $bx
$3 = 625
(gdb) info reg eflags
eflags         0x206    [ PF IF ]
(gdb) s
11              int $0x80
(gdb) s

Program exited with code 0161.
(gdb) 
*/

