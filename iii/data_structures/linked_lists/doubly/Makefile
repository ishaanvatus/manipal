CC = gcc
CFLAGS = -Wall -Wpedantic -Wextra
OFLAGS = -O3
DFLAGS = -g

SRCS = ll.c main.c
OBJS = $(SRCS:.c=.o)

TARGET = main

all: $(TARGET)

%.o: %.c
	$(CC) $(CFLAGS) $(DFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(DFLAGS) $(OFLAGS) $(OBJS) -o $(TARGET)
	rm -f $(OBJS) 
