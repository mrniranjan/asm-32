.section .data

t1:                     # These are the data items
.int   10,30,20

.section .text

.globl _start

_start:
mov $0,%edi
mov t1(,%edi,4), %ax 
mov $1, %edi
mov t1(,%edi,4), %bx
mov $2, %edi
mov t1(,%edi,4), %cx
add %ax, %bx
add %cx, %bx
movl $1, %eax
int $0x80

