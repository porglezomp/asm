;; hello.asm
;; print "hello, world" using syscalls

section .text

global start

start:

;; print "hello, world"
	;; prep arguments
	push dword len
	push dword msg
	push dword 1

	;; make the system call
	mov eax, 0x4
	sub esp, 4		; need extra space on stack
	int 0x80		; interrupt 128, syscall

	;; clean up stack
	add esp, 16

;; exit
	;; prep arguments
	push dword 0

	mov eax, 0x1
	sub esp, 4
	int 0x80

	;; no need to clean up because the program exits

section .data

	msg db "hello, world", 0xA ; 0xA is \n
	len equ $-msg		   ; current - start of string
				   ; equals length of string
