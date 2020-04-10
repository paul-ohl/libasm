/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   useless.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: paulohl <paulohl@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/24 15:44:20 by paulohl           #+#    #+#             */
/*   Updated: 2020/04/08 12:43:06 by paulohl          ###   ########.fr       */
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
	printf("ft_atoi_base:\n");
	printf("%d => \"bite\"; \"abjegiflktsm\"\n", ft_atoi_base("bite", "abjegiflktsm"));
	printf("%d => \"jw\"; \"abcdefghij\"\n", ft_atoi_base("jw", "abcdefghij"));
	printf("%d => \"be\"; \"abcd+efghij\"\n", ft_atoi_base("be", "abcd+efghij"));
	printf("%d => \"be\"; \"ab-cdefghij\"\n", ft_atoi_base("be", "ab-cdefghij"));
	printf("%d => \"be\"; \"abcdefgh ij\"\n", ft_atoi_base("be", "abcdefgh ij"));
	printf("%d => \"be\"; \"abcdaefghij\"\n", ft_atoi_base("be", "abcdaefghij"));
	printf("%d => \"nul\"; \"n\"\n", ft_atoi_base("nul", "n"));
	printf("%d => \"lol\"; \"\"\n", ft_atoi_base("lol", ""));
	printf("%d => \"oupsie\"; NULL\n", ft_atoi_base("oupsie", NULL));
	return 0;
}
