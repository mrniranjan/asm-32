#Purpose: This program illustrates Register addressing mode or also called indirect addressing mode
#	Here we are calculating Effective address using :
#	Effective Address: displacement(base,index,scale)
#	i.e (effective Address=displacement + [base + index * scale])
#INPUT: NONE
#OUTPUT: echo $?
#Variables: var1: is variable declared in memory which is symbol to a array of numbers
#Note here var1 is declared as integer which means each member of array would takes 4 bytes
#Lets assume we want increment all the values of the array by 1 and we need to access the 
#array using displacement, index, scale, base is omitted
.section .data
var1:
.int 10,11,12,13
.section .text
.globl _start
	_start:
		movl $var1, %edi
		movl $0, %esi		#Since Index should be a register, The first element var[0], so ecx gets 0

		addl $1, var1(,%esi,4)	#index(%ecx)=0,scale=4 , because 4 is total storage location taken by each element of array
					#displacement=var1 i,e starting address
					# var1(,%ecx,4) ==>> starting address(,0,4)
					#=>>displacement(startingaddres)[0+0*4]=> starting address
		movl (%edi), %eax	
		
		movl $1, %esi		#We need to move to next array element
		addl $1, var1(,%esi,4)	#displacment(starting address)[0+1*4]=>(starting address+4) now adding 1 to the value 
					# stored in (Starting address+4)

		movl 4(%edi), %ebx	#copy the net result in %eax		
	
		movl $2, %esi		#we move to var1[2] now
		addl $1, var1(,%esi,4)	#displacement(0+2*4)
		movl 8(%edi), %ecx

		movl $3, %esi		# we mmove to var1[3] now
		addl $1, var1(,%esi,4)
		movl 12(%edi), %edx

		movl $1, %eax 	 
		int $0x80	 


#output of the program as seen:

#(gdb) n
#40                      movl $1, %eax    
#(gdb) info registers
#eax            0xb      11
#ecx            0xd      13
#edx            0xe      14
#ebx            0xc      12

