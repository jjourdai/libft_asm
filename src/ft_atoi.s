section .text
	global _ft_atoi
	extern _ft_atoi_u
	extern _ft_isdigit
	extern _ft_isblank_v2

_ft_atoi:
	push rbp
	
	mov rax, [rel value]

_drop_char:
	mov rdx, 0
	mov dl, byte [rel rdi]
	cmp rdx, 0
	je _stop
	inc rdi
	push rdi
	mov rdi, 0
	mov rdi, rdx
	call _ft_isblank_v2
	pop rdi
	cmp rax, 1
	je _drop_char
	dec rdi

_check:
	mov rdx, 0
	mov dl, byte [rel rdi]
	cmp rdx, 45 ; -
	je _less
	cmp rdx, 43 ; +
	je _more
	call _ft_atoi_u
	jmp _stop

_more:
	inc rdi
	call _ft_atoi_u
	jmp _stop

_less:
	inc rdi
	call _ft_atoi_u
	mov rbx, 0
	mov ebx, -1
	imul ebx


_stop:
	pop rbp
	ret

section .data
	value dd 0 ;double word 2 * 2 bytes 
