##
## EPITECH PROJECT, 2018
## CPool_Day13_2018
## File description:
## Makefile library of today's task
##

SRC	=	*.c

OBJ	=	$(SRC:.c=.o)

LIBNAME	=	libbtree.a

all: c_to_o compile

c_to_o: $(OBJ)

compile:
	ar rc $(LIBNAME) $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(LIBNAME)

re: fclean all
