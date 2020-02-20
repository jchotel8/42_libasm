# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jchotel <jchotel@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/27 14:21:29 by jchotel           #+#    #+#              #
#    Updated: 2020/02/19 20:22:01 by jchotel          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS		= ft_strlen.s\
			  ft_strcpy.s\
			  ft_strcmp.s\
			  ft_write.s\
			  ft_read.s\
			  ft_strdup.s
SRCS_B		= ft_atoi_base_bonus.s\
			  ft_list_size_bonus.s\
			  ft_list_push_front_bonus.s\
			  ft_list_switch.s\
			  ft_list_sort_bonus.s\
			  ft_list_remove_if_bonus.s
MAIN		= main.c
MAIN_BONUS	= main_bonus.c\
			  libasm_utils.c
OBJS		= $(SRCS:%.s=%.o)
OBJS_B		= $(SRCS:%.s=%.o) $(SRCS_B:%.s=%.o)
NAME		= libasm.a
CC			= gcc
CASM		= nasm
AR			= ar rcsu
RM			= rm -f
NFLAGS		= -f macho64

all:		${NAME}

.s.o:		
			@${CASM} ${NFLAGS} $< -o ${<:.s=.o}

$(NAME):	${OBJS}
			@${AR} $(NAME) ${OBJS}
			@echo "\033[1;32m┌─┐┬ ┬┌─┐┌─┐┌─┐┌─┐┌─┐"
			@echo "└─┐│ ││  │  ├┤ └─┐└─┐"
			@echo "└─┘└─┘└─┘└─┘└─┘└─┘└─┘"
			@echo "${NAME} generated successfully.\033[0;0m"

bonus: 		${OBJS_B}
			@${AR} $(NAME) ${OBJS_B}
			@echo "\033[1;32m┌─┐┬ ┬┌─┐┌─┐┌─┐┌─┐┌─┐"
			@echo "└─┐│ ││  │  ├┤ └─┐└─┐"
			@echo "└─┘└─┘└─┘└─┘└─┘└─┘└─┘"
			@echo "${NAME} generated successfully with bonus.\033[0;0m"

clean:
			@echo "\033[1;35mDeleting .o files..\033[0;0m"
			@${RM} ${OBJS_B}
			@${RM} ./test
			@${RM} ./test_b

fclean:		clean
			@echo "\033[1;35mDeleting binary files..\033[0;0m"
			@${RM} ${NAME}

re:			fclean all

run:		fclean
			@make ${NAME}
			@make clean
			@${CC} ${MAIN} ${NAME} -o ./test
			@echo "\033[1;34mTesting ${NAME}...\033[0;0m"
			@./test
			@echo "\033[1;34mDone testing ${NAME}...\033[0;0m"

brun:		fclean bonus clean
			@${CC} ${MAIN_BONUS} ${NAME} -o ./test_b
			@echo "\033[1;34mTesting ${NAME} with bonus...\033[0;0m"
			@./test_b
			@echo "\033[1;34mDone testing ${NAME}...\033[0;0m"

.PHONY:		all clean fclean re bonus test btest

