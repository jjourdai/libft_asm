%define TRUE 1;
%define FALSE 0;

; int ft_isalpha(int c)

section .text
	global _ft_isalpha

_ft_isalpha:

greater_lower:
	cmp rdi, 'a'
	jge lower_lower

greater_upper:
	cmp rdi, 'A'
	jge lower_upper
	jmp false

lower_lower:
	cmp rdi, 'z'
	jle true

lower_upper:
	cmp rdi, 'Z'
	jle true

false:
	mov rax, FALSE
	ret

true:
	mov rax, TRUE
	ret
