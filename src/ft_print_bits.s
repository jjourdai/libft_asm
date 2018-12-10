%define FILENO_STDOUT 1
%define MACH_SYSCALL(nb)	0x2000000 | nb
%define WRITE				4

section .text
	global _ft_print_bits
	extern _write
	extern _printf
	extern _puts
	extern _fflush

_ft_print_bits:
	push rbp
	sub rsp, 24

	mov rdx, 1
	and rdx, rdi
	mov qword [rsp + 8], rdx

	shr rdi, 1
	
	cmp rdi, 0
	je _print
	jmp _recurs

_recurs:
	call _ft_print_bits

_print:
	add qword [rsp + 8], 48
	lea rsi, [rsp + 8]
	mov rdi, FILENO_STDOUT
	mov rdx, 1
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	add rsp, 24
	pop rbp
	ret

