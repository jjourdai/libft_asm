section .text
	global _ft_strdup
	extern _ft_strlen
	extern _ft_memcpy
	extern _malloc

_ft_strdup:
	push rbp

	push rdi
	call _ft_strlen
	inc rax
	mov rdi, rax
	push rax
	call _malloc

	cmp rax, 0
	je exit

	pop rdx
	pop rsi
	mov rdi, rax
	call _ft_memcpy

	pop rbp
	ret

exit:
	pop rdi
	mov rax, 0
	pop rbp
	ret
