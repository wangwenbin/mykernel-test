;;kernel.asm

bits 32 ;nasm directive - 32 bit
section .text
		;multiboot spec
		align 4
		dd 0x1badb002 	;magic
		dd 0x00 		;flags
		dd - (0x1badb002+0x00) ;checksum. m+f+c should be zero

global start
extern kmain

start:
	cli
	call kmain
	hlt

