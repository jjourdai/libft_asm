section .text
	global start
	global _main
	extern _puts

start:
	call _main
	ret

; RDI = argc
; RSI = argv

_main:
	push	rdi
	push	rsi
	sub		rsp, 8
	
	mov rdi, [rsi]
	call _puts

	add rsp, 8
	pop rsi
	pop rdi

	add rsi, 8
	dec rdi
	jnz _main

	ret
