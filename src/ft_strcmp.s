section .text
	global _ft_strcmp
	extern _ft_strlen

_ft_strcmp:
	push rbp	

	sub rsp, 32
	mov [rsp + 8], rdi
	mov [rsp + 16], rsi

	call _ft_strlen

	mov rcx, rax
	inc rcx
	mov rdi, [rsp + 8]
	mov rsi, [rsp + 16]
	repe cmpsb
	
	mov rax, 0
	mov rbx, 0

	mov al, [rel rdi - 1]
	mov bl, [rel rsi - 1]
	sub eax, ebx

	add rsp, 32
	pop rbp
	ret
