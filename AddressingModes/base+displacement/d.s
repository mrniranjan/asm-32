        .section .data

t1:
        .long 2,4,6,8
        .section .text
        .globl _start
_start:
        movl $0, %eax
        movl $12, %edi
        movl t1, %ebx
start_loop:
        cmpl %edi, %eax
        je exit_prg
        add $4, %eax
        movl t1(%eax), %ecx
        
