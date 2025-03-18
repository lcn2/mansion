CC= cc

all: mansion-unix

mansion-unix: mansion.c
	${CC} -O3 -g --std=c17 -Wall -DUNIX mansion.c -o mansion -lm

mansion-win32: mansion.c
	${CC} -O3 -g --std=c17 -Wall mansion.c -o mansion -lm

clean:
	rm -f a.out mansion
