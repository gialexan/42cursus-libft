# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gialexan <gialexan@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/10 15:43:13 by gialexan          #+#    #+#              #
#    Updated: 2023/09/05 13:39:09 by gialexan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################################################
##                                LIBFT                                       ##
################################################################################

RESET := \033[0m
CYAN  := \033[1;36m
CHECK := \342\234\224
LOG   := printf "[$(CYAN)$(CHECK)$(RESET)] %s\n"

NAME  := libft.a

################################################################################
##                                DIRECTORIES                                 ##
################################################################################

OBJ_DIR := obj
HEADERS := libft.h

SRC_FILES := ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c
SRC_FILES += ft_itoa.c ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memset.c ft_split.c ft_strchr.c ft_strdup.c ft_strjoin.c
SRC_FILES += ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_substr.c ft_tolower.c ft_toupper.c
SRC_FILES += ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_memmove.c ft_strlcat.c ft_strtrim.c

BONUS_FILES := ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c
BONUS_FILES += ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c

OBJS := $(addprefix $(OBJ_DIR)/, $(SRC_FILES:.c=.o))
OBJS_BONUS := $(addprefix $(OBJ_DIR)/, $(BONUS_FILES:.c=.o))

################################################################################
##                                 COMPILATION                                ##
################################################################################

CFLAGS  := -Wall -Werror -Wextra

all: $(NAME)

# $@ -> variável automática para NAME da regra.
# $^ -> variável automática para o todos elementos da lista de requisitos.
# $< -> variável automática para somente o primeiro elemento da lista de requisitos.
# | -> significa para colocar prioridade na compilação, no caso abaixo primeiro a libft e mlx depois o restante

$(NAME): $(OBJS)
	@$(LOG) "Building $@"
	@$(AR) rcs $(NAME) $^

bonus: $(OBJS) $(OBJS_BONUS)
	@$(LOG) "Building $(NAME) $@"
	@$(AR) rcs $(NAME) $^

$(OBJ_DIR)/%.o: %.c $(HEADERS) | $(OBJ_DIR)
	@$(LOG) "Compiling $(notdir $<)"
	@$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	@$(LOG) "Creating objects directory"
	@mkdir $@

clean:
	@$(RM) -r $(OBJS)
	@$(LOG) "Removing objects"
	@$(RM) -r $(OBJ_DIR)
	@$(LOG) "Removing objects directory"

fclean: clean
	@$(RM) -r $(NAME)
	@$(LOG) "Removing $(NAME)"

re: clean all

.PHONY: all clean fclean re