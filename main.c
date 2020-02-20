/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jchotel <jchotel@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/02/11 15:31:56 by jchotel           #+#    #+#             */
/*   Updated: 2020/02/18 20:44:47 by jchotel          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libc.h>

size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
int		ft_write(int fd, char *str, int size);
size_t	ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(char *str);

char *ft_strnew(int size, char c)
{
	char *new;

	new = malloc(sizeof(char) * (size + 1));
	new[size] = '\0';
	while (size--)
		new[size] = c;
	return (new);
}

int main(int ac, char **av)
{
    printf("*-----------------------------*\n");
    printf("|            LIBASM           |\n");
    printf("*-----------------------------*\n");
    //TEST STRLEN
	int j1 = ft_strlen("salut");
	int j2 = strlen("salut");
	printf("ft_strlen : %d\t\tstrlen : %d\n", j1, j2);
	//TEST STRCPY
	char *src = ft_strnew(4, 'A');
	char *dest1 = ft_strnew(12, '1');
	char *dest2 = ft_strnew(12, '1');
	printf("ft_strcpy : %s\tstrcpy : %s\n", ft_strcpy(dest1, src), strcpy(dest2, src));
	free(src);
	free(dest1);
	free(dest2);
    //TEST STRCMP
	char *mot1 = "salut\x01 ca va";
	char *mot2 = "salut\xff ca va";
	printf("ft_strcmp : %d\tstrcmp : %d\n", ft_strcmp(mot1, mot2), strcmp(mot1, mot2));
    //printf("ft_strcmp : %d\tstrcmp : %d\n", ft_strcmp("salut", "saluts"), strcmp("salut", "saluts"));
	//TEST WRITE
	ft_write(2, "ft_write  : test\t", 18);
	write(2, "write  : test\n", 14);
    //TEST READ
	int fd1 = open("main.c", O_RDONLY);
	char *buf1 = ft_strnew(6, '\0');
	char *buf2 = ft_strnew(6, '\0');
	j1 = ft_read(fd1, buf1, 5);
	close(fd1);
	fd1 = open("main.c", O_RDONLY);
	j2 = read(fd1, buf2, 5);
	printf("ft_read : [%d] %s\tread : [%d] %s\n", j1, buf1, j2, buf2);
	free(buf1);
	free(buf2);
    //TEST STRDUP
	char *mot3 = ft_strdup("salut");
	char *mot4 = ft_strdup("salut");
	printf("ft_strdup : %s\tstrdup : %s\n", mot3, mot4);
	free(mot3);
	free(mot4);
    
	return(0);
}
