# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jjourdai <jjourdai@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/01/17 13:28:01 by jjourdai          #+#    #+#              #
#    Updated: 2018/12/10 11:36:15 by jjourdai         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC_PATH = ./src/

SRC_NAME = ft_isalpha.s \
		   ft_isdigit.s \
		   ft_isalnum.s \
		   ft_isascii.s \
		   ft_isprint.s \
		   ft_toupper.s \
		   ft_tolower.s \
		   ft_puts.s \
		   ft_bzero.s \
		   ft_strlen.s \
		   ft_memcpy.s \
		   ft_memset.s \
		   ft_strcat.s \
		   ft_strdup.s \
		   ft_cat_mmap.s \
		   ft_cat.s \
		   ft_strcmp.s \
		   ft_isblank.s \
		   ft_isblank_v2.s \
		   ft_atoi_u.s \
		   ft_atoi.s \
		   ft_print_bits.s \
		   ft_strmap.s \

OBJ_PATH = .obj/

CPPFLAGS = -Iinclude

NAME = libfts.a

NASM = nasm

CFLAGS = -f macho64 

OBJ_NAME = $(SRC_NAME:.s=.o)

SRC = $(addprefix $(SRC_PATH), $(SRC_NAME))
OBJ = $(addprefix $(OBJ_PATH), $(OBJ_NAME))

MAIN_TEST = main_test

.PHONY: all, clean, fclean, re,
all: $(NAME)

$(NAME): $(OBJ) ./include/libfts.h
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME)

test: $(NAME)
	gcc main.c -o $(MAIN_TEST) $(NAME) -I ./include -Wall -Wextra -Werror

$(OBJ_PATH)%.o: $(SRC_PATH)%.s
	@mkdir $(OBJ_PATH) 2> /dev/null || true
	$(NASM) $(CFLAGS) $< -o $@ -g

clean:
	rm -fv $(OBJ)
	@rmdir $(OBJ_PATH) 2> /dev/null || true

fclean: clean
	rm -fv $(NAME)
	rm -fv $(MAIN_TEST)

re: fclean all
