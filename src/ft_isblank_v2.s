section .text
	global _ft_isblank_v2

_ft_isblank_v2:
	push rbp
		
	cmp rdi, 10 ; \n
	je _true
	cmp rdi, 9 ; \t
	je _true
	cmp rdi, 11 ; \v
	je _true
	cmp rdi, 32 ; space
	je _true
	cmp rdi, 12 ; \f
	je _true
	cmp rdi, 13 ; \r
	je _true

	pop rbp
	mov rax, 0
	ret

_true:
	pop rbp
	mov rax, 1
	ret
