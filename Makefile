# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pthuy <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/27 14:12:03 by pthuy             #+#    #+#              #
#    Updated: 2019/11/27 14:12:04 by pthuy            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fdf

PATH_SRC = ./

PATH_OBJ = ./

PATH_INC = ./libft/

CFLAGS = -Wall -Wextra -Werror

HEAD = fdf.h utils.h

SRC =	main.c \
		fdf_draw_map.c \
		fdf_give_color.c \
		fdf_init_struct.c \
		fdf_key_hook.c \
		fdf_mouse.c \
		fdf_projection.c \
		fdf_read_map.c \
		fdf_utilits.c

OBJ = $(patsubst %.c,%.o,$(addprefix $(PATH_SRC), $(SRC)))


all: $(NAME)

$(NAME): $(OBJ) $(HEAD)
	make -C libft/
	gcc $(CFLAGS) -I $(PATH_INC) -c $(SRC)
	gcc -o $(NAME) $(OBJ) -lm -L libft/ -lft -lmlx -framework OpenGL -framework AppKit

.PHONY: clean fclean

clean:
	make -C libft/ clean
	rm -rf $(OBJ)

fclean: clean
	make -C libft/ fclean
	rm -rf $(NAME)

re: fclean all
