# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    syscall.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jjourdai <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/26 12:17:19 by jjourdai          #+#    #+#              #
#    Updated: 2018/12/03 10:54:21 by jjourdai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

%define MACH_SYSCALL(nb)	0x2000000 | nb
%define STDOUT 				1
%define WRITE 				4

section .data
hello:
	.string db "Hello World !", 10
	.len equ $ - hello.string

section .text
	global start
	global _main

start:
	call _main
	ret

_main:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rdi, STDOUT
	lea rsi, [rel hello.string]
	mov rdx, hello.len
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	leave
	ret

