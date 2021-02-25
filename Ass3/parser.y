%{

    
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

int errors = 0, warnings = 0;
bool checkInitialization = true;


%}

%locations

%union {
    ExpType type;            // for passing types.  typespec to pass up a type in decl like int or bool
    TokenData *tokenData;    // for terminals.  token data comes from yylex() in the $ variables
    TreeNode *tree;          // for nonterminals.   these tree nodes as you build the tree
}

%token <tokenData> BOOLCONST NUMCONST CHARCONST STRINGCONST ID THEN
%token <tokenData> IF WHILE FOR STATIC INT BOOL CHAR ELSE RETURN BREAK COMMENT
%token <tokenData> EQ ADDASS SUBASS DIVASS MULASS LEQ GEQ NEQ DEC INC
%token <tokenData> LT GT MAX MIN ADD DIV DO BY TO MOD RAND SUB MUL CHSIGN SIZEOF
%token <tokenData> AND OR NOT ASS SEMICOLON COLON LP RP LB RB COMMA LCB RCB
%start program

%type <tree> program declList decl
%type <tree> varDecl scopedVarDecl varDeclList varDeclInit varDeclId
%type <tree> funDecl parms parmList parmTypeList parmIdList parmId
%type <tree> stmt expStmt compoundStmt localDecls stmtList returnStmt breakStmt
%type <tree> matched unmatched matchedselectStmt unmatchedselectStmt matchediterStmt unmatchediterStmt
%type <tree> exp simpleExp andExp unaryRelExp relExp minmaxExp sumExp mulExp unaryExp factor mutable iterrange immutable call args argList
%type <tree> constant relop unaryop mulop sumop minmaxop
%type <type> typeSpec


%%

/* ----- Structure ----- */
program : declList
    {
        syntaxTree = $1;
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
        setType($2, $1, false);
    }
    ;

scopedVarDecl : STATIC typeSpec varDeclList SEMICOLON
    {
        $$ = $3;
        setType($3, $2, true);
    }
    | typeSpec varDeclList SEMICOLON
    {
        $$ = $2;
        setType($2, $1, false);
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
        $$ = $1;
        addChild($$, $3);
    }
    ;

varDeclId : ID
    {
        $$ = newDeclNode(VarK, UndefinedType, $1);
        $$->tmp = $1->idIndex;
    }
    | ID LB NUMCONST RB
    {
        $$ = newDeclNode(VarK, UndefinedType, $1);
        $$->isArray = true;
        $$->aSize = $3->nvalue;
        $$->tmp = $1->idIndex;
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
        $$->tmp = $2->idIndex;
        setType($$, $1, true);
    }
    | ID LP parms RP stmt
    {
        $$ = newDeclNode(FuncK, Void, $1, $3, $5);
        $$->tmp = $1->idIndex;
    }
    ;

parms : parmList
    {
        $$ = $1;
    }
    |
    {
        $$ = NULL;
    }
    ;

parmList : parmList SEMICOLON parmTypeList
    {
        $$ = addSibling($1, $3);
    }
    | parmTypeList
    {
        $$ = $1;
    }
    ;

parmTypeList : typeSpec parmIdList
    {
        $$ = $2;
        setType($2, $1, false);
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
        $$ = newDeclNode(ParamK, Void, $1);
        $$->tmp = $1->svalue;
    }
    | ID LB RB
    {
        $$ = newDeclNode(ParamK, Void, $1);
        $$->isArray = true;
        $$->tmp = $1->svalue;
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
    | returnStmt
    {
        $$ = $1;
    }
    | breakStmt
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
    |
    {
        $$ = NULL;
    }
    ;

stmtList : stmtList stmt
    {
        $$ = addSibling($1, $2);
    }
    |
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
        $$ = newStmtNode(ForK, $1, newDeclNode(VarK, Integer, $2), $4, $6);
        $$->tmp = $2->idIndex;
    }
    ;

unmatchediterStmt : WHILE simpleExp DO unmatched
    {
        $$ = newStmtNode(WhileK, $1, $2, $4);
    }
    | FOR ID ASS iterrange DO unmatched
    {
        $$ = newStmtNode(ForK, $1, newDeclNode(VarK, Integer, $2), $4, $6);
        $$->tmp = $2->idIndex;
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
        $$->tmp = $2->idIndex;
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
        $$ = newExpNode(AssignK, $2, $1, $3);
    }
    | mutable ADDASS exp
    {
        $$ = newExpNode(AssignK, $2, $1, $3);
    }
    | mutable SUBASS exp
    {
        $$ = newExpNode(AssignK, $2, $1, $3);
    }
    | mutable MULASS exp
    {
        $$ = newExpNode(AssignK, $2, $1, $3);
    }
    | mutable DIVASS exp
    {
        $$ = newExpNode(AssignK, $2, $1, $3);
    }
    | mutable INC
    {
        $$ = newExpNode(AssignK, $2, $1);
    }
    | mutable DEC
    {
        $$ = newExpNode(AssignK, $2, $1);
    }
    | simpleExp
    {
        $$ = $1;
    }
    ;

simpleExp : simpleExp OR andExp
    {
        $$ = newExpNode(OpK, $2, $1, $3);
    }
    | andExp
    {
        $$ = $1;
    }
    ;

