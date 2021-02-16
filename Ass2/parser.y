%{
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <cstring>
#include <string.h>
#include <string>
#include "scanType.h"
#include "ourgetopt.hpp"


extern int yylex();
extern FILE *yyin;
extern int yydebug;
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
%token <tokenData> LT GT MUL MAX MIN ADD DIV DO BY TO MOD RAND
%token <tokenData> AND OR NOT ASS
%start program

%type <treeNode> program declList decl
%type <treeNode> varDecl scopedVarDecl varDeclList varDeclInit varDeclId
%type <treeNode> funDecl parms parmList parmTypeList parmIdList parmId
%type <treeNode> stmt expStmt compoundStmt localDecls stmtList selectStmt iterStmt iterRange returnStmt breakStmt
%type <treeNode> exp simpleExp andExp unaryRelExp relExp minmaxExp minmaxop sumExp mulExp unaryExp factor mutable immutable call args argList
%type <tokenData> constant typeSpec relop unaryop mulop sumop

%%

/* ----- Structure ----- */
program : declList
    {
        $$ = $1;
    }

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

varDecl : typeSpec varDeclList ';'
    {
        $$ = $2;
        ((Var *)$$)->setTypeAndStatic($1->tokenString, false);
    }
    ;

scopedVarDecl : STATIC typeSpec varDeclList ';'
    {
        $$ = $3;
        ((Var *)$$)->setTypeAndStatic($2->tokenString, true);
    }
    | typeSpec varDeclList ';'
    {
        $$ = $2;
        ((Var *)$$)->setTypeAndStatic($1->tokenString, false);
    }
    ;

varDeclList : varDeclList ',' varDeclInit
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
    | varDeclId ':' simpleExp
    {
        $$ = $1;
        $$->addChild($3, 0);
    }
    ;

varDeclId : ID
    {
        $$ = new Var($1);
    }
    | ID '[' NUMCONST ']'
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

funDecl : typeSpec ID '(' parms ')' stmt
    {
        $$ = new FunDeclaration($1, $2, $4, $6);
    }
    | ID '(' parms ')' stmt
    {
        $$ = new FunDeclaration($1, $3, $5);
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

parmList : parmList ';' parmTypeList
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
        ((Par *)$$)->setType($1->tokenString);
    }
    ;

parmIdList : parmIdList ',' parmId
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
        $$ = new Par($1, false);
    }
    | ID '[' ']'
    {
        $$ = new Par($1, true);
    }
    ;

/* ----- Statements ----- */

stmt : expStmt
    {
        $$ = $1;
    }
    | compoundStmt
    {
        $$ = $1;
    }
    | selectStmt
    {
        $$ = $1;
    }
    | iterStmt
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

expStmt : exp ';'
    {
        $$ = $1;
    }
    | ';'
    {
        $$ = NULL;
    }
    ;

compoundStmt : '{' localDecls stmtList '}'
    {
        $$ = new CompoundStatement(@1.first_line, $2, $3);
    }
    ;

localDecls : localDecls scopedVarDecl
    {
        $$->append($2);
    }
    | /* empty */
    {
        $$ = new tokenNode();
    }
    ;

stmtList : stmtList stmt
    {
        $$->append($2);
    }
    | /* empty */
    {
        $$ = new tokenNode();
    }
    ;

selectStmt : IF '(' simpleExp ')' stmt
    {
        $$ = new If(@1.first_line, $3, $5);
        
    }
    | IF '(' simpleExp ')' THEN stmt ELSE stmt
    {
        $$ = new If(@1.first_line, $3, $5, $7);
    }
    ;

iterStmt : WHILE '(' simpleExp ')' DO stmt
    {
        $$ = new While(@1.first_line, $3, $5);
    }
    | FOR '(' ID IN ID ')'  iterRange DO stmt
    {
        $$ = new For(@1.first_line, $3, $5, $7);
    }
    ;

iterRange : simpleExp TO simpleExp
    {
        $$ = new Iter(@1.first_line, $1, $3);
    }
    | simpleExp TO simpleExp BY simpleExp
    {
        $$ = new Iter(@1.first_line, , $1, $3, $5);
    }
    ;

returnStmt : RETURN ';'
    {
        $$ = new Return(@1.first_line);
    }
    | RETURN exp ';'
    {
        $$ = new Return(@1.first_line, $2);
    }
    ;

breakStmt : BREAK ';'
    {
        $$ = new Break(@1.first_line);
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

sumop : ADDASS
    {
        $$ = $1;
    }
    | SUBASS
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

mulop : MULASS
    {
        $$ = $1;
    }
    | DIVASS
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
        $$ = Operation($1, $2);
    }
    | factor
    {
        $$ = $1;
    }

unaryop : SUBASS
    {
        $$ = $1;
    }
    | MULASS
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
        $$ = VarAccess($1);
    }
    | mutable '[' exp ']'
    {
        $$ = VarAccess(@2.first_line, $1, $3);
    }
    ;

immutable : '(' exp ')'
    {
        $$ = $2;
    }
    | call
    {
        $$ = $1;
    }
    | constant
    {
        $$ = Constant($1);
    }
    ;

call : ID '(' args ')'
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

argList : argList ',' exp
    {
        $$ = append($3);
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
    tree -> index = -1;
    
    int debugger = 0, printTree = 0;
    int c;
    
    while((c = getOperation(argc, argv, (char *)"dp")) != -1)
    {
        switch(C)
        {
            case 'd':
                debugger = 1;
                breakl
            case 'p':
                printTree = 1;
            case '?':
                fprintf(stderr, "usage: c- [-d] [-p] file\n");
                return -1;
        }
    }
    
    if(debugger)
    {
        yydebug = 1;
    }
    
    if(optionID < argc)
    {
        yyin = fopen(argv[optionID], "r");
        yyparse();
        fclose(yying);
    }
    else
    {
        yyparse();
    }
    
    tree->getData();
    
    if(printTree)
    {
        tree->print();
    }
    
    return 0;
        
}
