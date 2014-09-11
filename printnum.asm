;;; printnum.asm
;;; print a number passed in

section .text

global printnum
	
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
