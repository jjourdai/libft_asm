section .text
	global _ft_toupper

_ft_toupper:
	cmp rdi, 97
	jl end
	cmp rdi, 122
	jg end	
	sub rdi, 32

end:
	mov rax, rdi
	ret
