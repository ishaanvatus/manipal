CC = gcc
CFLAGS = -Wall -Wpedantic -Wextra -lm
OFLAGS = -O3
DFLAGS = -g

# Define the source files for each program
PROGRAM1_SRCS = program1.c
PROGRAM2_SRCS = program2.c
# Add more programs as needed

# Dynamically generate a list of all source files
ALL_SRCS = $(wildcard *.c)

# Create a list of programs
PROGRAMS = $(ALL_SRCS:.c=)
# Add more programs as needed

# Define the common rules for compiling and linking
all: $(PROGRAMS)

%: %.c
	$(CC) $(CFLAGS) $(DFLAGS) $< -o $@

clean:
	rm -f $(PROGRAMS)

.PHONY: all clean
