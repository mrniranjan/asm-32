##This program calculates an array of elements using recursion 
##we use function sum which takes 2 paramters, Name of the Array and number of
##elements  ie. sum (A,n), where n is the number of elements

.section .data
Array:
.long 5,4,3,2,1
.section .text
.globl _start
_start:
	push $5			#we push in reverse order
	push $Array
	call sum
	movl $8, %esp
	movl $1, %eax
	int $0x80

.type sum, @function
sum:
	pushl %ebp
	movl %esp, %ebp
	movl 12(%ebp), %ebx
	cmpl $0, 12(%ebp)
	je result
	decl %ebx
	pushl %ebx
	pushl 8(%ebp)
	call sum
	addl $8, %esp
	mov 8(%ebp), %ebx
	movl 12(%ebp), %esi
	addl -4(%ebx,%esi,4), %eax
	movl %ebp, %esp
	popl %ebp
	ret

result:
	xor %eax, %eax
	movl %ebp,%esp
	popl %ebp
	ret	
