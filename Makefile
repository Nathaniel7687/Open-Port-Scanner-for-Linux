DEL=rm
CC=gcc

CFLAGS+=-fopenmp

TARGET=main

INCDIR=./
SRCDIR=./
OBJDIR=./obj

SRCS=$(wildcard $(SRCDIR)/*.c)
OBJS=$(patsubst %.c,$(OBJDIR)/%.o,$(notdir $(SRCS)))

all: $(TARGET)
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@
$(OBJS): $(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CC) -I $(INCDIR) -c $(CFLAGS) $< -o $@
clean:
	$(DEL) -rf $(OBJDIR)
	$(DEL) -rf $(TARGET)
