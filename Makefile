LEX = flex -B
YACC = bison -y
CC = gcc -DYYDEBUG=1

c: y.tab.o lex.yy.o
	$(CC) -o c y.tab.o lex.yy.o -ly -ll

lex.yy.o: lex.yy.c y.tab.h

y.tab.c y.tab.h: c.y
	$(YACC) -d c.y

lex.yy.c: c.l
	$(LEX) c.l

clean:
	rm -f *.o lex.yy.c y.tab.c y.tab.h c