# Folders and Names
NAME		= libasm.a
INCLUDES	= .
SRCSDIR		= srcs
OBJSDIR		= objs
TESTER		= tests.c
TESTFILE	= test
SRCS		= ft_read.s ft_strcmp.s ft_strcpy.s ft_strdup.s ft_strlen.s \
			  ft_write.s ft_atoi_base.s

# Compiler options
ASMC		= nasm
LINKER		= ar rc
CC			= gcc
ASMFLAGS	= -fmacho64
LDFLAGS		=
CFLAGS		= -Wall -Wextra

OBJS		= $(SRCS:%.s=$(OBJSDIR)/%.o)

all: $(NAME)

$(NAME): $(OBJS)
	@$(LINKER) $(LDFLAGS) $@ $^
	@echo "Build successful!"

$(OBJSDIR)/%.o: $(SRCSDIR)/%.s
	@mkdir -p $(@D)
	@echo Compiling $<
	@$(ASMC) $(ASMFLAGS) -o $@ $<

clean:
	rm -rf $(OBJSDIR)
	rm -rf test test.dSYM test.txt

fclean: clean
	rm -rf $(NAME)

re: fclean all

run: all
	@echo "Compiling $(TESTER)"
	@$(CC) $(CFLAGS) -o $(TESTFILE) -I$(INCLUDES) $(TESTER) $(NAME)
	@echo "Running tests:"
	@./$(TESTFILE)

.PHONY: all clean fclean re run
