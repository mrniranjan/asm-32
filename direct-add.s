#Purpose: This program is to illustrate the direct addressing mode
#	  In this program we pass store the 
#Varirables: The variables used here:
#		t1 holds the value 10 which is of type integer 
#		t2 holds the value 20 which is of type integer
#		value of t1 is copied to %bx
#		value of t2 is copied to %cx
#		exit system call is copied to %ax 
#		bx holds the sum
.section .data
t1:
.int 10
t2: 
.int 20
.section .text
.globl _start
_start:
mov t1,%bx  # we are passing the address where value 10 is stored to %bx, 
mov t2,%cx  # we are passing the address where value 20 is stored to %cx
add %cx,%bx # we add %bx, %cx and store the result in %bx
mov $1,%ax  # we call exit system call
int $0x80   # Please call Bruce wayne to run my program
