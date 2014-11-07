DEL=rm
CC=gcc

CFLAGS+=-fopenmp

TARGET=main

INCDIR=./inc
SRCDIR=./src
OBJDIR=./src/obj

SRCS=$(wildcard $(SRCDIR)/*.c)
OBJS=$(patsubst %.c,$(OBJDIR)/%.o,$(notdir $(SRCS)))

all: $(TARGET)
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@
$(OBJS): $(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CC) -I $(INCDIR) -c $(CFLAGS) $< -o $@
clean:
	$(DEL) -rf $(OBJDIR)/*.o
	$(DEL) -rf $(TARGET)
