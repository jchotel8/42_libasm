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

t_list    *ft_lstnew(void *data)
{
    t_list *new;
    
    if (!(new = (t_list *)malloc(sizeof(t_list))))
        return (0);
    new->data = data;
    new->next = 0;
    return (new);
}

t_list    *ft_lstlast(t_list *lst)
{
    t_list    *last;
    
    if (!lst)
        return (NULL);
    last = lst;
    while (last->next)
        last = last->next;
    return (last);
}

void    ft_lstadd_back(t_list **alst, t_list *new)
{
    t_list *last;
    
    last = 0;
    if (!alst || !new)
        return ;
    if (alst && !*alst)
        *alst = new;
    else
    {
        last = ft_lstlast(*alst);
        last->next = new;
    }
}

void    ft_print_list(t_list *ptr)
{
    int i = 1;
    
    if (ptr)
    {
        printf("[%d] : %d\n", i, (int)ptr->data);
        while(ptr->next)
        {
            ptr = ptr->next;
            i++;
            printf("[%d] : %d\n", i, (int)ptr->data);
        }
    }
}

t_list    *ft_lstcrea(int i, ...)
{
    va_list va;
    t_list *first = NULL;
    
    va_start(va, i);
    while (i-- > 0)
    {
        ft_lstadd_back(&first, ft_lstnew(va_arg(va, void *)));
    }
    va_end(va);
    return (first);
}

char *ft_strnew(int size, char c)
{
	char *new;

	new = malloc(sizeof(char) * (size + 1));
	new[size] = '\0';
	while (size--)
		new[size] = c;
	return (new);
}

int cmp_min(void *a, void *b)
{
    return (a < b ? 1 : 0);
}
