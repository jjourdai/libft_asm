section .text
	global _ft_strcmp
	extern _puts
	extern _strlen


_ft_strcmp:
	
	repe cmpsb
	
	inc rdi
	inc rsi

	mov rax, 0
	mov rbx, 0

	mov al, [rel rdi]
	mov bl, [rel rsi]
	sub eax, ebx

	ret
