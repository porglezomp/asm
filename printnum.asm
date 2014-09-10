;;; printnum.asm
;;; print a number passed in

section .text

global printnum
global start
	
start:
	mov ecx, 0		; i = 0
	
L_loop:
	;; print i
	push dword ecx	; save register
	push dword ecx	; push argument
	call printnum
	add esp, 4		; pop argument
	pop dword ecx	; load saved register

	;; loop 10 times
	add ecx, 1
	cmp ecx, 100
	jl L_loop

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
	
printnum:
	;; prolog
	push dword ebp
	mov ebp, esp

	mov eax, [ebp+8]	; put argument into eax
	;; modulous 10
	xor edx, edx		; zero edx
	mov ecx, 10
	div ecx
	mov eax, edx
	add eax, nums
	push dword 1		; 1 character
	push dword eax		; send character at index
	push dword 1
	sub esp, 4			; 16-byte align stack

	mov eax, 4
	int 0x80

	add esp, 16			; cleanup stack
	
	;; epilog
	mov esp, ebp
	pop dword ebp
	ret
	
section .data

	nums db "0123456789"
	nl   db 0xA		; newline character
