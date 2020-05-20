#ifndef LIBASM_H
# define LIBASM_H

#include <unistd.h>

size_t	ft_strlen(const char *str);
int		ft_strcmp(const char *str1, const char *str2);
char	*ft_strcpy(char *dst, const char *src);
char	*ft_strdup(const char *str);
size_t	ft_write(int fildes, const void *buf, size_t nbyte);
size_t	ft_read(int fildes, const void *buf, size_t nbyte);
int		ft_atoi_base(char *str, char *base);

#endif
