section .text
	global _ft_strcmp
	extern _puts
	extern _strlen


_ft_strcmp:
	
	repe cmpsb
	
	mov rax, 0
	mov rbx, 0

	mov al, [rel rdi - 1]
	mov bl, [rel rsi - 1]
	sub eax, ebx

	ret
