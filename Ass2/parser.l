%{
#include <stdlib.h>
#include <string.h>
#include <string>
#include <stdbool.h>
#include "scanType.h"
#include "parser.tab.h"

int line = 1;

using namespace std;

char* strParser(char* tokenString)
{
    // expected input "string"
    int i, j, count;
    count = 0;
    bool isEscape = false;
    int sLength = strlen(tokenString);
    std::string temp;
    char *result;
    
    for(i = 0; i < sLength; i++)
    {
        if(!isEscape)
        {
            if(tokenString[i] == '\\')
            {
                isEscape = true;
                count++;
                //dont add since we ignore the escape
            }
            else
            {
                temp.append(1, tokenString[i]);
            }
        }
        else
        {
            isEscape = false;
            switch(tokenString[i])
            {
                case 'n': // new line character
                    temp.append(1, '\n');
                    break;
                case '0': // null character
                    temp.append(1, '\0');
                    break;
                default:
                    temp.append(1, tokenString[i]);
            }
        }
    }
    
    // get temp length
    i = 0;
    j = 0;
    while(temp[i])
    {
        j++;
        i++;
    }
    
    result = strcpy(((char*)malloc(j+1)), temp.c_str());
    yylval.tokenData->strlen = sLength - count -2; // account for escaped characters
    
    return result;
}

// find character constant escape functions
int charParser(char *tokenString)
{
    // expected input 'c'
    char c;
    int sLength = strlen(tokenString);
    
    // check for escape characters
    if(tokenString[1] == '\\')
    {
        switch(tokenString[2])
        {
            case 'n': // new line character
                c = '\n';
                break;
            case '0': // null character
                c = '\0';
                break;
            default:
                c = tokenString[2];
        }
    }
    else if(sLength == 2) // ''
    {
        printf("ERROR(%d): Empty character ''. Characters ignored.\n", line);
        return -1;
    }
    else if(sLength > 3) // cant have this in the first one in case string doesn't start with escape character
    {
        printf("WARNING(%d): character is %d characters long and not a single character: '%s'.  The first char will be used.\n", line, sLength - 2, tokenString);
        // recheck for escape characters
        if(tokenString[1] == '\\')
        {
            switch(tokenString[2])
            {
                case 'n': // new line character
                c = '\n';
                break;
                case '0': // null character
                c = '\0';
                break;
                default:
                c = tokenString[2];
            }
        }
        else
        {
            c = tokenString[1];
        }
    }
    else
    {
        c = tokenString[1];
    }
    
    return (int)c;
}

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
            yylval.tokenData->svalue = strParser(tokenString);
            break;
        case CHARCONST:
            int charData = charParser(tokenString);
            if(charData == -1)
            {
                return COMMENT;
            }
            yylval.tokenData->cvalue = (char)charData;
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
"//".*                               { line++; }

"static"                             { return newToken(STATIC, yytext); }
"int"                                { return newToken(INT, yytext); }
"bool"                               { return newToken(BOOL, yytext); }
"char"                               { return newToken(CHAR, yytext); }
"if"                                 { return newToken(IF, yytext); }
"to"                                 { return newToken(TO, yytext); }
"then"                               { return newToken(THEN, yytext); }
"else"                               { return newToken(ELSE, yytext); }
"while"                              { return newToken(WHILE, yytext); }
"do"                                 { return newToken(DO, yytext); }
"for"                                { return newToken(FOR, yytext); }
"by"                                 { return newToken(BY, yytext); }
"return"                             { return newToken(RETURN, yytext); }
"break"                              { return newToken(BREAK, yytext); }
"and"                                { return newToken(AND, yytext); }
"or"                                 { return newToken(OR, yytext); }
"not"                                { return newToken(NOT, yytext); }
"true"                               { return newToken(BOOLCONST, yytext); }
"false"                              { return newToken(BOOLCONST, yytext); }
"in"                                 { return newToken(IN, yytext); }
"=="                                 { return newToken(EQ, yytext); }
"!="                                 { return newToken(NEQ, yytext); }
"<="                                 { return newToken(LEQ, yytext); }
">="                                 { return newToken(GEQ, yytext); }
"+="                                 { return newToken(ADDASS, yytext); }
"-="                                 { return newToken(SUBASS, yytext); }
"*="                                 { return newToken(MULASS, yytext); }
"/="                                 { return newToken(DIVASS, yytext); }
":>:"                                { return newToken(MAX, yytext); }
":<:"                                { return newToken(MIN, yytext); }
"--"                                 { return newToken(DEC, yytext); }
"++"                                 { return newToken(INC, yytext); }
"+"                                  { return newToken(ADD, yytext); }
"-"                                  { return newToken(SUB, yytext); }
"<"                                  { return newToken(LT, yytext); }
">"                                  { return newToken(GT, yytext); }
"*"                                  { return newToken(MUL, yytext); }
"/"                                  { return newToken(DIV, yytext); }
"%"                                  { return newToken(MOD, yytext); }
"?"                                  { return newToken(RAND, yytext); }
"="                                  { return newToken(ASS, yytext); }
"&"                                  { return newToken(AND, yytext); }
"|"                                  { return newToken(OR, yytext); }
"!"                                  { return newToken(NOT, yytext); }
";"                                  { return newToken(SEMICOLON, yytext); }
":"                                  { return newToken(COLON, yytext); }
"("                                  { return newToken(LP, yytext); }
")"                                  { return newToken(RP, yytext); }
"["                                  { return newToken(LB, yytext); }
"]"                                  { return newToken(RB, yytext); }
","                                  { return newToken(COMMA, yytext); }
"{"                                  {  }
"}"                                  {  }
{letter}{letdig}*                    { return newToken(ID, yytext); }
{digit}+                             { return newToken(NUMCONST, yytext); }
'([^\n\\']|\\.)*'                    { return newToken(CHARCONST, yytext); }
\"([^\\\"\n]|\\.)*\"                 { return newToken(STRINGCONST, yytext); }
\n                                   { line++; }
[^ \n\t]                             { if(yytext[0] != ' ') printf("ERROR(%d): Invalid or misplaced input character: '%c'. Character Ignored.\n", line, yytext[0]); }
.|\n                                    ;
%%