andExp : andExp AND unaryRelExp
    {
        $$ = newExpNode(OpK, $2, $1, $3);
    }
    | unaryRelExp
    {
        $$ = $1;
    }
    ;

unaryRelExp : NOT unaryRelExp
    {
        $$ = newExpNode(OpK, $1, $2);
    }
    | relExp
    {
        $$ = $1;
    }
    ;

relExp : minmaxExp relop minmaxExp
    {
        $$ = $2;
        addChild($$, $1);
        addChild($$, $3);
    }
    | minmaxExp
    {
        $$ = $1;
    }
    ;

relop : LEQ
    {
        $$ = newExpNode(OpK, $1);
    }
    | LT
    {
        $$ = newExpNode(OpK, $1);
    }
    | GT
    {
        $$ = newExpNode(OpK, $1);
    }
    | GEQ
    {
        $$ = newExpNode(OpK, $1);
    }
    | EQ
    {
        $$ = newExpNode(OpK, $1);
    }
    | NEQ
    {
        $$ = newExpNode(OpK, $1);
    }
    ;

minmaxExp : minmaxExp minmaxop sumExp
    {
        $$ = $2;
        addChild($$,$1);
        addChild($$,$3);
    }
    | sumExp
    {
        $$ = $1;
    }
    ;

minmaxop : MAX
    {
        $$ = newExpNode(OpK, $1);
    }
    | MIN
    {
        $$ = newExpNode(OpK, $1);
    }
    ;

sumExp : sumExp sumop mulExp
    {
        $$ = $2;
        addChild($$,$1);
        addChild($$,$3);
    }
    | mulExp
    {
        $$ = $1;
    }

sumop : ADD
    {
        $$ = newExpNode(OpK, $1);
    }
    | SUB
    {
        $$ = newExpNode(OpK, $1);
    }
    ;

mulExp : mulExp mulop unaryExp
    {
        $$ = $2;
        addChild($$, $1);
        addChild($$, $3);
    }
    | unaryExp
    {
        $$ = $1;
    }
    ;

mulop : MUL
    {
        $$ = newExpNode(OpK, $1);
    }
    | DIV
    {
        $$ = newExpNode(OpK, $1);
    }
    | MOD
    {
        $$ = newExpNode(OpK, $1);
    }
    ;

unaryExp : unaryop unaryExp
    {
        $$ = $1;
        addChild($$, $2);
    }
    | factor
    {
        $$ = $1;
    }

unaryop : SUB
    {
        $1->tokenclass=CHSIGN;
        $$ = newExpNode(OpK, $1);
    }
    | MUL
    {
        $1->tokenclass=SIZEOF;
        $$ = newExpNode(OpK, $1);
    }
    | RAND
    {
        $$ = newExpNode(OpK, $1);
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
        $$ = newExpNode(IdK, $1);
        $$->name = $1->idIndex;
    }
    |  ID LB exp RB
    {
        $$ = newExpNode(OpK, $2, newExpNode(IdK, $1), $3);
        $$->child[0]->name = $1->idIndex;
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
        $$ = $1;
    }
    ;

call : ID LP args RP
    {
        $$ = newExpNode(CallK, $1, $3);
        $$->name = $1->idIndex;
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
        $$->name = $2->svalue;
    }
    | exp
    {
        $$ = $1;
    }
    ;

constant :  NUMCONST
    {
        $$ = newExpNode(ConstantK, $1);
        $$->expType = Integer;
        $$->value = $1->nvalue;
    }
    | CHARCONST
    {
        $$ = newExpNode(ConstantK, $1);
        $$->expType = Char;
        $$->cvalue = $1->cvalue;
    }
    |STRINGCONST
    {
        $$ = newExpNode(ConstantK, $1);
        $$->expType = String;
        $$->string = $1->svalue;
    }
    |BOOLCONST
    {
        $$ = newExpNode(ConstantK, $1);
        $$->expType = Boolean;
        $$->value = $1->nvalue;
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
    int c, dset = 0,  pset = 0, bDset = 0, bPset = 0, hset = 0;
    
    
    if(argc < 3)
    {
        return -1;
    }
    
    while((c = ourGetopt(argc, argv, (char *)"dDpPh")) != EOF)
    {
        switch(c)
        {
            case 'd':
                dset = 1;
                break;
            case 'p':
                pset = 1;
                break;
            case 'h':
                hset = 1
                break;
            case 'P':
                bPset = 1;
                break;
            case 'D':
                bDset = 1;
                break;
        }
    }
    
    if(dset == 1)
    {
        yydebug = 1;
    }
    
    if(hset == 1)
    {
        fprintf(stderr, "Usage: c- [options] [sourceFile] \n");
        printf("options: \n");
        printf("-d      - turn on parser debugging \n");
        printf("-D      - turn on symbol table debugging \n");
        printf("-h      - this usage message ");
        printf("-p      - print the abstract syntax tree");
        printf("-P      - print the abstract syntax tree plus type information");
    }
    
    if(optind < argc)
    {
        yyin = fopen(argv[optind], "r");
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
    
    if(bPset == 1)
    {

        // semantic analysis
        SymbolTable *table = new SymbolTable();
        table->debug(Sflag);

        analyze(syntaxTree, table);
    }
    
    printf("Number of warnings: %d\n", warnings);
    printf("Number of errors: %d\n", errors);
    
    return 0;
}
