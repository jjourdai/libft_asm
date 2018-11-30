%define SYSCALL_MACOS(nb) 0x2000000 | nb
%define WRITE 4
%define READ 3
%define FILENO_STDOUT 1

%define BUFFER_SIZE 4096

section .text
	global _ft_cat
	extern _read

_ft_cat:
	push rdi
	lea rsi, [rel buffer]
	mov rdx, BUFFER_SIZE
	call _read
	cmp rax, -1
	jle _error
	cmp rax, 0
	je _end

_loop:
	mov rdi, FILENO_STDOUT
	lea rsi, [rel buffer]
	mov rdx, rax
	mov rax, SYSCALL_MACOS(WRITE)
	syscall
	pop rdi
	jmp _ft_cat

_end:
	mov rax, 0
	pop rdi
	ret

_error:
	pop rdi
	mov rax, 1
	ret	

section .bss
	buffer: resb BUFFER_SIZE
