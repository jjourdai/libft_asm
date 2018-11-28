section .text
	global _ft_memset

_ft_memset:
	mov rcx, rdx
	mov rax, rsi
	rep stosb	
	ret
