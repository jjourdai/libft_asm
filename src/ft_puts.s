%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT				1
%define WRITE				4

section .text
	global _ft_puts

_ft_puts:
	cmp rdi, 0
	je empty_string
	mov rcx, rdi
	mov rdx, 0

_get_len:
	mov eax, [rcx + rdx]
	cmp eax, 0
	je print
	inc rdx
	jmp _get_len

print:
	mov rsi, rdi
	mov rdi, STDOUT
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	mov rsi, new_line
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

section .data
	new_line db 10
	empty:
		.string db "(null)", 10
		.len equ $ - empty.string
