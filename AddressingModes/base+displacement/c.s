        .section .data

t1:
        .long 1,2,3,4
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
        addl %ecx, %ebx
        jmp start_loop
exit_prg:
        movl $1, %eax
        int $0x80
        
