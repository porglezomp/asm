section .text

global newline
	
newline:
	push dword ebp
	mov ebp, esp

	;; print a newline
	push dword 1
	push dword nl
	push dword 1
	sub esp, 4		; 16-byte align stack

	mov eax, 4
	int 0x80

	add esp, 16		; cleanup stack

	mov esp, ebp
	pop dword ebp
	ret

section .data
	nl   db 0xA		; newline character