##
## EPITECH PROJECT, 2022
## Makefile
## File description:
## Makefile for libasm.so
##

SRC        =    strlen.asm

OBJ        =    $(SRC:.asm=.o)

NAME    =    libasm.so

all:    $(OBJ)
        ld -shared -o $(NAME) $(OBJ)

%.o: %.asm
        nasm -f elf64 $< -o $@

clean:
    rm -f $(OBJ)

fclean:clean
    rm -f $(NAME)

re:    fclean all