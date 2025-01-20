CC = gcc
CFLAGS = -Wall -Wpedantic -Wextra -g

SRCS = lexer.c main.c
OBJS = $(SRCS:.c=.o)

TARGET = main

all: $(TARGET)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET)

clean:
	rm -f $(OBJS) 
