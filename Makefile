NAME	=	libftprintf.a
LIBFT	=	libft.a
PRINT_H	=	./includes/
LIBFT_H	= 	./libft/
SRC_DIR =	./src/
OBJ_DIR =	./obj/
LIB_DIR =	./libft/
FILE_C	=	ft_printf.c			\
			pf_struct.c			\
			pf_parse.c			\
			pf_format.c			\
			pf_display_c.c		\
			pf_display_s.c		\
			pf_display_num.c	\
			pf_display_d.c		\
			pf_display_u.c		\
			pf_display_x.c		\
			pf_display_p.c
FIND_C	=	$(FILE_C:%=$(SRC_DIR)%)
FILE_O	=	$(FILE_C:%.c=%.o)
OPTIONS = -c -Wall -Wextra -Werror -I $(PRINT_H) -I $(LIBFT_H)

all: $(NAME)

$(NAME):
	make -C $(LIB_DIR)
	cp $(LIB_DIR)$(LIBFT) $(NAME)
	gcc $(FIND_C) $(OPTIONS)
	ar rcs $(NAME) $(FILE_O)
	ranlib $(NAME)

clean:
		rm -f $(FILE_O)
		make -C $(LIB_DIR) clean

fclean: clean
		rm -f $(NAME)
		make -C $(LIB_DIR) fclean

re: fclean all

.PHONY: all clean flcean re
