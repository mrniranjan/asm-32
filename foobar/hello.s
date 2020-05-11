              .section .text
              .globl _start
_start:
              pushl $3
              pushl $2
              call foo
              movl $1, %eax
              int $0x80

              .type foo, @function

foo:
              movl 4(%esp), %eax
              movl 8(%esp), %ebx
              addl %eax, %ebx
              ret

