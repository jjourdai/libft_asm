%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define WRITE				4

section .data
	new_line dw 10
	empty:
		.string db "(null)", 10
		.len equ $ - empty.string

section .text
	global _ft_puts
	extern _ft_strlen

_ft_puts:
	cmp rdi, 0
	je empty_string
	mov rcx, rdi
	push rdi
	call _ft_strlen
	pop rsi
	mov rdx, rax
	mov rdi, STDOUT
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	lea rsi, [rel new_line]
	mov rdx, 1
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	mov rax, 10
	ret

empty_string:
	mov	rdi, STDOUT
	lea rsi, [rel empty.string]
	lea rdx, [empty.len]
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	mov rax, 10
	ret


