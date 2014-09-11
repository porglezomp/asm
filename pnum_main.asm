section .text

global start
extern printnum

start:
	push dword 4242	; push argument
	call printnum
	add esp, 4		; pop argument

	;; print a newline
	push dword 1
	push dword nl
	push dword 1
	sub esp, 4		; 16-byte align stack

	mov eax, 4
	int 0x80

	add esp, 16
	
	push dword 1
	mov eax, 1
	int 0x80

section .data
	nl   db 0xA		; newline character