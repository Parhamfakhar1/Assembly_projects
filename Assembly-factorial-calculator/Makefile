all:
	nasm -felf64 factorial.asm -o factorial.o
	gcc -no-pie factorial.o -o factorial

clean:
	rm -f factorial.o factorial
