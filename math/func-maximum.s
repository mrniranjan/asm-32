#This program finds maximum from a list using a function


.section .data
data_items:                     # These are the data items stored in memory 
.long   6,67,34,222,45,75

.section .text
.globl _start
_start:
	movl $0, %edi				#we store initialize 0 to %edi
	movl data_items(,%edi,4), %eax		#move the first item on the list to %eax
	start_loop:
		cmpl $75, %eax			#we check if we are end of the list 
		je end_loop			
		pushl %eax			#we move all the items on the list to stack
		incl %edi			#increment %edi
		movl data_items(,%edi,4), %eax	#move the next item on the list 
		jmp start_loop			#jump to start of the loop

	end_loop:
		call maximum			# call maximum function
		movl $1, %eax			# call exit function
		int $0x80			# call bruce wayne

.type maxmium, @function
maximum:
	pushl %ebp				#save old ebp
	movl %esp, %ebp				#copy the stack pointer to ebp
	movl $2, %edi				#initialize %edi to 2
	movl (%ebp,%edi,4), %ecx 		#%ebp is base , %edi, is Index registers, 4 is scale we access last item 45 to list
	movl %ecx, %edx				# copy the value to current maximum
	func_start_loop:
		cmpl 24(%ebp), %ecx		#we check if we have hit the last address
		je func_end_loop		#if so go to end of the loop
		incl %edi			#increment %edi
		movl (%ebp,%edi,4), %ecx	#copy the next item on the stack to ecx
		cmpl %edx, %ecx			#compare ecx with current maximum
		jle func_start_loop		#if ecx is less go to func_start_loop
		movl %ecx, %edx			#else replace the current maximum with %ecx
		jmp func_start_loop		#Repeat loop again
 	func_end_loop:				#end of loop
		movl %edx,%ebx			#copy the highest value to %ebx
		movl %ebp, %esp			#get the stack pointer back to %ebp
		popl %ebp			#popl %ebp
		ret				#come out of maximum function

	
	
