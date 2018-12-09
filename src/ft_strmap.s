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

	mov rbp, rsp
	sub rsp, 48
	mov qword [rsp + 8], 0 			; counter
	mov qword [rsp + 16], rdi		; first params
	mov qword [rsp + 24], rsi		; function ptr

	call _ft_strlen
	inc rax
	mov qword [rsp + 40], rax		; size of first string
	
	mov rdi, rax
	call _malloc

	mov qword [rsp + 32], rax		; allocated string

_loop:
	mov rcx, qword [rsp + 8]
	cmp rcx, qword [rsp + 40]
	je _end
	
	mov rsi, qword [rsp + 24]
	mov rdi, qword [rsp + 16]
	movsx edi, byte [rdi + rcx]
	call rsi
	mov rcx, qword [rsp + 8]
	mov rdx, qword [rsp + 32]
	mov byte [rdx + rcx], al

	inc qword [rsp + 8]
	jmp _loop
	
_end:
	mov rax, qword [rsp + 32]
	add rsp, 48
	pop rbp
	ret

_error:
	mov rax, 0
	pop rbp	
	ret
	
