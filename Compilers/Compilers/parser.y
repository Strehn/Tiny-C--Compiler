%{
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <cstring>
#include <string.h>
#include <string>
#include "scanType.h"


extern int yylex();
extern FILE *yyin;
extern int yydebug;

void yyerror(const char *msg) {
    printf("Error while parsing: %s\n", msg);
}

%}

%union {
    TokenData *tokenData;
    
}

%token <tokenData> BOOLCONST NUMCONST CHARCONST STRINGCONST ID
%token <tokenData> IF WHILE FOR STATIC INT BOOL CHAR IN ELSE RETURN BREAK COMMENT
%token <tokenData> SYMBOL EQ ADDASS SUBASS DIVASS MULASS LEQ GEQ NEQ DEC INC
%token <tokenData> LT GT MUL ADDTO SUBTO MULTO DIVTO MAX MIN ADD DIV THEN DO BY
%token <tokenData> TO AND OR NOT
%start tokenlist

%%
tokenlist     : token
              | tokenlist token
              ;

token : BOOLCONST         { printf("Line %d Token: BOOLCONST Value: %d  Input: %s\n", $1->linenum, $1->nvalue, $1->tokenstr); }
      | NUMCONST          { printf("Line %d Token: NUMCONST Value: %d  Input: %s\n", $1->linenum, $1->nvalue, $1->tokenstr); }
      | CHARCONST         { printf("Line %d Token: CHARCONST Value: '%c' Input: %s\n", $1->linenum, $1->cvalue, $1->tokenstr); }
| STRINGCONST       { printf("Line %d Token: STRINGCONST Value: %s Len: %d Input: %s\n", $1->linenum, $1->svalue, $1->strlen, $1->tokenstr); }
      | ID                { printf("Line %d Token: ID Value: %s\n", $1->linenum, $1->tokenstr); }
      | IF                { printf("Line %d Token: IF\n", $1->linenum); }
      | WHILE             { printf("Line %d Token: WHILE\n", $1->linenum); }
      | DEC               { printf("Line %d Token: DEC\n", $1->linenum); }
      | INC               { printf("Line %d Token: INC\n", $1->linenum); }
      | FOR               { printf("Line %d Token: FOR\n", $1->linenum); }
      | STATIC            { printf("Line %d Token: STATIC\n", $1->linenum); }
      | ADDASS            { printf("Line %d Token: ADDASS\n", $1->linenum); }
      | SUBASS            { printf("Line %d Token: SUBASS\n", $1->linenum); }
      | DIVASS            { printf("Line %d Token: DIVASS\n", $1->linenum); }
      | MULASS            { printf("Line %d Token: MULASS\n", $1->linenum); }
      | INT               { printf("Line %d Token: INT\n", $1->linenum); }
      | BOOL              { printf("Line %d Token: BOOL\n", $1->linenum); }
      | CHAR              { printf("Line %d Token: CHAR\n", $1->linenum); }
      | IN                { printf("Line %d Token: IN\n", $1->linenum); }
      | ELSE              { printf("Line %d Token: ELSE\n", $1->linenum); }
      | RETURN            { printf("Line %d Token: RETURN\n", $1->linenum); }
      | BREAK             { printf("Line %d Token: BREAK\n", $1->linenum); }
      | SYMBOL            { printf("Line %d Token: %s\n", $1->linenum, $1->tokenstr); }
      | EQ                { printf("Line %d Token: EQ\n", $1->linenum); }
      | LEQ               { printf("Line %d Token: LEQ\n", $1->linenum); }
      | GEQ               { printf("Line %d Token: GEQ\n", $1->linenum); }
      | NEQ               { printf("Line %d Token: NEQ\n", $1->linenum); }
      | COMMENT           {}
      ;
%%


int main(int argc, char *argv[])
{
    // expected format [filename] -c
    //                  arg0    arg1
    // in case no filename listed
   if(argc == 1)
        yyparse();
    else {
        yyin = fopen(argv[1], "r");
        yyparse();
        fclose(yyin);
    }
    return 0;
}
