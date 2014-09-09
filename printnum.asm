;;; printnum.asm
;;; print a number passed in

section .text

global printnum
global start
	
start:
	mov ebx, 0		; i = 0
	
L_loop:
	;; print i
	push dword ebx
	call printnum
	
	sub esp, 4
	add ebx, 1
	cmp ebx, 10
	jne L_loop

	;; print a newline
	push dword 1
	push dword nl
	push dword 1

	mov eax, 4
	sub esp, 4
	int 0x80

	add esp, 16
	
	push dword 1
	mov eax, 1
	int 0x80
	
printnum:
	;; prolog
	;; 	push dword ebp
	;; 	mov esp, ebp

	mov eax, [esp+4]	; put argument into eax
	add eax, nums
	push dword 1		; 1 character
	push dword eax		; send character at index
	push dword 1

	mov eax, 4
	sub esp, 4		; 16-byte align stack
	int 0x80

	add esp, 16		; cleanup stack
	
	;; epilog
	;; 	mov ebp, esp
	;; 	pop ebx
	ret
	
section .data

	nums db "0123456789"
	nl   db 0xA		; newline character
