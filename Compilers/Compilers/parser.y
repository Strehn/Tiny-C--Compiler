%{
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
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

token : BOOLCONST         { printf("Line %d Token: BOOLCONST Value: %d  Input: %s\n", $1->line, $1->nValue, $1->tokenstr); }
      | NUMCONST          { printf("Line %d Token: NUMCONST Value: %d  Input: %s\n", $1->line, $1->nValue, $1->tokenstr); }
      | CHARCONST         { printf("Line %d Token: CHARCONST Value: '%c' Input: %s\n", $1->line, $1->cValue, $1->tokenstr); }
      | STRINGCONST       { printf("Line %d Token: STRINGCONST Value: \"", $1->line);
        std::cout << $1->sValue;
        printf("\"  Input: %s\n", $1->tokenstr); }
      | ID                { printf("Line %d Token: ID Value: %s\n", $1->line, $1->tokenstr); }
      | IF                { printf("Line %d Token: IF\n", $1->line); }
      | WHILE             { printf("Line %d Token: WHILE\n", $1->line); }
      | FOR               { printf("Line %d Token: FOR\n", $1->line); }
      | STATIC            { printf("Line %d Token: STATIC\n", $1->line); }
      | INT               { printf("Line %d Token: INT\n", $1->line); }
      | BOOL              { printf("Line %d Token: BOOL\n", $1->line); }
      | CHAR              { printf("Line %d Token: CHAR\n", $1->line); }
      | IN                { printf("Line %d Token: IN\n", $1->line); }
      | ELSE              { printf("Line %d Token: ELSE\n", $1->line); }
      | RETURN            { printf("Line %d Token: RETURN\n", $1->line); }
      | BREAK             { printf("Line %d Token: BREAK\n", $1->line); }
      | SYMBOL            { printf("Line %d Token: %s\n", $1->line, $1->tokenstr); }
      | EQ                { printf("Line %d Token: EQ\n", $1->line); }
      | ADDASS            { printf("Line %d Token: ADDASS\n", $1->line); }
      | SUBASS            { printf("Line %d Token: SUBASS\n", $1->line); }
      | DIVASS            { printf("Line %d Token: DIVASS\n", $1->line); }
      | MULASS            { printf("Line %d Token: MULASS\n", $1->line); }
      | LEQ               { printf("Line %d Token: LEQ\n", $1->line); }
      | GEQ               { printf("Line %d Token: GEQ\n", $1->line); }
      | NEQ               { printf("Line %d Token: NEQ\n", $1->line); }
      | DEC               { printf("Line %d Token: DEC\n", $1->line); }
      | INC               { printf("Line %d Token: INC\n", $1->line); }
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
