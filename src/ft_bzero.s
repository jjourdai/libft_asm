section .text
	global _ft_bzero

_ft_bzero:
	mov rax, rsi
	mov rbx, 8
	mov rdx, 0
	div rbx

	mov rcx, rax
	mov rax, 0
	rep stosq

	mov rcx, rdx
	rep stosb	
	ret
