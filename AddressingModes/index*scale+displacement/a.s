        .section .data
t1:
        .long 1,2,3,4
        .section .text
        .globl _start
_start:
        movl $1, %eax
        mov t1(,%eax,4), %bl
        movl $1, %eax
        int $0x80
        
