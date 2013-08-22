#Purpose: This is simple addition program using 16 bit registers 
#Variables: 16-bit registers %bx,%cx,%ax
# 	%bx  and %cx is the 16bit registers to hold 2 bytes , storing value 5
#	storing the addition in %bx so that when exit system call is called through ax
#	exit prints the addition of %bx and %cx , where the sum is stored in %bx
.section .data
.section .text
.globl _start
_start:
mov $4,%bx # Immediate addressing mode 
mov $3,%cx # pass value 7 directly register cx (16bit register)
add %cx,%bx # add the values in registers cx and bx and store in bx
mov $1,%ax
int $0x80
