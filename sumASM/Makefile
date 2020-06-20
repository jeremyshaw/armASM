CC=clang
AS=as

all: sum.o
	$(CC) sum.o -o sum
clean:
	rm sum.o sum
sum.o: sum.s
	$(AS) sum.s -o sum.o
test: sum
	./sum
