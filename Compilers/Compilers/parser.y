%{
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include "scanType.h"
//
//  Bison Code
//  Sydney Petrehn
//  January 22, 2021
//
extern int yylex();
extern FILE *yyin;
extern int yydebug;

#define YYERROR_VERBOSE

//// any C/C++ functions you want here that might be used in grammar actions below
//// any C/C++ globals you want here that might be used in grammar actions below

%}

//// your %union statement

//// your %token statements defining token classes

%%
tokenlist     : tokenlist token
              | token
              ;

token :    //// put first token in language here

//// put all your tokens here and individual actions
//// DO NOT DO THE C- GRAMMAR (this is a test program)
//// the grammar for assignment 1 is super simple

%%

//// any functions for main here

int main(int argc, char *argv[])
{
    // expected format [filename] -c
    //                  arg0    arg1
    // in case no filename listed
    if(argc == 1)
    {
        printf("No file listed\n");
        exit(1);
    }
    else // continue with parser.
    {
        // we know argument will be a file.
        yyfilename = malloc((strlen( argv[0] )+4));
        // try to open the file
        if(( yyin =  idkhowtoopenthefilebutthatgoeshere
        {
            // file successfully open so start parsing
            yyparse();
            line_num = 1;
            // print file being parsed
            printf( "File: %s\n", yyfilename );
            // start printing leximes
            if ( idkwhatgoeshere == NULL ) { // no tokens
                printf( "No Tokens\n" );
            } else { // tokens able to be parsed
                // idk what goes here
            }
            // close the file
            fclose( yyin );
            yyin = NULL;
        }
        else // unable to open file
        {
            printf("arg: %s\n", argv[i]);
            printf("ERROR(-c): can't open %s\n", argv[i]);
            return 1;
        }
    }
    return 0;
}
