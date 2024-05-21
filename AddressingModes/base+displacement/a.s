        // Example program for base + displacement

        .section .data
t1:
        .long 5
        .section .text
        .globl _start
_start:
        movl $t1, %eax
        movl 10(%eax), %ebx
        movl $1, %eax
        int $0x80
      
