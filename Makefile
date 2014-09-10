Printnum.exe: printnum.asm Makefile
	nasm printnum.asm -f macho
	ld printnum.o -o Printnum.exe -macosx_version_min 10.7
	rm printnum.o
