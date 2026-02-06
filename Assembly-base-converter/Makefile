all:
	nasm -felf64 baseconv.asm -o baseconv.o
	gcc -no-pie baseconv.o -o baseconv

clean:
	rm -f baseconv.o baseconv
