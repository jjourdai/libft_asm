section .text
	global _ft_strmap
	extern _malloc
	extern _ft_strlen


_ft_strmap:
	push rbp

	cmp rdi, 0
	je _error
	cmp rsi, 0
	je _error
	cmp byte [rel rdi], 0 
	je _error
	

	sub rsp, 48
	mov qword [rsp + 16], rdi
	mov qword [rsp + 24], rsi
	mov qword [rsp + 16], 0

	call _ft_strlen
	inc rax
	
	mov rdi, rax
	call _malloc

	mov qword [rsp + 32], rax

_loop:
	mov rdi, qword [rsp + 16]
	
	

	
	cmp byte [rel rdi], 0 
	je _loop
	
	
	add rsp, 48
	pop rbp	


_error:
	mov rax, 0
	pop rbp	
	
