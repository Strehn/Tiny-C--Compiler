#
# Makefile for Compiler
# Sydney Petrehn
# January 22, 2021
#

BIN = parser
CC = g++
OUT = c-
LIBS = scanType.h ourgetopt.hpp
FLAGS = -DCPLUSPLUS -g
OBJS = scanType.o ourgetopt.o

$(BIN) : lex.yy.c $(BIN).tab.c $(BIN).tab.h $(OBJS)
	$(CC) $(FLAGS) lex.yy.c $(BIN).tab.c $(OBJS) -o $(OUT)

$(BIN).tab.c $(BIN).tab.h : $(BIN).y scanType.h
	bison -v -t -d $(BIN).y

lex.yy.c : $(BIN).l $(BIN).tab.h scanType.h
	flex $(BIN).l

run :
	cat test.c- | ./$(OUT)

tar :
	tar -cvf $(BIN).tar $(BIN).y $(BIN).l scanType.h makefile

clean :
	rm $(BIN).tab.c $(BIN).tab.h lex.yy.c $(OUT) $(BIN).output
