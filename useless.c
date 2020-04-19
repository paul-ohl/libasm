/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   useless.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: paulohl <paulohl@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/24 15:44:20 by paulohl           #+#    #+#             */
/*   Updated: 2020/04/19 20:48:26 by paulohl          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <unistd.h>
#include <strings.h>
#include <fcntl.h>

size_t	ft_strlen(const char *str);
int		ft_strcmp(const char *str1, const char *str2);
char	*ft_strcpy(char *dst, const char *src);
char	*ft_strdup(const char *str);
size_t	ft_write(int fildes, const void *buf, size_t nbyte);
size_t	ft_read(int fildes, const void *buf, size_t nbyte);
int		ft_atoi_base(char *str, char *base);

int		main()
{
	printf("strcmp:\t\t");
	printf("%d %d %d %d\n", strcmp("bonjour", "bonjou"), strcmp("bonjou", "bonjour"), strcmp("\200", "\0"), strcmp("\0", "\200"));
	printf("ft_strcmp:\t");
	printf("%d %d %d %d\n", ft_strcmp("bonjour", "bonjou"), ft_strcmp("bonjou", "bonjour"), ft_strcmp("\200", "\0"), ft_strcmp("\0", "\200"));
	return 0;
}
