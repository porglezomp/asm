section .text

global start
extern printnum
extern newline

start:
	push dword 4242	; push argument
	call printnum
	add esp, 4		; pop argument

	call newline
	
	push dword 1
	mov eax, 1
	int 0x80