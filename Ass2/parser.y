%{
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <iostream>
#include <cstring>
#include <string.h>
#include <string>
#include "scanType.h"
#include "ourgetopt.hpp"
#include "parser.tab.h"


extern int yylex();
extern FILE *yyin;
extern char *yytext;
extern int yylineno;

void yyerror(const char *msg) {
    printf("Error: %s while parsing `%s` on line %d.\n", msg, yytext, yylineno);
}

treeNode *tree;
%}

%locations

%union
{
    TokenData *tokenData;
    treeNode *treeNode;
    
}

%token <tokenData> BOOLCONST NUMCONST CHARCONST STRINGCONST ID THEN
%token <tokenData> IF WHILE FOR STATIC INT BOOL CHAR IN ELSE RETURN BREAK COMMENT
%token <tokenData> SYMBOL EQ ADDASS SUBASS DIVASS MULASS LEQ GEQ NEQ DEC INC
%token <tokenData> LT GT MUL MAX MIN ADD DIV DO BY TO MOD RAND SUB
%token <tokenData> AND OR NOT ASS SEMICOLON COLON LP RP LB RB COMMA LCB RCB
%start declList

%type <treeNode> declList decl
%type <treeNode> varDecl scopedVarDecl varDeclList varDeclInit varDeclId
%type <treeNode> funDecl parms parmList parmTypeList parmIdList parmId
%type <treeNode> stmt expStmt compoundStmt localDecls stmtList returnStmt breakStmt
%type <treeNode> matched unmatched matchedselectStmt unmatchedselectStmt matchediterStmt unmatchediterStmt
%type <treeNode> exp simpleExp andExp unaryRelExp relExp minmaxExp sumExp mulExp unaryExp factor mutable iterrange immutable call args argList
%type <tokenData> constant typeSpec relop unaryop mulop sumop minmaxop

%%

/* ----- Structure ----- */
declList : declList decl
    {
        tree->append($2);
    }
    | decl
    {
        tree->append($1);
        $1->setFirst();
    }
    ;

decl : varDecl
    {
        $$ = $1;
    }
    | funDecl
    {
        $$ = $1;
    }
    ;

/* ----- Variables ----- */

varDecl : typeSpec varDeclList SEMICOLON
    {
        $$ = $2;
        ((Var *)$$)->setTypeAndStatic($1->tokenstr, false);
    }
    ;

scopedVarDecl : STATIC typeSpec varDeclList SEMICOLON
    {
        $$ = $3;
        ((Var *)$$)->setTypeAndStatic($2->tokenstr, true);
    }
    | typeSpec varDeclList SEMICOLON
    {
        $$ = $2;
        ((Var *)$$)->setTypeAndStatic($1->tokenstr, false);
    }
    ;

varDeclList : varDeclList COMMA varDeclInit
    {
        $$->append($3);
    }
    | varDeclInit
    {
        $$ = $1;
    };

varDeclInit : varDeclId
    {
        $$ = $1;
    }
    | varDeclId COLON simpleExp
    {
        $$ = $1;
        $$->addChild($3, 0);
    }
    ;

varDeclId : ID
    {
        $$ = new Var($1);
    }
    | ID LB NUMCONST RB
    {
        $$ = new Var($1, $3);
    }
    ;

typeSpec : INT
    {
        $$ = $1;
    }
    | BOOL
    {
        $$ = $1;
    }
    | CHAR
    {
        $$ = $1;
    }
    ;

/* ----- Functions ----- */

funDecl : typeSpec ID LP parms RP stmt
    {
        $$ = new FunDecl($1, $2, $4, $6);
    }
    | ID LP parms RP stmt
    {
        $$ = new FunDecl($1, $3, $5);
    }
    ;

parms : parmList
    {
        $$ = $1;
    }
    | /* empty */
    {
        $$ = NULL;
    }
    ;

parmList : parmList SEMICOLON parmTypeList
    {
        $$->append($3);
    }
    | parmTypeList
    {
        $$ = $1;
    }
    ;

parmTypeList : typeSpec parmIdList
    {
        $$ = $2;
        ((Parm *)$$)->setType($1->tokenstr);
    }
    ;

