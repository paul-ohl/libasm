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
	printf("strcmp:\t\t");
	printf("%d %d %d %d\n", strcmp("bonjour", "bonjou"), strcmp("bonjou", "bonjour"), strcmp("\200", "\0"), strcmp("\0", "\200"));
	printf("ft_strcmp:\t");
	printf("%d %d %d %d\n", ft_strcmp("bonjour", "bonjou"), ft_strcmp("bonjou", "bonjour"), ft_strcmp("\200", "\0"), ft_strcmp("\0", "\200"));
	char *pouet = ft_strdup("bonjour!!! Je suis pouet");
	printf("\nstrdup: %s\n\n", pouet);
	errno = 0;
	printf("read:\t");
	char *string = NULL;
	ft_read(30000, string, 30);
	printf("%d\n", errno);
	errno = 0;
	printf("read:\t");
	ft_write(30000, "string", 3);
	printf("%d\n", errno);
	return 0;
}
