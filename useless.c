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
		printf("Original: %d %d %d\n", strlen("Hello World!"), strlen(""), strlen("Weird Characters \200 	\t\n"));
		printf("Mine    : %d %d %d\n", ft_strlen("Hello World!"), ft_strlen(""), ft_strlen("Weird Characters \200 	\t\n"));

		printf("strcmp tests:\n");
		printf("Original: %d %d %d %d\n", strcmp("Hello World!", "Hello World!"), strcmp("Hello World!", "Hello"), strcmp("Hello", "Hello World!"), strcmp("Hello World!", NULL));
		printf("Mine    : %d %d %d %d\n", ft_strcmp("Hello World!", "Hello World!"), ft_strcmp("Hello World!", "Hello"), ft_strcmp("Hello", "Hello World!"), ft_strcmp("Hello World!", NULL));

		printf("ft_strcpy tests:\n");

}