parmIdList : parmIdList COMMA parmId
    {
        $$->append($3);
    }
    | parmId
    {
        $$ = $1;
    }
    ;

parmId : ID
    {
        $$ = new Parm($1, false);
    }
    | ID LB RB
    {
        $$ = new Parm($1, true);
    }
    ;

/* ----- Statements ----- */
// Need to break up into Yes and Nos since loops are either matched or unmatched
//If there is an If ELSE that is matched if is unmatched. While DO is matched otherwise unmatched.
// shift reduce error

stmt :  matched
    {
        $$ = $1;
    }
    | unmatched
    {
        $$ = $1;
    }
    ;

matched : expStmt
    {
        $$ = $1;
    }
    | compoundStmt
    {
        $$ = $1;
    }
    | matchedselectStmt
    {
        $$ = $1;
    }
    | matchediterStmt
    {
        $$ = $1;
    }
    | returnStmt
    {
        $$ = $1;
    }
    | breakStmt
    {
        $$ = $1;
    }
    ;

unmatched : unmatchedselectStmt
    {
        $$ = $1;
    }
    | unmatchediterStmt
    {
        $$ = $1;
    }
    ;

expStmt : exp SEMICOLON
    {
        $$ = $1;
    }
    | SEMICOLON
    {
        $$ = NULL;
    }
    ;

compoundStmt : LCB localDecls stmtList RCB
    {
        $$ = new CompoundStatement(yylineno, $2, $3);
    }
    ;

localDecls : localDecls scopedVarDecl
    {
        $$->append($2);
    }
    | /* empty */
    {
        $$ = new treeNode();
    }
    ;

stmtList : stmtList stmt
    {
        $$->append($2);
    }
    | /* empty */
    {
        $$ = new treeNode();
    }
    ;

matchedselectStmt : IF simpleExp THEN matched ELSE matched
    {
        $$ = new If(yylineno, $2, $4, $6);
        
    }
    ;

unmatchedselectStmt : IF simpleExp THEN stmt
    {
        $$ = new If(yylineno, $2, $4);
    
    }
    | IF simpleExp THEN matched ELSE unmatched
    {
        $$ = new If(yylineno, $2, $4, $6);
    }
    ;

matchediterStmt : WHILE simpleExp DO matched
    {
        $$ = new WHILe(yylineno, $2, $4);
    }
    | FOR ID ASS iterrange DO matched
    {
        $$ = new For(yylineno, $2, $4, $6);
    }
    ;

unmatchediterStmt : WHILE simpleExp DO unmatched
    {
        $$ = new WHILe(yylineno, $2, $4);
    }
    | FOR ID ASS iterrange DO unmatched
    {
        $$ = new For(yylineno, $2, $4, $6);
    }
    ;

iterrange : simpleExp TO simpleExp
    {
        $$ = new Range(yylineno, $1, $3);
    }
    ;
    | simpleExp TO simpleExp BY simpleExp
    {
        $$ = new Range(yylineno, $1, $3, $5);
    }
    ;

returnStmt : RETURN SEMICOLON
    {
        $$ = new Return(yylineno);
    }
    | RETURN exp SEMICOLON
    {
        $$ = new Return(yylineno, $2);
    }
    ;

breakStmt : BREAK SEMICOLON
    {
        $$ = new Break(yylineno);
    }
    ;

/* ----- expressions ----- */

exp : mutable ASS exp
    {
        $$ = new Operation($2, $1, $3);
    }
    | mutable ADDASS exp
    {
        $$ = new Operation($2, $1, $3);
    }
    | mutable SUBASS exp
    {
        $$ = new Operation($2, $1, $3);
    }
    | mutable MULASS exp
    {
        $$ = new Operation($2, $1, $3);
    }
    | mutable DIVASS exp
    {
        $$ = new Operation($2, $1, $3);
    }
    | mutable INC
    {
        $$ = new Operation($2, $1);
    }
    | mutable DEC
    {
        $$ = new Operation($2, $1);
    }
    | simpleExp
    {
        $$ = $1;
    }
    ;

simpleExp : simpleExp OR andExp
    {
        $$ = new LogicExpression($2, $1, $3);
    }
    | andExp
    {
        $$ = $1;
    }
    ;

