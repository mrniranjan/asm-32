# PURPOSE: Given a number, this program computes the
# factorial. For example the factorial of
# 3 is 3 * 2 * 1 or 6 the factorial of
# 4 is 4 * 3 * 2 * 1, or 24 and so on.
	
.section .text
.globl _start
_start:
	pushl $4 		# pass 4 to stack (function)
	call factorial		# call factorial function
	addl $4, %esp		# bring the esp back to the original value
	movl %eax, %ebx		# save the result in %ebx
	movl $1, %eax		# call exit function
	int $0x80		# exit

.type factorial, @function	
factorial:
	pushl %ebp		# save old ebp
	movl %esp, %ebp		# we use base pointer to access stack values
	movl 8(%ebp), %eax	# get the first argument to stack in to %eax
	cmpl $1, %eax		# if the number is one this our base case and we  
	je end_factorial	# simply go to the end of the function
	decl %eax		# othe wise decrement eax
	pushl %eax		# we push that value to stack 
	call factorial		# call factorial 
	movl 8(%ebp), %ebx	# %eax has return value so we reload that our
				# parameter in to %ebx
	imull %ebx, %eax	# multiply the result with last call to factorial
				# answer is stored in %eax
end_factorial:
	movl %ebp, %esp
	popl %ebp
	ret
	
	
