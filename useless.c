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
#include <stdlib.h>
#include <unistd.h>
#include <strings.h>
#include <errno.h>
#include <fcntl.h>
#include "libasm.h"

void	test_strcmp(char *str1, char *str2)
{
		printf("Original: %i\n", strcmp(str1, str2));
		printf("Mine    : %i\n", ft_strcmp(str1, str2));
}

int		main()
{
		printf("strlen tests:\n");
		printf("Original: %ld %ld %ld\n", strlen("Hello World!"), strlen(""), strlen("Weird Characters \200 	\t\n"));
		printf("Mine    : %ld %ld %ld\n", ft_strlen("Hello World!"), ft_strlen(""), ft_strlen("Weird Characters \200 	\t\n"));

		printf("\nstrcmp tests:\n");
		test_strcmp("Hello World!", "Hello World!");
		test_strcmp("Hello World!", "Hello");
		test_strcmp("Hello", "Hello World!");
		test_strcmp("\150", "\40");
		test_strcmp("\xff\xff", "\xff");
		printf("Original: %i\n", strcmp("\xff\xff", "\xff"));
		// test_strcmp("Hello World!", NULL));		// Segfaults
		printf("\n");

		printf("\nstrcpy tests:\n");
		char good[20];
		printf("Original: %s", strcpy(good, "Hello World!"));
		//char too_short[2];
		//printf(" %s", strcpy(too_short, "Hello World!"));		// Segfaults
		//char empty[4];
		//printf(" %s", strcpy(empty, NULL));		// Segfaults
		printf("\n");

		char ft_good[20];
		printf("Mine    : %s", ft_strcpy(ft_good, "Hello World!"));
		//char ft_too_short[2];
		//printf(" %s", ft_strcpy(ft_too_short, "Hello World!"));		// Segfaults
		//char ft_empty[4];
		//printf(" %s", ft_strcpy(ft_empty, NULL));		// Segfaults
		printf("\n");

		printf("\nstrdup:\n");
		printf("Original: %s\n", strdup("Hello World!"));
		printf("Mine    : %s\n", ft_strdup("Hello World!"));
		printf("Original: %s\n", strdup(""));
		printf("Mine    : %s\n", ft_strdup(""));

		printf("\nwrite:\n");
		errno = 0;
		printf(" => Original, stdout: %zd ; errno: %d\n", write(1, "bonjour", 7), errno);
		errno = 0;
		printf(" => Mine    , stdout: %zd ; errno: %d\n", ft_write(1, "bonjour", 7), errno);
		int fd = open("test.txt", O_CREAT | O_WRONLY, S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH);
		errno = 0;
		printf("open: fd: %d, errno: %d\n", fd, errno);
		errno = 0;
		printf("Mine on file: %zd ; errno: %d\n", ft_write(fd, "bonjour", 7), errno);
		errno = 0;
		printf("Original, error: %zd ; errno: %d\n", write(-1, "bonjour", 7), errno);
		errno = 0;
		printf("Mine    , error: %zd ; errno: %d\n", ft_write(-1, "bonjour", 7), errno);
		close(fd);

		puts("\nread:");
		char content[8];
		content[7] = 0;
		fd = open("test.txt", O_RDONLY);
		errno = 42;
		puts("setting errno = 42");
		printf("Mine: %zd ; errno: %d => content: ", read(fd, content, 7), errno);
		printf("%s\n", content);
		close(fd);

		printf("\nft_atoi_base:\n");
		printf("base hexa: \"ff\" => %d\n", ft_atoi_base("ff", "0123456789abcdef"));
		printf("Invalid characters: \"wx\" => %d\n", ft_atoi_base("wx", "0123456789abcdef"));
		printf("base with doubles (825b94fbalf) => %d\n", ft_atoi_base("bb", "825b94fbalf"));
}
