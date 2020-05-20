# Folders and Names
NAME		= libasm.a
INCLUDES	= .
SRCSDIR		= srcs
OBJSDIR		= objs
TESTER		= useless.c
TESTFILE	= test
SRCS		= ft_atoi_base.s ft_read.s ft_strcmp.s ft_strcpy.s \
				ft_strdup.s ft_strlen.s ft_write.s

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

OBJS	= $(SRCS:%.s=$(OBJSDIR)/%.o)

all: $(NAME)

$(NAME): $(OBJS)
	@$(LINKER) $(LDFLAGS) $@ $^
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
	@$(CC) $(CFLAGS) -o $(TESTFILE) -I$(INCLUDES) $(TESTER) $<
	@echo "Running tests:"
	@./$(TESTFILE)

.PHONY: all clean fclean re test
