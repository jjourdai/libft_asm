section .text
	global _ft_strcat
	extern _ft_strlen
	extern _ft_memcpy

_ft_strcat:
	push rdi
	push rsi
	call _ft_strlen
	pop rdi
	push rdi
	push rax
	call _ft_strlen

	pop rdx	; get len s1
	pop rsi ; get s2
	pop rdi ; get s1
	push rdi
	add rdi, rdx
	mov rdx, rax
	call _ft_memcpy
	pop rax
	ret
