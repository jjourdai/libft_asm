%define SYSCALL_MACOS(nb) 0x2000000 | nb
%define WRITE 4
%define PROT_READ 0x01
%define MAP_PRIVATE 0x0002
%define FILENO_STDOUT 1

section .text
	global _ft_cat_mmap
	extern _fstat
	extern _mmap
	extern _munmap


_ft_cat:
	push rdi
	lea rsi, [rel buffer]
	call _fstat
	cmp rax, -1
	jl _error

	mov rax, [rel buffer + 72] ; get stat.st_size
	mov rdi, 0
	mov rsi, rax
	mov rdx, PROT_READ
	mov rcx, MAP_PRIVATE
	pop r8
	push rax
	
	mov r9, 0
	call _mmap

	cmp rax, 0
	jle _error

	mov rdi, FILENO_STDOUT
	mov rsi, rax
	pop rdx
	push rdx
	push rdi
	sub rsp, 8
	mov rax, SYSCALL_MACOS(WRITE)
	syscall

	add rsp, 8
	pop rdi
	pop rsi
	sub rsp, 8
	call _munmap
	add rsp, 8
	mov rax, 0
	ret

_error:
	add rsp, 8
	mov rax, 1
	ret	

section .bss
	buffer: istruc stat
;	buffer: resb 144
