all:
	nasm -felf64 countdown.asm -o countdown.o
	gcc -no-pie countdown.o -o countdown

clean:
	rm -f countdown.o countdown
