#
# Makefile for Compiler
# Sydney Petrehn
# March 31, 2021
#

BIN = parser
CC = g++
OUT = c-
LIBS = ourgetopt.h TreeUtils.hpp scanType.h Semantic.hpp yyerror.hpp
FLAGS = -DCPLUSPLUS -g
OBJS = ourgetopt.o TreeUtils.o Semantic.o yyerror.o

$(BIN) : lex.yy.c $(BIN).tab.c $(BIN).tab.h $(LIBS) $(OBJS)
	$(CC) $(FLAGS) lex.yy.c $(BIN).tab.c $(OBJS) -o $(OUT)

$(BIN).tab.c $(BIN).tab.h : $(BIN).y $(LIBS)
	bison -v -t -d $(BIN).y

lex.yy.c : $(BIN).l $(BIN).tab.h scanType.h
	flex $(BIN).l

%.o: %.c $(LIBS)
	$(CC) $(FLAGS) -c $<

tar :
	tar -cvf $(BIN).tar $(BIN).y $(BIN).l makefile *.cpp *.h

clean :
	rm $(BIN).tab.c $(BIN).tab.h lex.yy.c $(OUT) $(BIN).output *.o
