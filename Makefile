all:kernel-asm-test kernel-s-test
	@echo "all done"
kernel-asm-test:kc.o link.ld kasm.o
	ld -m elf_i386 -T link.ld -o kernel-asm-test kasm.o kc.o
	@echo "done"
kernel-s-test:kc.o link.ld ks.o
	ld -m elf_i386 -T link.ld -o kernel-s-test ks.o kc.o
	@echo "done"
kc.o:kernel.c
	gcc -m32 -c kernel.c -o kc.o
	@echo "done"
kasm.o:kernel.asm
	nasm -f elf32 kernel.asm -o kasm.o
	@echo "done"
ks.o:kernel.s
	as --32 kernel.s -o ks.o
	@echo "done"
clean:
	rm kernel-*-test *.o
	@echo "done"
alltest:asmtest stest
	@echo "asmtest and stest is starting"
test:
	@echo "type'make alltest', 'make asmtest' or 'make stest' to starting"
asmtest:kernel-asm-test
	qemu-system-i386 -kernel kernel-asm-test &
stest:kernel-s-test
	qemu-system-i386 -kernel kernel-s-test &
