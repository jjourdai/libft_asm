section .text
	global _ft_memcpy

_ft_memcpy:
	cmp rdi, 0
	je _error

	push rdi
	mov rax, rdx
	mov rbx, 8
	mov rdx, 0
	div rbx
	
	mov rcx, rax
	rep movsq

	mov rcx, rdx
	rep movsb
	pop rax
	ret	

_error:
	ret
