all:
	nasm -felf64 multtable.asm -o multtable.o
	gcc -no-pie multtable.o -o multtable

clean:
	rm -f multtable.o multtable
