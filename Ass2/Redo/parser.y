%{
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <cstring>
#include <string.h>
#include <string>
#include <iostream>


#include "ourgetopt.h"
#include "scanType.h"
#include "TreeUtils.hpp"
#include "parser.tab.h"


extern int yylex();
extern FILE *yyin;
extern int yydebug;
extern int line;

void yyerror(const char *msg) {
    printf("Error(%d) while parsing: %s\n", line, msg);
}

//
// DATA
//
// ----- Global Tree -----
static TreeNode *syntaxTree;

%}

%locations

%union {
    ExpType type;            // for passing types.  typespec to pass up a type in decl like int or bool
    TokenData *tokenData;    // for terminals.  token data comes from yylex() in the $ variables
    TreeNode *tree;          // for nonterminals.   these tree nodes as you build the tree
}

%token <tokenData> BOOLCONST NUMCONST CHARCONST STRINGCONST ID THEN
%token <tokenData> IF WHILE FOR STATIC INT BOOL CHAR IN ELSE RETURN BREAK COMMENT
%token <tokenData> SYMBOL EQ ADDASS SUBASS DIVASS MULASS LEQ GEQ NEQ DEC INC
%token <tokenData> LT GT SIZEOF MAX MIN ADD DIV DO BY TO MOD RAND CHSIGN SUB MUL
%token <tokenData> AND OR NOT ASS SEMICOLON COLON LP RP LB RB COMMA LCB RCB
%start program

%type <tree> program declList decl
%type <tree> varDecl scopedVarDecl varDeclList varDeclInit varDeclId
%type <tree> funDecl parms parmList parmTypeList parmIdList parmId
%type <tree> stmt expStmt compoundStmt localDecls stmtList returnStmt breakStmt
%type <tree> matched unmatched matchedselectStmt unmatchedselectStmt matchediterStmt unmatchediterStmt
%type <tree> exp simpleExp andExp unaryRelExp relExp minmaxExp sumExp mulExp unaryExp factor mutable iterrange immutable call args argList
%type <tokenData> constant relop unaryop mulop sumop minmaxop
%type <type> typeSpec


%%

/* ----- Structure ----- */
program : declList
    {
        $$ = $1;
        syntaxTree = $$;
    }
    ;

declList : declList decl
    {
        $$ = addSibling($1, $2);
    }
    | decl
    {
        $$ = $1;
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
        setType($$, $1, false);
    }
    ;

scopedVarDecl : STATIC typeSpec varDeclList SEMICOLON
    {
        $$ = $3;
        setType($3, $2, true);
    }
    | typeSpec varDeclList SEMICOLON
    {
        $$ = newDeclNode(VarK, $1, $3, $2);
    }
    ;

varDeclList : varDeclList COMMA varDeclInit
    {
        $$ = addSibling($1, $3);
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
        $$ = newDeclNode(VarK, UndefinedType, $2, $3);
    }
    ;

varDeclId : ID
    {
        $$ = newDeclNode(VarK, UndefinedType, $1);
        $$->attr.name = $1->svalue;
    }
    | ID LB NUMCONST RB
    {
        $$ = newDeclNode(VarK, UndefinedType, $1);
        $$->attr.name = $1->svalue;
        $$->expType = UndefinedType;
        $$->attr.value = $3->nvalue;
    }
    ;

typeSpec : INT
    {
        $$ = Integer;
    }
    | BOOL
    {
        $$ = Boolean;
    }
    | CHAR
    {
        $$ = Char;
    }
    ;

/* ----- Functions ----- */

funDecl : typeSpec ID LP parms RP stmt
    {
        $$ = newDeclNode(FuncK, $1, $2, $4, $6);
    }
    | ID LP parms RP stmt
    {
        $$ = newDeclNode(FuncK, Void, $1, $3, $5);
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
        $$ = newDeclNode(ParamK, Void, $2, $1, $3);
    }
    | parmTypeList
    {
        $$ = $1;
    }
    ;

parmTypeList : typeSpec parmIdList
    {
        $$ = $2;
        setType($$, $1, true);
    }
    ;

parmIdList : parmIdList COMMA parmId
    {
        $$ = addSibling($1, $3);
    }
    | parmId
    {
        $$ = $1;
    }
    ;

parmId : ID
    {
        $$ = newDeclNode(ParamK, Boolean, $1);
    }
    | ID LB RB
    {
        $$ = newDeclNode(ParamK, Boolean, $1);
    }
    ;

/* ----- Statements ----- */

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
        $$ = newStmtNode(CompoundK, $1, $2, $3);
    }
    ;

localDecls : localDecls scopedVarDecl
    {
        $$ = addSibling($1, $2);
    }
    | /* empty */
    {
        $$ = NULL;
    }
    ;

stmtList : stmtList stmt
    {
        $$ = addSibling($1, $2);
    }
    | /* empty */
    {
        $$ = NULL;
    }
    ;

matchedselectStmt : IF simpleExp THEN matched ELSE matched
    {
        $$ = newStmtNode(IfK, $1, $2, $4, $6);
        
    }
    ;

unmatchedselectStmt : IF simpleExp THEN stmt
    {
        $$ = newStmtNode(IfK, $1, $2, $4);
    
    }
    | IF simpleExp THEN matched ELSE unmatched
    {
        $$ = newStmtNode(IfK, $1, $2, $4, $6);
    }
    ;

matchediterStmt : WHILE simpleExp DO matched
    {
        $$ = newStmtNode(WhileK, $1, $2, $4);
    }
    | FOR ID ASS iterrange DO matched
    {
        $$ = newStmtNode(ForK, $2, $4, $6);
    }
    ;

