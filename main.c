/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jjourdai <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/11/26 15:05:45 by jjourdai          #+#    #+#             */
/*   Updated: 2018/11/28 18:20:59 by jjourdai         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <inttypes.h>
#include "libfts.h"
#include "limits.h"
#include "unistd.h"
#include <ctype.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>

# define RED_TEXT(x) "\033[31;1m" x "\033[0m"
# define GREEN_TEXT(x) "\033[32;1m" x "\033[0m"
# define BLUE_TEXT(x) "\033[34;1m" x "\033[0m"

int64_t maxofthree(int64_t, int64_t, int64_t);

void test_is(void)
{
	printf(BLUE_TEXT("Test for ft_is*****\n"));
	for (int i = INT_MIN; i < INT_MAX; i++) {
		if (isalpha(i) != ft_isalpha(i)) {
			printf(RED_TEXT("Test Failed for ft_isalpha on number %d\n"), i);
			return ;
		}
		if (isdigit(i) != ft_isdigit(i)) {
			printf(RED_TEXT("Test Failed for ft_isdigit on number %d\n"), i);
			return ;
		}
		if (isalnum(i) != ft_isalnum(i)) {
			printf(RED_TEXT("Test Failed for ft_isalnum on number %d\n"), i);
			return ;
		}
		if (isascii(i) != ft_isascii(i)) {
			printf(RED_TEXT("Test Failed for ft_isascii on number %d\n"), i);
			return ;
		}
		if (isprint(i) != ft_isprint(i)) {
			printf(RED_TEXT("Test Failed for ft_isprint on number %d\n"), i);
			return ;
		}
		if (toupper(i) != ft_toupper(i)) {
			printf(RED_TEXT("Test Failed for ft_toupper on number %d\n"), i);
			return ;
		}
		if (tolower(i) != ft_tolower(i)) {
			printf(RED_TEXT("Test Failed for ft_toupper on number %d\n"), i);
			return ;
		}
	}
	printf(GREEN_TEXT("Test Passed for ft_is*****\n"));
}

void test_puts(void)
{
	printf(BLUE_TEXT("Test for ft_puts\n"));
	char *str = "COCORICOdwlkajdklawjdawkljd";
	if (puts(str) != ft_puts(str)) {
		printf(RED_TEXT("Test failed for ft_puts on %s\n"), str);
		return ;
	}
	if (puts(NULL) != ft_puts(NULL)) {
		printf(RED_TEXT("Test failed for ft_puts on %s\n"), NULL);
		return ;
	}
	printf(GREEN_TEXT("Test Passed for ft_puts\n"));
}

void test_bzero(void)
{
	char str0[] = "dwajhdawjdawhjdgjwahdgajhdwgdaw";
	char *str1 = strdup(str0);
	int len = strlen(str0);

	printf("%d\n", len); 	
	bzero(str0, len);
	ft_bzero(str1, len);
	write(1, str1, len);
//	puts(str1 + 1);
//	puts(str1 + 2);
}
char *get_random_data()
{
	int			fd;
	static char	buffer[512];

	if ((fd = open("/dev/random", O_RDONLY)) == -1)
		exit(fd);
	read(fd, buffer, 128);
	close(fd);
	return (buffer);
}

void test_strlen(void)
{
	char	*string;
	for (int i = 0; i < 100; i++) {
		string = get_random_data();
		//printf("%d %d\n", strlen(string), ft_strlen(string));
		if (strlen(string) != ft_strlen(string)) {
			printf("Test failed for strlen");
			break ;
		}
	}
}

void test_memcpy(void)
{
	char	*string;
	char	*buffer0 = malloc(512);
	char	*buffer1 = malloc(512);
	for (int i = 0; i < 100; i++) {
		string = get_random_data();
		memcpy(buffer0, string, strlen(string));
		ft_memcpy(buffer1, string, strlen(string));
		/*
		puts(buffer0);
		puts("=========================");
		puts(buffer1);
		*/
		if (strcmp(buffer0, buffer1) != 0) {
			printf("Test failed for memcpy\n");
			break ;
		}
	}
}

void test_memset(void)
{
	char	*string;
	char	*buffer0 = malloc(512);
	char	*buffer1 = malloc(512);
	int		value;
	for (int i = 0; i < 100; i++) {
		value = rand();
		string = get_random_data();
		memset(buffer0, value, strlen(string));
		ft_memset(buffer1, value, strlen(string));
//		puts(buffer0);
//		puts(buffer1);
		if (strcmp(buffer0, buffer1) != 0) {
			printf("Test failed for memset\n");
			break ;
		}
	}
}

int main(void)
{
/*

*/
	test_is();
	test_bzero();
	test_strlen();
	test_puts();
	test_memset();
	return (0);
}
