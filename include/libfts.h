/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libfts.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jjourdai <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/11/26 14:58:51 by jjourdai          #+#    #+#             */
/*   Updated: 2018/11/30 18:15:40 by jjourdai         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFTS_H
# define LIBFTS_H

int		ft_isalpha(int c);
int		ft_isdigit(int c);
int		ft_isalnum(int c);
int		ft_isascii(int c);
int		ft_isprint(int c);
int		ft_toupper(int c);
int		ft_tolower(int c);
int		ft_puts(const char *s);

void	ft_bzero(void *s, size_t n);
size_t	ft_strlen(const char *str);
void	*ft_memset(void *b, int c, size_t len);
void	*ft_memcpy(void *restrict dst, const void *restrict src, size_t n);

char	*ft_strdup(const char *s1);
char	*ft_strcat(char *restrict s1, const char *restrict s2);
int		ft_cat_mmap(int fd);

int		ft_cat(int fd);

int		ft_strcmp(const char *s1, const char *s2);

#endif
