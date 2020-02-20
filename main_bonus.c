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

typedef struct      s_list
{
    void            *data;
    struct s_list   *next;
}                   t_list;

size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
int		ft_write(int fd, char *str, int size);
size_t	ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(char *str);
int		ft_atoi_base(char *str, char *base);
int     ft_list_size(t_list *list);
void    ft_list_push_front(t_list **begin_list, void *data);
void    ft_list_switch(t_list **lst1, t_list **lst2);
void    ft_list_sort(t_list **begin_list, int (*cmp)());
void    ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());
t_list  *ft_lstnew(void *data);
t_list  *ft_lstlast(t_list *lst);
void    ft_lstadd_back(t_list **alst, t_list *new);
void    ft_print_list(t_list *ptr);
t_list  *ft_lstcrea(int i, ...);
char    *ft_strnew(int size, char c);
int     cmp_min(void *a, void *b);

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
    
    printf("\n");
    printf("*-----------------------------*\n");
    printf("|            BONUS            |\n");
    printf("*-----------------------------*\n");
    //TEST ATOI BASE
    printf("..........FT_ATOI_BASE.........\n");
    char *base = "012+456789";
    char *base2 = "0123456789abcdef";
    printf("error base + :\t\t%d\n", ft_atoi_base("2a", base));
    printf(" -2azx = -42 :\t\t%d\n", ft_atoi_base(" -2azx", base2));
    //TEST LIST SIZE
    printf("..........FT_LIST_SIZE.........\n");
    int a = 1;
    int b = 2;
    int c = 5;
    int d = 8;
    int e = 3;
    int f = 5;
    int g = 6;
    int h = 7;
    int i = 4;
    t_list *ptr = ft_lstcrea(8, b, c, d, e, f, g, h, i);
    printf("size         :\t\t%d\n", ft_list_size(ptr));
    //TEST LIST PUSH FRONT
    printf(".......FT_LIST_PUSH_FRONT......\n");
    printf("pushing front %d\n", a);
    printf("list before :\n");
    ft_print_list(ptr);
    printf("list after  :\n");
    ft_list_push_front(&ptr, a);
    ft_print_list(ptr);
    //TEST LIST SWITCH
    printf(".........FT_LIST_SWITCH........\n");
    printf("switch 1st with 3rd\n");
    ft_list_switch(&ptr, &ptr->next->next);
    ft_print_list(ptr);
    //TEST REMOVE IF
    printf(".......FT_LIST_REMOVE_IF......\n");
    printf("removing if greater than %d\n", c);
    ft_list_remove_if(&ptr, &c, &cmp_min);
    ft_print_list(ptr);
    //TEST LIST ORDER
    printf(".........FT_LIST_ORDER........\n");
    ft_list_sort(&ptr, &cmp_min);
    ft_print_list(ptr);

	return(0);
}
