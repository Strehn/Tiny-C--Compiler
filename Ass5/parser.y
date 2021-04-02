%{

    
#include <string.h>
#include <string>
#include <iostream>


#include "ourgetopt.h"
#include "scanType.h"
#include "TreeUtils.hpp"
#include "parser.tab.h"
#include "Semantic.hpp"
#include "yyerror.hpp"


extern int yylex();
extern FILE *yyin;
extern int yydebug;
extern int line;

void yyerror(const char *);

//
// DATA
//
// ----- Global Tree -----
static TreeNode *syntaxTree;

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
%type <type> typeSpec assignop


%%

/* ----- Structure ----- */
program : declList                                    {syntaxTree = $1;}
    ;

declList : declList decl                              {$$ = addSibling($1, $2);}
    | decl                                            {$$ = $1;}
    ;

decl : varDecl                                        {$$ = $1;}
    | funDecl                                         {$$ = $1;}
    | error                                           { $$ = NULL; }
    ;

/* ----- Variables ----- */

varDecl : typeSpec varDeclList SEMICOLON              {$$ = setType($2, $1, false); yyerror;}
    //| error                                           {$$ = NULL;}
    | error varDeclList SEMICOLON                     {$$ = NULL; yyerror;}
    | typeSpec error SEMICOLON                        {$$ = NULL; yyerror; yyerror;}

    ;

scopedVarDecl : STATIC typeSpec varDeclList SEMICOLON {$$ = setType($3, $2, true); yyerror;}
    | typeSpec varDeclList SEMICOLON                  {$$ = setType($2, $1, false); yyerror;}
    | error varDeclList SEMICOLON                     {$$ = NULL; yyerror;}
    ;

varDeclList : varDeclList COMMA varDeclInit           {$$ = addSibling($1, $3); yyerror;}
    | varDeclInit                                     {$$ = $1;}
    | error                                           {$$ = NULL;}
    | varDeclList COMMA error                         { $$ = NULL; }
    ;

varDeclInit : varDeclId                               {$$ = $1;}
    | varDeclId COLON simpleExp                       {$$ = $1; addChild($$, $3);}
    | error COLON simpleExp                           { $$ = NULL; yyerror; }
    | varDeclId COLON error                           { $$ = NULL; yyerror; }
    ;

varDeclId : ID                                        { $$ = newDeclNode(VarK, UndefinedType, $1); $$->tmp = $1->idIndex;}
    | ID LB NUMCONST RB                               {$$ = newDeclNode(VarK, UndefinedType, $1); $$->isArray = true; $$->aSize = $3->nvalue; $$->tmp = $1->idIndex;}
    | ID LB error                                     { $$ = NULL; }
    | error RB                                        { $$ = NULL; yyerror; }
    ;

typeSpec : INT                                        {$$ = Integer;}
    | BOOL                                            {$$ = Boolean;}
    | CHAR                                            {$$ = Char;}
    ;

/* ----- Functions ----- */

funDecl : typeSpec ID LP parms RP stmt                {$$ = newDeclNode(FuncK, $1, $2, $4, $6); $$->tmp = $2->idIndex;}
    | ID LP parms RP stmt                             {$$ = newDeclNode(FuncK, Void, $1, $3, $5); $$->tmp = $1->idIndex;}
    | typeSpec error                                  { $$ = NULL; }
    | typeSpec ID LP error                            { $$ = NULL; }
    | typeSpec ID LP parms RP error                         { $$ = NULL; }
    | ID LP error                                     { $$ = NULL; }
    | ID LP parms RP error                            { $$ = NULL; }
    ;

parms : parmList                                      {$$ = $1;}
    |                                                 {$$ = NULL;}
    ;

parmList : parmList SEMICOLON parmTypeList            {$$ = addSibling($1, $3);}
    | parmTypeList                                    {$$ = $1;}
    | parmList SEMICOLON error                        { $$ = NULL; }
    | error                                           { $$ = NULL; }
    ;

parmTypeList : typeSpec parmIdList                    {$$ = setType($2, $1, false);}
    | typeSpec error                                  { $$ = NULL; }
    ;

parmIdList : parmIdList COMMA parmId                  {$$ = addSibling($1, $3); yyerror;}
    | parmId                                          {$$ = $1;}
    | parmIdList COMMA error                          { $$ = NULL; }
    | error                                           { $$ = NULL; }
    ;

parmId : ID                                           {$$ = newDeclNode(ParamK, UndefinedType, $1);$$->tmp = $1->svalue;}
    | ID LB RB                                        {$$ = newDeclNode(ParamK, UndefinedType, $1);$$->isArray = true;$$->tmp = $1->svalue;}
    | error RB                                        { $$ = NULL; }
    ;

/* ----- Statements ----- */

stmt :  matched                                      {$$ = $1;}
    | unmatched                                      {$$ = $1;}
    ;

matched : expStmt                                    {$$ = $1;}
    | compoundStmt                                   {$$ = $1;}
    | returnStmt                                     {$$ = $1;}
    | breakStmt                                      {$$ = $1;}
    | matchedselectStmt                              {$$ = $1;}
    | matchediterStmt                                {$$ = $1;}
    ;

unmatched : unmatchedselectStmt                      {$$ = $1;}
    | unmatchediterStmt                              {$$ = $1;}
    ;

expStmt : exp SEMICOLON                              {$$ = $1;}
    | SEMICOLON                                      {$$ = NULL; yyerror;}
    | error SEMICOLON                                { $$ = NULL; yyerror; }
    ;

compoundStmt : LCB localDecls stmtList RCB           {$$ = newStmtNode(CompoundK, $1, $2, $3); yyerror;}
   | LCB localDecls error RCB                        {$$=NULL; yyerror; }
   | LCB error stmtList RCB                        {$$=NULL; yyerror; }
   | error assignop exp                              { $$ = NULL; yyerror; }
   | mutable assignop error                          { $$ = NULL; }
   | error INC                                       { $$=NULL; yyerror; }
   | error DEC                                       { $$=NULL; yyerror; }
   ;

localDecls : localDecls scopedVarDecl                {$$ = addSibling($1, $2);}
    |                                                {$$ = NULL;}
    ;

stmtList : stmtList stmt                             {$$ = addSibling($1, $2);}
    |                                                {$$ = NULL;}
    ;

matchedselectStmt : IF simpleExp THEN matched ELSE matched {$$ = newStmtNode(IfK, $1, $2, $4, $6); }
    | IF error                                       { $$ = NULL; }
    | IF error ELSE matched                          { $$ = NULL; yyerror; }
    | IF error THEN matched ELSE matched             { $$ = NULL; yyerror; }
    ;

unmatchedselectStmt : IF simpleExp THEN stmt         {$$ = newStmtNode(IfK, $1, $2, $4);}
    | IF simpleExp THEN matched ELSE unmatched       {$$ = newStmtNode(IfK, $1, $2, $4, $6);}
    | IF error                                       { $$ = NULL; }
    | IF error ELSE unmatched                        { $$ = NULL; yyerror; }
    | IF error THEN matched ELSE unmatched           { $$ = NULL; yyerror; }
    ;

matchediterStmt : WHILE simpleExp DO matched         {$$ = newStmtNode(WhileK, $1, $2, $4);}
    | FOR ID ASS iterrange DO matched                {$$ = newStmtNode(ForK, $1, newDeclNode(VarK, Integer, $2), $4, $6); $$->tmp = $2->idIndex;}
    | WHILE error DO matched                         { $$ = NULL; yyerror; }
    | WHILE error                                    { $$ = NULL; }
    | FOR ID ASS error DO matched                    { $$ = NULL; yyerror; }
    | FOR error                                      { $$ = NULL; }
    ;

unmatchediterStmt : WHILE simpleExp DO unmatched     {$$ = newStmtNode(WhileK, $1, $2, $4);}
    | FOR ID ASS iterrange DO unmatched              {$$ = newStmtNode(ForK, $1, newDeclNode(VarK, Integer, $2), $4, $6); $$->tmp = $2->idIndex;}
    | FOR ID ASS error DO unmatched                  { $$ = NULL; yyerror; }
    | FOR error                                      { $$ = NULL; }
    ;

iterrange : simpleExp TO simpleExp                   {$$ = newStmtNode(RangeK, $2, $1, $3);}
    ;
    | simpleExp TO simpleExp BY simpleExp            {$$ = newStmtNode(RangeK, $2, $1, $3, $5); $$->tmp = $2->idIndex;}
    ;

returnStmt : RETURN SEMICOLON                        {$$ = newStmtNode(ReturnK, $1);}
    | RETURN exp SEMICOLON                           {$$ = newStmtNode(ReturnK, $1, $2);}
    | RETURN error SEMICOLON                         { $$ = NULL; yyerror; }
    ;

breakStmt : BREAK SEMICOLON                          {$$ = newStmtNode(BreakK, $1);}
    ;

/* ----- expressions ----- */

assignop : mutable ASS exp                               {$$ = newExpNode(AssignK, $2, $1, $3); $$->expType = $1->expType;}
    | mutable ADDASS exp                            {$$ = setType(newExpNode(AssignK, $2, $1, $3), Integer, false);}
    | mutable SUBASS exp                            {$$ = setType(newExpNode(AssignK, $2, $1, $3), Integer, false);}
    | mutable MULASS exp                            {$$ = setType(newExpNode(AssignK, $2, $1, $3), Integer, false);}
    | mutable DIVASS exp                            {$$ = setType(newExpNode(AssignK, $2, $1, $3), Integer, false);}
    | mutable INC                                   {$$ = setType(newExpNode(AssignK, $2, $1), Integer, false);}
    | mutable DEC                                   {$$ = setType(newExpNode(AssignK, $2, $1), Integer, false);}
    ;

exp : mutable ASS exp                               {$$ = newExpNode(AssignK, $2, $1, $3); $$->expType = $1->expType;}
    | mutable ADDASS exp                            {$$ = setType(newExpNode(AssignK, $2, $1, $3), Integer, false);}
    | mutable SUBASS exp                            {$$ = setType(newExpNode(AssignK, $2, $1, $3), Integer, false);}
    | mutable MULASS exp                            {$$ = setType(newExpNode(AssignK, $2, $1, $3), Integer, false);}
    | mutable DIVASS exp                            {$$ = setType(newExpNode(AssignK, $2, $1, $3), Integer, false);}
    | mutable INC                                   {$$ = setType(newExpNode(AssignK, $2, $1), Integer, false);}
    | mutable DEC                                   {$$ = setType(newExpNode(AssignK, $2, $1), Integer, false);}
    | simpleExp                                     {$$ = $1;}
    ;

simpleExp : simpleExp OR andExp                     {$$ = setType(newExpNode(OpK, $2, $1, $3), Boolean, false);}
    | andExp                                        {$$ = $1;}
    | simpleExp OR error                            { $$=NULL; };
    ;

andExp : andExp AND unaryRelExp                     {$$ = setType(newExpNode(OpK, $2, $1, $3), Boolean, false);}
    | unaryRelExp                                   {$$ = $1;}
    | andExp AND error                                { $$ = NULL; }
    ;

unaryRelExp : NOT unaryRelExp                       {$$ = setType(newExpNode(OpK, $1, $2), Boolean, false);}
    | relExp                                        {$$ = $1;}
    | NOT error                                       { $$ = NULL; }
    ;

relExp : minmaxExp relop minmaxExp                  {$$ = $2; addChild($$, $1); addChild($$, $3);}
    | minmaxExp                                     {$$ = $1;}
    ;

relop : LEQ                                         {$$ = setType(newExpNode(OpK, $1), Boolean, false);}
    | LT                                            {$$ = setType(newExpNode(OpK, $1), Boolean, false);}
    | GT                                            {$$ = setType(newExpNode(OpK, $1), Boolean, false);}
    | GEQ                                           {$$ = setType(newExpNode(OpK, $1), Boolean, false);}
    | EQ                                            {$$ = setType(newExpNode(OpK, $1), Boolean, false);}
    | NEQ                                           {$$ = setType(newExpNode(OpK, $1), Boolean, false);}
    ;

minmaxExp : minmaxExp minmaxop sumExp               {$$ = $2;addChild($$, $1);addChild($$, $3);}
    | sumExp                                        {$$ = $1;}
    | minmaxExp relop error                           { $$ = NULL; }
    ;

minmaxop : MAX                                      {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    | MIN                                           {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    ;

sumExp : sumExp sumop mulExp                        {$$ = $2; addChild($$, $1); addChild($$, $3);}
    | mulExp                                        {$$ = $1;}
    | sumExp sumop error                              { $$ = NULL; }
    ;

sumop : ADD                                         {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    | SUB                                           {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    ;

mulExp : mulExp mulop unaryExp                      {$$ = $2; addChild($$, $1); addChild($$, $3);}
    | unaryExp                                      {$$ = $1;}
    | mulExp mulop error                              { $$ = NULL; }
    ;

mulop : MUL                                         {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    | DIV                                           {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    | MOD                                           {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    ;

unaryExp : unaryop unaryExp                         {$$ = $1; addChild($$, $2);}
    |factor                                         {$$ = $1;}
    | unaryop error                                   { $$ = NULL; }
    ;

unaryop : SUB                                       {$1->tokenclass=CHSIGN; $$ = setType(newExpNode(OpK, $1), Integer, false);}
    | MUL                                           {$1->tokenclass=SIZEOF; $$ = setType(newExpNode(OpK, $1), Integer, false);}
    | RAND                                          {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    ;

factor : immutable                                  {$$ = $1;}
    | mutable                                       {$$ = $1;}
    ;

mutable : ID                                        {$$ = newExpNode(IdK, $1); $$->name = $1->idIndex;}
    |  ID LB exp RB                                 {$$ = newExpNode(OpK, $2, newExpNode(IdK, $1), $3); $$->child[0]->name = $1->idIndex;}
    ;

immutable : LP exp RP                               {$$ = $2; yyerrok;}
    | call                                          {$$ = $1;}
    | constant                                      {$$ = $1;}
    | LP error                                      { $$ = NULL; }
    | error LP                                      { $$ = NULL; yyerrok; }
    ;

call : ID LP args RP                                {$$ = newExpNode(CallK, $1, $3);$$->name = $1->idIndex;}
    ;

args : argList                                      {$$ = $1;}
    |                                               {$$ = NULL;}
    ;

argList : argList COMMA exp                         {$$ = addSibling($1, $3); yyerror;}
    | exp                                           {$$ = $1;}
    | argList COMMA error                           { $$=NULL; }
    ;

constant :  NUMCONST                                {$$ = newExpNode(ConstantK, $1);$$->expType = Integer; $$->value = $1->nvalue; }
    | CHARCONST                                     {$$ = newExpNode(ConstantK, $1);$$->expType = Char;$$->cvalue = $1->cvalue;}
    |STRINGCONST                                    {$$ = newExpNode(ConstantK, $1);$$->expType = Char;$$->string = $1->svalue;$$->isArray = true;}
    |BOOLCONST                                      {$$ = newExpNode(ConstantK, $1);$$->expType = Boolean;$$->value = $1->nvalue;}
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
    extern int  opterr;
    extern int  optind;
    extern char *optarg;
    extern int n_errors;
    extern int n_warnings;
    int c, dset = 0,  pset = 0, bDset = 0, bPset = 0, hset = 0;
    // semantic analysis
    SymbolTable *table = new SymbolTable();
    
    if(argc < 3)
    {
        //printf("ERROR(ARGLIST): source file \"%s\" could not be opened.\n", argv[1]);
        //n_errors++;
        printf("Number of warnings: %d\n", n_warnings);
        printf("Number of errors: %d\n", n_errors);
        return 1;
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
                hset = 1;
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
    
    // create map
    initErrorProcessing();
    
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
        table->debug(bDset);
        
        symanticA(syntaxTree, table);
        
        if(n_errors == 0)
        {
            printTree(syntaxTree);
        }
    }
    
    printf("Number of warnings: %d\n", n_warnings);
    printf("Number of errors: %d\n", n_errors);
    
    return 0;
}