andExp : andExp AND unaryRelExp
    {
        $$ = new LogicExpression($2, $1, $3);
    }
    | unaryRelExp
    {
        $$ = $1;
    }
    ;

unaryRelExp : NOT unaryRelExp
    {
        $$ = new LogicExpression($1, $2);
    }
    | relExp
    {
        $$ = $1;
    }
    ;

relExp : minmaxExp relop minmaxExp
    {
        $$ = new Relation($2, $1, $3);
    }
    | minmaxExp
    {
        $$ = $1
    }
    ;

relop : LEQ
    {
        $$ = $1;
    }
    | LT
    {
        $$ = $1;
    }
    | GT
    {
        $$ = $1;
    }
    | GEQ
    {
        $$ = $1;
    }
    | EQ
    {
        $$ = $1;
    }
    | NEQ
    {
        $$ = $1;
    }
    ;

minmaxExp : minmaxExp minmaxop sumExp
    {
        $$ = new Operation($2, $1, $3);
    }
    | sumExp
    {
        $$ = $1;
    }
    ;

minmaxop : MIN
    {
        $$ = $1;
    }
    | MAX
    {
        $$ = $1;
    }
    ;

sumExp : sumExp sumop mulExp
    {
        $$ = new Operation($2, $1, $3);
    }
    | mulExp
    {
        $$ = $1;
    }

sumop : ADD
    {
        $$ = $1;
    }
    | SUB
    {
        $$ = $1;
    }
    ;

mulExp : mulExp mulop unaryExp
    {
        $$ = new Operation($2, $1, $3);
    }
    | unaryExp
    {
        $$ = $1;
    }
    ;

mulop : MUL
    {
        $$ = $1;
    }
    | DIV
    {
        $$ = $1;
    }
    | MOD
    {
        $$ = $1;
    }
    ;

unaryExp : unaryop unaryExp
    {
        $$ = new Operation($1, $2);
    }
    | factor
    {
        $$ = $1;
    }

unaryop : SUB
    {
        $$ = $1;
    }
    | MUL
    {
        $$ = $1;
    }
    | RAND
    {
        $$ = $1;
    }
    ;

factor : immutable
    {
        $$ = $1;
    }
    | mutable
    {
        $$ = $1;
    }
    ;

mutable : ID
    {
        $$ = new VarAccess($1);
    }
    | mutable LB exp RB
    {
        $$ = new VarAccess(yylineno, $1, $3);
    }
    ;

immutable : LP exp RP
    {
        $$ = $2;
    }
    | call
    {
        $$ = $1;
    }
    | constant
    {
        $$ = new Constant($1);
    }
    ;

call : ID LP args RP
    {
        $$ = new Call($1, $3);
    }
    ;

args : argList
    {
        $$ = $1;
    }
    | // empty
    {
        $$ = NULL;
    }
    ;

argList : argList COMMA exp
    {
        $$->append($3);
    }
    | exp
    {
        $$ = $1;
    }
    ;

constant :  NUMCONST
    {
        $$ = $1;
    }
    | CHARCONST
    {
        $$ = $1;
    }
    |STRINGCONST
    {
        $$ = $1;
    }
    |BOOLCONST
    {
        $$ = $1;
    }
    ;

%%


int main(int argc, char *argv[])
{
    tree = new treeNode();
    tree->index = -1;
    
    int d = 0, p = 0;
    int c;
    
    while((c = ourGetopt(argc, argv, (char *)"dp")) != -1)
    {
        switch(c)
        {
            case 'd':
                d = 1;
                break;
            case 'p':
                p = 1;
                break;
            case '?':
                fprintf(stderr, "usage: c- [-d] [-p] file\n");
                return -1;
        }
    }
    
    if(d == 1)
    {
        yydebug = 1;
    }
    
    if(optind < argc)
    {
        yyin = fopen(argv[optind], "r");
        yyparse();
        fclose(yyin);
    }
    else
    {
        yyparse();
    }
    
    tree->getData();
    
    if(p == 1)
    {
        tree->printTree();
    }
    
    return 0;
        
}
