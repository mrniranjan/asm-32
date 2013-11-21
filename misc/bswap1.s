#PURPOSE This program illustrates bswap instruction which swaps big Endian to little endian and vice versa
#INPUT : myInt variable of type Integer with value 25
#OUTPUT: NONE

.section .data
myInt:
.int 25				#value 25 being put, 
.section .text
.globl _start
_start:
mov $myInt, %ebx		#here we are passing address of myInt to ebx
bswap %ebx			#we swap LSB to HSB and vice versa
movl $1, %eax			# call exit system call
int $0x80			# call bruce wayne


