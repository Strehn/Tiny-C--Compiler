%{
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "scanType.h"
#include "parser.tab.h"

#define YY_USER_ACTION yylloc.first_line = yylloc.last_line = yylineno;

// get the string from the tokenString
std::string getString(char *input)
{
    int len = strlen(input);
    std::string s;
    int i;
    bool temp = false;

    for(i = 1; i < len - 1; i++)
    {
        if(!temp)
        {
            if(input[i] == '\\')
            {
                temp = true;
            }
            else
            {
                s.append(1, input[i]);
            }
        }
        else
        {
            temp = false;
            switch(input[i])
            {
            case '0':
                s.append(1, '\0');
                break;
            case 'n':
                s.append(1, '\n');
                break;
            default:
                s.append(1, input[i]);
            }
        }
    }
    return s;
}

// get value from tokenstring
int getValue(char *input)
{
    char const;
    int len = strlen(input);
    // make sure warning works for escaped first char
    if(input[1] == '\\')
    {
        switch(input[2])
        {
        case '0':
            const = '\0';
            break;
        case 'n':
            const = '\n';
            break;
        default:
            const = input[2];
        }
    }
    else if(len > 3)
    {
        printf("WARNING(%d): character is %d characters long and not a single character: '%s'. The first char will be used.\n", line, len - 2, raw);
        if(input[1] == '\\')
        {
            switch(input[2])
            {
            case '0':
                const = '\0';
                break;
            case 'n':
                const = '\n';
                break;
            default:
                const = input[2];
            }
        }
        else
        {
            const = input[1];
        }
    }
    else if(len == 2)
    {
        printf("ERROR(%d): Empty character ''. Characters ignored.\n", line);
        return -1;
    }
    else
    {
        const = input[1];
    }
    return (int)const;
}

// builds the token
static int newToken(int tokenClass, char *tokenString)
{
  
    yylval.tokenData = new TokenData;
    yylval.tokenData->tokenclass = tokenClass;
    yylval.tokenData->linenum = yylineno;
    yylval.tokenData->tokenstr = srtdup(tokenString);
    
  
    switch(tokenClass)
    {
        case NUMCONST:
            yylval.tokenData->nvalue = atoi(tokenString);
            break;
        case BOOLCONST:
            yylval.tokenData->nvalue = (strcmp(tokenString, "false") == 0 ? 0 : 1;)
            break;
        case STRINGCONST:
            yylval.tokenData->svalue = getString(tokenString);
            break;
        case CHARCONST:
            int const = getValue(tokenString);
                if(const == -1)
                    return -1;
            yylval.tokenData->cValue = (char)const;
            break;
    }
    
    return tokenClass;
}

%}

%option noyywrap
%option yylineno

letter [a-zA-Z]
digit [0-9]
letdig [0-9a-zA-Z]

%%

{letter}{letdig}*                    { return newToken(ID, yytext); }
{digit}+                             { return newToken(NUMCONST, yytext); }
[;,:\[\]\(\)={\<>\+\-\*/%\?}&\|!]    { return newToken(SYMBOL, yytext); }
'([^\n\\']|\\.)*'                    { return newToken(CHARCONST, yytext); }
\"([^\\\"\n]|\\.)*\"                 { return newToken(STRINGCONST, yytext); }
"=="                                 { return newToken(EQ, yytext); }
"!="                                 { return newToken(NEQ, yytext); }
"<="                                 { return newToken(LEQ, yytext); }
"<"                                  { return newToken(LT, yytext); }
">="                                 { return newToken(GEQ, yytext); }
">"                                  { return newToken(GT, yytext); }
"\*"                                 { return newToken(MUL, yytext); }
"+="                                 { return newToken(ADDTO, yytext); }
"-="                                 { return newToken(SUBTO, yytext); }
"*="                                 { return newToken(MULTO, yytext); }
"/="                                 { return newToken(DIVTO, yytext); }
":>:"                                { return newToken(MAX, yytext); }
":<:"                                { return newToken(MIN, yytext); }
"--"                                 { return newToken(DEC, yytext); }
"++"                                 { return newToken(INC, yytext); }
"\+"                                 { return newToken(ADD, yytext); }
"\%"                                 { return newToken(DIV, yytext); }
"\?"                                 { return newToken(RAND, yytext); }
"//".*                               { return newToken(COMMENT, yytext); }
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
[^ \n\t]                             { if(yytext[0] != ' ') printf("ERROR(%d): Invalid or                                       misplaced input character: '%c'. Character Ignored.\n",                                    line, yytext[0]); }
\n                                   { line++; }
.                                    ;
%%
