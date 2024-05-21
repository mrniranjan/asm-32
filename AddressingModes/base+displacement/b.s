        .section .data
t1:
        .long 5,10,15
        .section .text
        .globl _start
_start:
        movl $8, %eax
        movl t1(%eax), %ebx
        movl $1, %eax
        int $0x80
        
