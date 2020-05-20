/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   useless.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: paulohl <paulohl@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/24 15:44:20 by paulohl           #+#    #+#             */
/*   Updated: 2020/05/02 14:45:20 by paulohl          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>
#include <strings.h>
#include <errno.h>
#include <fcntl.h>
#include "libasm.h"


int		main()
{
		printf("strlen tests:\n");
		printf("Original: %ld %ld %ld\n", strlen("Hello World!"), strlen(""), strlen("Weird Characters \200 	\t\n"));
		printf("Mine    : %ld %ld %ld\n", ft_strlen("Hello World!"), ft_strlen(""), ft_strlen("Weird Characters \200 	\t\n"));

		printf("\nstrcmp tests:\n");
		printf("Original: %d", strcmp("Hello World!", "Hello World!"));
		printf(" %d", strcmp("Hello World!", "Hello"));
		printf(" %d", strcmp("Hello", "Hello World!"));
		//printf(" %d", strcmp("Hello World!", NULL));		// Segfaults
		printf("\n");

		printf("Mine    : %d", ft_strcmp("Hello World!", "Hello World!"));
		printf(" %d", ft_strcmp("Hello World!", "Hello"));
		printf(" %d", ft_strcmp("Hello", "Hello World!"));
		//printf(" %d", ft_strcmp("Hello World!", NULL));		// Segfaults
		printf("\n");

		printf("\nstrcpy tests:\n");
		char good[20];
		char too_short[2];
		char empty[4];
		printf("Original: %s", strcpy(good, "Hello World!"));
		//printf(" %s", strcpy(too_short, "Hello World!"));		// Segfaults
		//printf(" %s", strcpy(empty, NULL));		// Segfaults
		printf("\n");

		char ft_good[20];
		char ft_too_short[2];
		char ft_empty[4];
		printf("Mine    : %s", ft_strcpy(ft_good, "Hello World!"));
		//printf(" %s", ft_strcpy(ft_too_short, "Hello World!"));		// Segfaults
		//printf(" %s", ft_strcpy(ft_empty, NULL));		// Segfaults
		printf("\n");


}
