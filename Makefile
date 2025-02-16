# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dabdygal <dabdygal@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/15 15:43:23 by dabdygal          #+#    #+#              #
#    Updated: 2023/07/15 19:07:16 by dabdygal         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# *********************************INITIALIZE********************************* #

NAME = libftprintf.a

LIBFT_NAME = libft.a

SRC_DIR = src

OBJ_DIR = src

LIBFT_DIR = libft

INCLUDE_DIR = include

CC = cc

CFLAGS = -Wall -Wextra -Werror -I $(INCLUDE_DIR)

SRC_FILES = ft_printf.c

OBJ_FILES = $(SRC_FILES:.c=.o)

# ************************************RULES*********************************** #

$(NAME): $(addprefix $(LIBFT_DIR)/,$(LIBFT_NAME)) $(addprefix $(OBJ_DIR)/,$(OBJ_FILES))
	cp $(addprefix $(LIBFT_DIR)/,$(LIBFT_NAME)) $(NAME)
	ar rcs $(NAME) $(addprefix $(OBJ_DIR)/,$(OBJ_FILES))

$(addprefix $(LIBFT_DIR)/,$(LIBFT_NAME)):
	make $(LIBFT_NAME) -C $(LIBFT_DIR)

all: $(NAME)

clean:
	rm -f $(addprefix $(OBJ_DIR)/,$(OBJ_FILES))
	make clean -C $(LIBFT_DIR)

fclean: clean
	rm -f $(NAME)
	make fclean -C $(LIBFT_DIR)

re: fclean all

.PHONY: all clean fclean re

test: $(NAME)
	cc -Wall -Werror -Wextra -fsanitize=address -I include test.c $(NAME)
	./a.out
