section .text
	global _ft_bzero
	
	;void bzero(void *s, size_t n);
	

_ft_bzero:
	mov rax, rsi
	mov rbx, 8
	mov rdx, 0
	div rbx ; get the value n / 8 to browse 's' fastly

	mov rcx, rax
	mov rax, 0
	rep stosq ; repeat the copy operation until rcx == 0

	mov rcx, rdx
	rep stosb	
	ret
