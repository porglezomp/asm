;;; fib.asm
;;; prints fibonacci numbers

global start
extern printnum
extern newline
	
start:
	xor ecx, ecx		; iteration counter
	xor ebx, ebx
	mov edx, 1

L_loop:
	inc ecx
	
	;; call printnum
	push dword ecx
	push dword edx
	push dword ebx
	call printnum

	call newline
	pop ebx
	pop edx
	pop ecx

	;; iterate fibonacci
	mov eax, edx
	add edx, ebx
	mov ebx, eax

	;; loop limit
	cmp ecx, 25
	jl L_loop
	
	;; exit
	push 0
	mov eax, 1
	int 0x80
