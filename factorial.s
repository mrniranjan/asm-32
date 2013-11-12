#PURPOSE:	Given a number, This program computes the factorial.
#		Ex: factorial of 4 is: 4*3*2*1
#This program shows how to call a function. You call a function by pushing all the
#arguments, then call a the function and the resulting value is in eax 
#

.section .data

#This program has no global data

.section .text
.globl _start		
.globl factorial 	# This is un-needed unless we want to share
			# this function among other programs
_start:
	pushl $4	# The factorial takes on argument - The number 
			# we want a factorial of. So, it gets pushed
	call factorial	# run the factorial function
	popl %ebx	# always remember to pop anything you pushed
	movl %eax, %ebx	# factorial returns the answer in %eax, but we
			# want it tin %ebx to send it as our exit status
	movl  $1, %eax  # call the kernel's exit status 
	int $0x80

# This is the actual function
.type factorial, @function
factorial:
	pushl %ebp	# standard function stuff - we have to restore 
			# ebp to it's prior state before returning 
			# so we have to push it 
	movl %esp,%ebp	# This is because we don't want to modify the stack 
			# pointer, So we use %ebp instead. This is also because %ebp
			# is more flexible

	movl 8(%ebp), %eax # This moves the first argument in to eax
	cmpl $1, %eax	# if the number is 1, That is our base case, and we simply  return
	je end_factorial 
	decl %eax	# otherwise decrease the value 			
	pushl %eax	#push it for our next call to factorial 
	call factorial	# call factorial
	popl %ebx	# This is the number we called factorial with 
			# we have to pop it off, but we also need
			# it to find the number we called with 
	incl %ebx	# (which is one more than what we pushed) 
	imul %ebx, %eax # multiply that by the result of the last
			# call to factorial (stored in %eax)
			# the answer is stored in %eax, which is good since
			# that's where return values go 

end_factorial:	
	movl %ebp, %esp	# standard function return stuff 
	popl %ebp	# we have to restore %ebp and %esp to where 
			# they were before the function started
	ret		# return to the function (this pops the return value, too)			
