;;; printnum.asm
;;; print a number passed in

section .text

global printnum
	
printnum:
	;; prolog
	push dword ebp
	mov ebp, esp

	mov eax, [ebp+8]	; put argument into eax
	xor ecx, ecx		; zero the string length
	mov ebx, 10			; store 10 in ebx for dividing

L_prepchar:
	;; prepare the characters to be printed
	
	inc ecx
	xor edx, edx		; zero edx
	div ebx				; divide eax by 10
	add edx, "0"		; turn edx into ascii for the digit
	sub esp, 1
	mov [esp], dl
	cmp eax, 0			; work until all characters are depleted
	jg L_prepchar
	;; store the beginning of the string
	mov edx, esp		

	push dword ecx		; 1 character
	push dword edx		; beginning of string
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
