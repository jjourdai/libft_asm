# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    mini.s                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jjourdai <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/26 11:08:07 by jjourdai          #+#    #+#              #
#    Updated: 2018/11/26 11:09:16 by jjourdai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global start
	global _main

start:
	call _main
	ret
	
_main:
	ret
