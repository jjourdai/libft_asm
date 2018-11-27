/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jjourdai <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/11/26 15:05:45 by jjourdai          #+#    #+#             */
/*   Updated: 2018/11/27 17:44:51 by jjourdai         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <inttypes.h>
#include "libfts.h"
#include "limits.h"
#include <ctype.h>

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

int main(void)
{
/*
	printf("%lld\n", maxofthree(1, -4, -7));
	printf("%lld\n", maxofthree(2, -6, 1));
	printf("%lld\n", maxofthree(2, 3, 1));
	printf("%lld\n", maxofthree(-2, 4, 3));
	printf("%lld\n", maxofthree(2, -6, 5));
	printf("%lld\n", maxofthree(2, 4, 6));

	test_is();
*/
	test_puts();
	return (0);
}
