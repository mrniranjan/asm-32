#purpose: Purpose of the program is to add all the numbers of a list

#INPUT: data_items from Memory

#output: sum of all the numbers in a list

#variables: data_items: containing all the elements of a list,

.section .data
data_items:
.long 1,2,3,4,5,6,0
.section .text
.globl _start
        _start:
                movl $0, %edi
                movl data_items(,%edi,4), %eax
                movl %eax, %ebx
        start_loop:
                cmpl $0, %eax
                je loop_exit
                incl %edi
                movl data_items(,%edi,4), %eax
                addl %eax, %ebx
                jmp start_loop
        loop_exit:
                movl $1, %eax
                int $0x80


