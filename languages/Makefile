.PHONY: all clean

CC = gcc
CFLAGS = -Wall -O2

all: hello

hello: hello.c
	$(CC) $(CFLAGS) -o hello hello.c

clean:
	rm -f hello *.o