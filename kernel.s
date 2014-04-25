/*
   kernel.s
*/
.section .text
	.int 0x1badb002  # magic
	.int 0x00 # flags
	.int -(0x1badb002+0x00) # checksum. m+f+c should be zero

.global start
.extern kmain

start:
	cli
	call kmain
	hlt