unmatchediterStmt : WHILE simpleExp DO unmatched
    {
        $$ = newStmtNode(WhileK, $1, $2, $4);
    }
    | FOR ID ASS iterrange DO unmatched
    {
        $$ = newStmtNode(ForK, $2, $4, $6);
    }
    ;

iterrange : simpleExp TO simpleExp
    {
        $$ = newStmtNode(RangeK, $2, $1, $3);
    }
    ;
    | simpleExp TO simpleExp BY simpleExp
    {
        $$ = newStmtNode(RangeK, $2, $1, $3, $5);
    }
    ;

returnStmt : RETURN SEMICOLON
    {
        $$ = newStmtNode(ReturnK, $1);
    }
    | RETURN exp SEMICOLON
    {
        $$ = newStmtNode(ReturnK, $1, $2);
    }
    ;

breakStmt : BREAK SEMICOLON
    {
        $$ = newStmtNode(BreakK, $1);
    }
    ;

/* ----- expressions ----- */

exp : mutable ASS exp
    {
        $$ = newExpNode(OpK);
        $$->attr.op = $2->nvalue;
        $$->child[0] = $3;
    }
    | mutable ADDASS exp
    {
        $$ = newExpNode(OpK);
        $$->attr.op = $2->nvalue;
        $$->child[0] = $3;
    }
    | mutable SUBASS exp
    {
        $$ = newExpNode(OpK);
        $$->attr.op = $2->nvalue;
        $$->child[0] = $3;
    }
    | mutable MULASS exp
    {
        $$ = newExpNode(OpK);
        $$->attr.op = $2->nvalue;
        $$->child[0] = $3;
    }
    | mutable DIVASS exp
    {
        $$ = newExpNode(OpK);
        $$->attr.op = $2->nvalue;
        $$->child[0] = $3;
    }
    | mutable INC
    {
        $$ = newExpNode(OpK);
        $$->attr.op = $2->nvalue;
        $$->child[0] = $1;
    }
    | mutable DEC
    {
        $$ = newExpNode(OpK);
        $$->attr.op = $2->nvalue;
        $$->child[0] = $1;
    }
    | simpleExp
    {
        $$ = $1;
    }
    ;

simpleExp : simpleExp OR andExp
    {
        $$ = newExpNode(OpK);
        $$->attr.op = $2->nvalue;
        $$->child[0] = $3;
    }
    | andExp
    {
        $$ = $1;
    }
    ;

andExp : andExp AND unaryRelExp
    {
        $$ = newExpNode(OpK);
        $$->attr.op = $2->nvalue;
        $$->child[0] = $3;
    }
    | unaryRelExp
    {
        $$ = $1;
    }
    ;

unaryRelExp : NOT unaryRelExp
    {
        $$ = newExpNode(OpK);
        $$->attr.op = $1->nvalue;
        $$->child[0] = $2;
    }
    | relExp
    {
        $$ = $1;
    }
    ;

relExp : minmaxExp relop minmaxExp
    {
        $$ = newExpNode(OpK);
        $$->child[0] = $1;
        $$->child[1] = $3;
    }
    | minmaxExp
    {
        $$ = $1;
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
        $$ = newExpNode(OpK);
        $$->child[0] = $1;
        $$->child[1] = $3;
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
        $$ = newExpNode(OpK);
        $$->child[0] = $1;
        $$->child[1] = $3;
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
        $$ = newExpNode(OpK);
        $$->child[0] = $1;
        $$->child[1] = $3;
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
        $$ = newExpNode(OpK);
        $$->child[1] = $2;
    }
    | factor
    {
        $$ = $1;
    }

unaryop : SUB
    {
        $1->tokenclass = CHSIGN;
        $$ = $1;
    }
    | MUL
    {
        $1->tokenclass = SIZEOF;
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
        $$ = newExpNode(IdK);
        $$->attr.name = $1->svalue;
    }
    | mutable LB exp RB
    {
        $$ = newExpNode(IdK);
        $$->child[0] = $3;
    }
    ;

immutable : LP exp RP
    {
        $$ = $2;
    }
    | call
    {
        $$ = newExpNode(CallK);
    }
    | constant
    {
        $$ = newExpNode(ConstantK);
    }
    ;

call : ID LP args RP
    {
        $$ = newExpNode(CallK);
        $$->attr.name = $1->svalue;
        $$->child[1] = $3;
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
        $$ = addSibling($1, $3);
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

//
// Utility
//
TreeNode * parse(void)
{
    yyparse();
    return syntaxTree;
}

int main(int argc, char *argv[])
{
    // expected format -c [option] [filename]
    //               arg0    arg1    arg2
    // in case no filename listed
    
    // ----- VARIABLES -----
    extern int   opterr;
    extern int   optind;
    extern char *optarg;
    int c, dset = 0,  pset = 0;
    
    
    while((c = ourGetopt(argc, argv, (char *)"dp?")) != EOF)
    {
        switch(c)
        {
            case 'd':
                dset = 1;
                break;
            case 'p':
                pset = 1;
                break;
            case '?':
                fprintf(stderr, "usage: c- [-d] [-p] file\n");
                return -1;
        }
    }
    
    if(dset == 1)
    {
        yydebug = 1;
    }
    
    if(optind < argc)
    {
        if ((yyin = fopen(argv[optind], "r")))
        {
            // file open successful
        }
        else
        {
            // failed to open file
            printf("ERROR: failed to open '%s'\n", argv[1]);
            exit(1);
        }
        yyparse();
        fclose(yyin);
    }
    
    else
    {
        syntaxTree = parse();
    }
    
    if(pset == 1)
    {
        printTree(syntaxTree);
    }
    
    return 0;
}
