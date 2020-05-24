# Folders and Names
NAME		= libasm.a
INCLUDES	= .
SRCSDIR		= srcs
OBJSDIR		= objs
TESTER		= useless.c
TESTFILE	= test
SRCS		= ft_read.s ft_strcmp.s ft_strcpy.s \
				ft_strdup.s ft_strlen.s ft_write.s
SRCS_BONUS	= ft_atoi_base.s

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

OBJS		= $(SRCS:%.s=$(OBJSDIR)/%.o)
OBJS_BONUS	= $(SRCS_BONUS:%.s=$(OBJSDIR)/%.o)

all: $(NAME)

bonus: $(OBJS) $(OBJS_BONUS)
	@$(LINKER) $(LDFLAGS) $(NAME) $^
	@echo "Build successful!"

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

test: $(NAME)
	@echo "Compiling $(TESTER)"
	@$(CC) $(CFLAGS) -o $(TESTFILE) -I$(INCLUDES) $(TESTER) $<
	@echo "Running tests:"
	@./$(TESTFILE)

.PHONY: all clean fclean re test bonus
