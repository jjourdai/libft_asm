/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jjourdai <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/11/26 15:05:45 by jjourdai          #+#    #+#             */
/*   Updated: 2018/11/30 19:35:39 by jjourdai         ###   ########.fr       */
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
#include <sys/stat.h>
#include <sys/mman.h>

# define RED_TEXT(x) "\033[31;1m" x "\033[0m"
# define GREEN_TEXT(x) "\033[32;1m" x "\033[0m"
# define BLUE_TEXT(x) "\033[34;1m" x "\033[0m"

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
	char	*buffer;

	buffer = malloc (512);
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

	char	*test0;
	char	*test1;
	for (int i = 0; i < 100; i++) {
		string = get_random_data();
		test0 = memcpy(buffer0, string, strlen(string));
		test1 = ft_memcpy(buffer1, string, strlen(string));
		/*
		puts(buffer0);
		puts("=========================");
		puts(buffer1);
		*/
		if (strcmp(test0, test1) != 0 || strcmp(buffer0, buffer1) != 0) {
			printf("Test failed for memcpy\n");
			return ;
		}
	}
	printf("Test passed for memcpy\n");
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

void test_strcat(void)
{
	char	*string;
	char	*base;
	char	*buffer0 = malloc(1024);
	char	*buffer1 = malloc(1024);
	for (int i = 0; i < 100; i++) {
		string = get_random_data();
		base = get_random_data();
		memcpy(buffer0, base, 512);
		memcpy(buffer1, base, 512);
		puts("===================string===========================");
		puts(string);
		printf("\n%lu\n", strlen(string)); 
		strcat(buffer0, string);
		ft_strcat(buffer1, string);
		//printf("%s\n", strcat(buffer0, string));
		//printf("%s\n", ft_strcat(buffer1, string));
		//printf("%s\n", string);
		puts("=============");
		puts("--------------------base------------------");
		puts(buffer0);
		puts("===================cpy===========================");
		puts(buffer1);
		bzero(buffer0, 512);
		bzero(buffer1, 512);
		if (strcmp(buffer0, buffer1) != 0) {
			printf("Test failed for strcat on %d\n", i);
			break ;
		}
	}
}

void test_strdup(void)
{
	char	*string;
	char	*buffer0;
	char	*buffer1;
	for (int i = 0; i < 100; i++) {
		string = get_random_data();
		buffer0 = strdup(string);
		buffer1 = ft_strdup(string);
		/*
		puts("=============");
		puts("--------------------base------------------");
		puts(buffer0);
		puts("===================cpy===========================");
		puts(buffer1);
		*/
		if (strcmp(buffer0, buffer1) != 0) {
			printf("Test failed for strdup on %d\n", i);
			return ;
		}
	}
	printf("Test passed for strdup\n");
}

void test_cat(void)
{
	int fd;
	struct stat test;

	fd = open("main.c", O_RDONLY);
	//fd = open("/dev/urandom", O_RDONLY);
	fstat(fd, &test);

	printf("my cat    ->>>> %d\n", ft_cat(fd));
	perror("error ?");
	printf("%d\n", ft_cat(0));
	perror("error ?");
	printf("%d\n", ft_cat(1));
	perror("error ?");
	printf("%d\n", ft_cat(-1000));
	perror("error ?");
	printf("%d\n", ft_cat(-1));
	perror("error ?");
}

void test_strcmp(void)
{
	char	*string0 = "1221873912739812caca";
	char	*string1 = "1221873912739812cbcb";
	for (int i = 0; i < 100; i++) {
		//string0 = get_random_data();
		//string1 = get_random_data();
		puts("=============");
		puts("--------------------base------------------");
		puts(string0);
		puts("===================cpy===========================");
		puts(string1);
		printf("%d\n", ft_strcmp(string0, string1));
		if (ft_strcmp(string0, string1) != strcmp(string0, string1)) {
			printf("Test failed for strcmp on %d\n", i);
			return ;
		}
	}
	printf("Test passed for strcmp\n");
}

int main(void)
{

/*
 	test_is();
	test_bzero();
	test_strlen();
	test_puts();
	test_memset();
	test_memcpy();
	test_strdup();
	test_cat();
	test_strcat();
*/	
	test_strcmp();
	return (0);
}
