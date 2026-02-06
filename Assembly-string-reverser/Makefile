all:
	nasm -felf64 revstr.asm -o revstr.o
	gcc -no-pie revstr.o -o revstr

clean:
	rm -f revstr.o revstr
