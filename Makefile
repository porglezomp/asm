Printnum.exe: printnum.asm
	nasm printnum.asm -f macho -g
	ld printnum.o -o Printnum.exe
	rm printnum.o
