%define TRUE 1
%define FALSE 0

; int ft_isdigit(int c)

section .text
	global _ft_isdigit

_ft_isdigit:
	cmp rdi, '0'
	jl false
	cmp rdi, '9'
	jg false

true:
	mov rax, 1
	ret
	
false:
	mov rax, 0
	ret
		
