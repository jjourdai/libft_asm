# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    maxofthree.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jjourdai <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/26 15:08:39 by jjourdai          #+#    #+#              #
#    Updated: 2018/11/26 16:57:20 by jjourdai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _maxofthree

_maxofthree:
	mov rax, rdi
	cmp rax, rsi
	cmovl rax, rsi
	cmp rax, rdx
	cmovl rax, rdx
	ret

