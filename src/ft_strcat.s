section .text
	global _ft_strcat
	extern _ft_strlen
	extern _ft_memcpy

	;		char *strcat(char *s1, char *s2);

_ft_strcat:

	push rbp
	
	sub rsp, 48
	mov qword [rsp + 8], rdi
	mov qword [rsp + 16], rsi

	call _ft_strlen
	mov qword [rsp + 24], rax 		;save s1 len

	mov rdi, qword [rsp + 16]
	call _ft_strlen
	;mov qword [rsp + 32], rax 		;save s2 len

	mov rdi, qword [rsp + 8]
	mov rsi, qword [rsp + 16]
	mov rdx, qword [rsp + 24]
	
	add rdi, rdx
	mov rdx, rax
	inc rdx
	call _ft_memcpy

	mov rax, qword [rsp + 8]
	add rsp, 48
	pop rbp
	ret
