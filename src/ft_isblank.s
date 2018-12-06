section .text
	global _ft_isblank

_ft_isblank:
	push rbp
		
	;cmp rdi, 10 ; \n
	;je _error
	cmp rdi, 9 ; \t
	je _error
	;cmp rdi, 11 ; \v
	;je _error
	cmp rdi, 32 ; space
	je _error
	;cmp rdi, 12 ; \f
	;je _error
	;cmp rdi, 13 ; \r
	;je _error

	pop rbp
	mov rax, 0
	ret

_error:
	pop rbp
	mov rax, 1
	ret
