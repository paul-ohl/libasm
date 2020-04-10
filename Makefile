# Folders and Names
NAME		= libasm.a
SRCSDIR		= srcs
OBJSDIR		= objs
TESTER		= useless.c

# Compiler options
ASMC		= nasm
LINKER		= ar rc
CC			= gcc
ASMFLAGS	= -fmacho64
LDFLAGS		=
CFLAGS		= -Wall -Wextra -g3

###################################################
# The rest is done by the MakeFile automatically, #
# you should not have to modify it				  #
###################################################

SRCS	= $(subst ./srcs/,,$(wildcard ./srcs/*.s))
OBJS	= $(SRCS:%.s=$(OBJSDIR)/%.o)

all: $(NAME)

$(NAME): $(OBJS)
	@$(LINKER) $@ $^
	@echo "Build successful!"

$(OBJS): $(OBJSDIR)/%.o: $(SRCSDIR)/%.s
	@mkdir -p $(@D)
	@echo Compiling $<
	@$(ASMC) $(ASMFLAGS) -o $@ $<

clean:
	rm -rf $(OBJSDIR)
	rm -rf test test.dSYM

fclean: clean
	rm -rf $(NAME)

re: fclean all

test: $(NAME)
	@echo "Compiling $(TESTER)"
	@$(CC) $(CFLAGS) -o test $(TESTER) $<
	@echo "Running tests:"
	@./test

.PHONY: all clean fclean re test
