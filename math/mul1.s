###This program demonstrates Signed Multiplication using imul
### here we demonstrate Multiplication of 2 8-bit Signed numbers , where the result is also 8-bit
.section .text
.globl _start
_start:
	movb $5, %al	#we store 5 in lower 8-bits of eax, 
	imul %al 	#we use %al as source and destination
	movl $1, %eax
	int $0x80

/*
(gdb) list
warning: Source file is more recent than executable.
1       ###This program demonstrates Signed Multiplication using imul
2       ### here we demonstrate Multiplication of 2 8-bit Signed numbers , where the result is also 8-bit
3       .section .text
4       .globl _start
5       _start:
6               movb $5, %al    #we store 5 in lower 8-bits of eax, 
7               imul %al        #we use %al as source and destination
8               movl $1, %eax
9               int $0x80
(gdb) break 5
Breakpoint 1 at 0x8048054: file mul1.s, line 5.
(gdb) r
Starting program: /home/ashok/practice/alp/mul1 

Breakpoint 1, _start () at mul1.s:6
6               movb $5, %al    #we store 5 in lower 8-bits of eax, 
(gdb) s
7               imul %al        #we use %al as source and destination
(gdb) s
8               movl $1, %eax
(gdb) p/d $al
$1 = 25
(gdb) p/u $al
$2 = 25
(gdb) s
9               int $0x80
(gdb) s

Program exited normally.
*/
