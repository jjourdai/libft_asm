section .text
	global _ft_atoi_u
	extern _ft_isdigit
	extern _ft_isblank_v2
	extern _puts

_ft_atoi_u:
	push rbp
	
	mov rax, [rel value]

_loop
	cmp byte [rel rdi], 0
	je _stop

	push rdi
	mov rbx, 0
	mov bl, byte [rel rdi]
	mov rdi, rbx
	push rax
	call _ft_isdigit
	mov rbx, rax
	pop rax
	pop rdi
	cmp rbx, 0 
	je _stop

	mov rbx, 10
	mul rbx
	
	mov rbx, 0
	mov bl, byte [rel rdi]
	sub rbx, 48
	add rax, rbx
	
	inc rdi
	jmp _loop

_stop:
	pop rbp
	ret

section .data
	value dd 0 ;double word 2 * 2 bytes 
