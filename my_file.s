
t1.o:     file format elf32-i386


Disassembly of section .text:

00000000 <_start>:
.section .text
.globl _start
_start:
movl $0, %edi
lea myvar+0, %eax
movl $myvar+4, %ebx
   0:	bf 00 00 00 00       	mov    $0x0,%edi
movl $myvar+8, %ecx
   5:	8d 05 00 00 00 00    	lea    0x0,%eax
			7: R_386_32	.data
movl $myvar+12, %edx
   b:	bb 04 00 00 00       	mov    $0x4,%ebx
			c: R_386_32	.data
movl $myvar+16, %edi
  10:	b9 08 00 00 00       	mov    $0x8,%ecx
			11: R_386_32	.data
movl $1, %ebx
  15:	ba 0c 00 00 00       	mov    $0xc,%edx
			16: R_386_32	.data
movl $1, %eax
  1a:	bf 10 00 00 00       	mov    $0x10,%edi
			1b: R_386_32	.data
int $0x80
  1f:	bb 01 00 00 00       	mov    $0x1,%ebx
	
  24:	b8 01 00 00 00       	mov    $0x1,%eax
  29:	cd 80                	int    $0x80
