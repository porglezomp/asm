Printnum.exe: printnum.asm pnum_main.asm Makefile
	nasm printnum.asm -f macho
	nasm pnum_main.asm -f macho
	ld printnum.o pnum_main.o -o Printnum.exe -macosx_version_min 10.7
	rm printnum.o pnum_main.o
