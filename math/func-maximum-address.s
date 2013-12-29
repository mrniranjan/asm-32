#This program finds maximum from a list using a function 
#In this program we are sending address of data_items to the function 

.section .data
data_items:                     # These are the data items stored in memory 
.long   6,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text
.globl _start
_start:
	pushl $data_items
	call maximum
	movl $1, %eax
	int $0x80	
.type maxmium, @function
maximum:
	pushl %ebp		
	movl %esp, %ebp		
	movl 8(%ebp), %ecx			#push the address of data_items to %ecx
	movl $0, %edi				#initialize edi with 0
	movl (%ecx), %eax			#get the value at the address given in ecx and store it in eax
	movl %eax, %ebx				#copy the eax to ebx which is current maximum
	start_loop:
		cmpl $0, (%ecx)			#we check if the last value of the list is 0
		je end_loop			#if zero we exit
		incl %edi			#increment edi
		movl (%ecx,%edi,4), %eax	#Using base,index & scale we move the next item on the list and store it in %eax
		cmpl %ebx, %eax			#compare with current maximum
		jle start_loop			#if it's less go to start of the loop
		movl %eax,%ebx			#if the current value is higher, we update the current maximum
		jmp start_loop			#start the loop again to get next item on the list
	end_loop:
		movl %ebp,%esp			#get the stack pointer back to ebp 
		popl %ebp			#popl ebp from stack
		ret				#return to start

	
		
	
