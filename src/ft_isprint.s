section .text
	global _ft_isprint
	
_ft_isprint:
	cmp rdi, 32
	jl false
	cmp rdi, 126
	jg false
	

true:
	mov rax, 1
	ret

false:
	mov rax, 0
	ret
