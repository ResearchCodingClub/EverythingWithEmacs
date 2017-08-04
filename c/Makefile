CC = gcc

SOURCE = main.c say.c
OBJECTS = $(SOURCE:.c=.o)

CFLAGS = -I. -g -O0

all: $(OBJECTS)
	$(CC) $(CFLAGS) -o hello $^

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o $@

.PHONY: clean tags

clean:
	rm -rf ./*.o ./hello

tags: TAGS

TAGS:
	etags *.c *.h
