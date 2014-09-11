SOURCES = printnum.asm pnum_main.asm fib.asm newline.asm
OBJECTS = $(SOURCES:.asm=.o)

all: Printnum.exe Fibo.exe

Printnum.exe: printnum.o pnum_main.o Makefile newline.o
	ld printnum.o pnum_main.o newline.o -o Printnum.exe -macosx_version_min 10.7

Fibo.exe: printnum.o fib.o Makefile newline.o
	ld printnum.o fib.o newline.o -o Fibo.exe -macosx_version_min 10.7

%.o: %.asm
	nasm $< -f macho
