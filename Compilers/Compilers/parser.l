%{
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>
#include "scanType.h"
#include "parser.tab.h"

int line = 1;
   
// builds the token
static int newToken(int tokenClass, char *tokenString)
{
    yylval.tokenData = new TokenData;
    yylval.tokenData->tokenclass = tokenClass;
    yylval.tokenData->linenum = line;
    yylval.tokenData->tokenstr = strdup(tokenString);
    
    switch(tokenClass)
    {
        case NUMCONST:
            yylval.tokenData->nvalue = atoi(tokenString);
            break;
        case BOOLCONST:
            yylval.tokenData->nvalue = (strcmp(tokenString, "false") == 0 ? 0 : 1);
            break;
        case STRINGCONST:
            yylval.tokenData->svalue = tokenString;
            break;
        case CHARCONST:
            yylval.tokenData->cvalue = tokenString[0];
            break;
    }
    return tokenClass;
}

%}

%option noyywrap

letter [a-zA-Z]
digit [0-9]
letdig [0-9a-zA-Z]

%%
[;,:\[\]\(\)={\<>\+\-\*/%\?}&\|!]    { return newToken(SYMBOL, yytext); }
"=="                                 { return newToken(EQ, yytext); }
"!="                                 { return newToken(NEQ, yytext); }
"<="                                 { return newToken(LEQ, yytext); }
">="                                 { return newToken(GEQ, yytext); }
"+="                                 { return newToken(ADDTO, yytext); }
"-="                                 { return newToken(SUBTO, yytext); }
"*="                                 { return newToken(MULTO, yytext); }
"/="                                 { return newToken(DIVTO, yytext); }
":>:"                                { return newToken(MAX, yytext); }
":<:"                                { return newToken(MIN, yytext); }
"--"                                 { return newToken(DEC, yytext); }
"++"                                 { return newToken(INC, yytext); }
"static"                             { return newToken(STATIC, yytext); }
"int"                                { return newToken(INT, yytext); }
"bool"                               { return newToken(BOOL, yytext); }
"char"                               { return newToken(CHAR, yytext); }
"if"                                 { return newToken(IF, yytext); }
"then"                               { return newToken(THEN, yytext); }
"else"                               { return newToken(ELSE, yytext); }
"while"                              { return newToken(WHILE, yytext); }
"do"                                 { return newToken(DO, yytext); }
"for"                                { return newToken(FOR, yytext); }
"by"                                 { return newToken(BY, yytext); }
"to"                                 { return newToken(TO, yytext); }
"return"                             { return newToken(RETURN, yytext); }
"break"                              { return newToken(BREAK, yytext); }
"and"                                { return newToken(AND, yytext); }
"or"                                 { return newToken(OR, yytext); }
"not"                                { return newToken(NOT, yytext); }
"true"                               { return newToken(BOOLCONST, yytext); }
"false"                              { return newToken(BOOLCONST, yytext); }
{letter}{letdig}*                    { return newToken(ID, yytext); }
{digit}+                             { return newToken(NUMCONST, yytext); }
[^ \n\t]                             { if(yytext[0] != ' ') printf("ERROR(%d): Invalid or misplaced input character: '%c'. Character Ignored.\n", line, yytext[0]); }
'([^\n\\']|\\.)*'                    { return newToken(CHARCONST, yytext); }
\"([^\\\"\n]|\\.)*\"                 { return newToken(STRINGCONST, yytext); }
\n                                   { line++; }
.                                    ;
%%
