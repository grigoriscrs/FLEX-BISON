myParser: flex.l bison.y 
	bison -d bison.y
	flex flex.l
	gcc -o myparser bison.tab.c lex.yy.c -lfl

clean:
	rm -f myparser lex.yy.c bison.tab.c bison.tab.h