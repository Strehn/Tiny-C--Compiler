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
#include "emitcode.hpp"


extern int yylex();
extern FILE *yyin;
extern int yydebug;
extern int line;
extern TreeNode *currentfunction;
FILE * code;
void yyerror(const char *);

// ----- VARIABLES -----
extern int  opterr;
extern int  optind;
extern char *optarg;
extern int n_errors;
extern int n_warnings;
extern int goffset;
extern int foffset;
int toffset;
int entry;
int parmc;
int pos1, pos2;
int toffset_old;
bool inaFunction;
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
%type <type> typeSpec


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

varDecl : typeSpec varDeclList SEMICOLON              {$$ = setType($2, $1, false); yyerrok;}
    | error varDeclList SEMICOLON                     {$$ = NULL; yyerrok;}
    |  typeSpec error SEMICOLON                       {$$ = NULL; yyerrok; yyerrok;}
    ;

scopedVarDecl : STATIC typeSpec varDeclList SEMICOLON {$$ = setType($3, $2, true); yyerrok;}
    | typeSpec varDeclList SEMICOLON                  {$$ = setType($2, $1, false); yyerrok;}
    ;

varDeclList : varDeclList COMMA varDeclInit           {$$ = addSibling($1, $3); yyerrok; }
    | varDeclInit                                     {$$ = $1;}
    | error                                           {$$ = NULL;}
    | varDeclList COMMA error                         { $$ = NULL; }
    ;

varDeclInit : varDeclId                               {$$ = $1;}
    | varDeclId COLON simpleExp                       {$$ = $1; addChild($$, $3);}
    | error COLON simpleExp                           { $$ = NULL; yyerrok; }
    ;

varDeclId : ID                                        { $$ = newDeclNode(VarK, UndefinedType, $1); $$->tmp = $1->idIndex; yyerrok;}
    | ID LB NUMCONST RB                               {$$ = newDeclNode(VarK, UndefinedType, $1); $$->isArray = true; $$->aSize = $3->nvalue; $$->tmp = $1->idIndex;}
    | ID LB error                                     { $$ = NULL; }
    | error RB                                        { $$ = NULL; yyerrok; }
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
   // | typeSpec ID LP parms RP error                   { $$ = NULL; }
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

parmIdList : parmIdList COMMA parmId                  {$$ = addSibling($1, $3); yyerrok;}
    | parmId                                          {$$ = $1;}
    | parmIdList COMMA error                          { $$ = NULL; }
    | error                                           { $$ = NULL; }
    ;

parmId : ID                                           {$$ = newDeclNode(ParamK, UndefinedType, $1);$$->tmp = $1->svalue;}
    | ID LB RB                                        {$$ = newDeclNode(ParamK, UndefinedType, $1);$$->isArray = true; $$->tmp = $1->svalue; $$->aSize = sizeof($$->tmp);}
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
    | IF error                                       { $$ = NULL; }
    | IF error ELSE matched                          { $$ = NULL; yyerrok; }
    | IF error THEN matched ELSE matched             { $$ = NULL; yyerrok; }
    | WHILE error DO matched                         { $$ = NULL; yyerrok; }
    | WHILE error                                    { $$ = NULL; }
    | FOR ID ASS error DO matched                    { $$ = NULL; yyerrok; }
    | FOR error                                      { $$ = NULL; }
    ;

unmatched : unmatchedselectStmt                      {$$ = $1;}
    | unmatchediterStmt                              {$$ = $1;}
    | IF error THEN stmt                             { $$ = NULL; yyerrok; }
    | IF error THEN matched ELSE unmatched           { $$ = NULL; yyerrok; }

    ;

expStmt : exp SEMICOLON                              {$$ = $1; }
    | error SEMICOLON                                { $$ = NULL; yyerrok; }
    ;

compoundStmt : LCB localDecls stmtList RCB           {$$ = newStmtNode(CompoundK, $1, $2, $3); yyerrok;}
   ;

localDecls : localDecls scopedVarDecl                {$$ = addSibling($1, $2);}
    |                                                {$$ = NULL;}
    ;

stmtList : stmtList stmt                             {$$ = addSibling($1, $2);}
    |                                                {$$ = NULL; }
    ;

matchedselectStmt : IF simpleExp THEN matched ELSE matched {$$ = newStmtNode(IfK, $1, $2, $4, $6); }
    ;

unmatchedselectStmt : IF simpleExp THEN stmt         {$$ = newStmtNode(IfK, $1, $2, $4);}
    | IF simpleExp THEN matched ELSE unmatched       {$$ = newStmtNode(IfK, $1, $2, $4, $6);}
    ;

matchediterStmt : WHILE simpleExp DO matched         {$$ = newStmtNode(WhileK, $1, $2, $4);}
    | FOR ID ASS iterrange DO matched                {$$ = newStmtNode(ForK, $1, newDeclNode(VarK, Integer, $2), $4, $6); $$->tmp = $2->idIndex;}
    ;

unmatchediterStmt : WHILE simpleExp DO unmatched     {$$ = newStmtNode(WhileK, $1, $2, $4);}
    | FOR ID ASS iterrange DO unmatched              {$$ = newStmtNode(ForK, $1, newDeclNode(VarK, Integer, $2), $4, $6); $$->tmp = $2->idIndex;}
    ;

iterrange : simpleExp TO simpleExp                   {$$ = newStmtNode(RangeK, $2, $1, $3);}
    | simpleExp TO simpleExp BY simpleExp            {$$ = newStmtNode(RangeK, $2, $1, $3, $5); $$->tmp = $2->idIndex;}
    | simpleExp TO error                             { $$ = NULL; }
    | error BY error                                 { $$ = NULL; yyerrok; }
    | simpleExp TO simpleExp BY error                { $$ = NULL; }
    ;

returnStmt : RETURN exp SEMICOLON                    {$$ = newStmtNode(ReturnK, $1, $2); yyerrok;}
    | RETURN SEMICOLON                               {$$ = newStmtNode(ReturnK, $1); }
    | RETURN error SEMICOLON                         { $$ = NULL; yyerrok; }
    ;

breakStmt : BREAK SEMICOLON                          {$$ = newStmtNode(BreakK, $1);}
    ;

/* ----- expressions ----- */

exp : mutable ASS exp                               {$$ = newExpNode(AssignK, $2, $1, $3); $$->expType = $1->expType;}
    | mutable ADDASS exp                            {$$ = setType(newExpNode(AssignK, $2, $1, $3), Integer, false);}
    | mutable SUBASS exp                            {$$ = setType(newExpNode(AssignK, $2, $1, $3), Integer, false);}
    | mutable MULASS exp                            {$$ = setType(newExpNode(AssignK, $2, $1, $3), Integer, false);}
    | mutable DIVASS exp                            {$$ = setType(newExpNode(AssignK, $2, $1, $3), Integer, false);}
    | error ASS exp                                 { $$=NULL; yyerrok;}
    | error ADDASS exp                              { $$=NULL; yyerrok;}
    | error SUBASS exp                              { $$=NULL; yyerrok;}
    | error MULASS exp                              { $$=NULL; yyerrok;}
    | error DIVASS exp                              { $$=NULL; yyerrok;}
    | mutable ASS error                             { $$=NULL;}
    | mutable ADDASS error                          { $$=NULL;}
    | mutable SUBASS error                          { $$=NULL;}
    | mutable MULASS error                          { $$=NULL;}
    | mutable DIVASS error                          { $$=NULL;}
    | mutable INC                                   {$$ = setType(newExpNode(AssignK, $2, $1), Integer, false); yyerrok;}
    | mutable DEC                                   {$$ = setType(newExpNode(AssignK, $2, $1), Integer, false); yyerrok;}
    | error INC                                     { $$=NULL; yyerrok; }
    | error DEC                                     { $$=NULL; yyerrok; }
    | simpleExp                                     {$$ = $1;}
    ;

simpleExp : simpleExp OR andExp                     {$$ = setType(newExpNode(OpK, $2, $1, $3), Boolean, false);}
    | andExp                                        {$$ = $1;}
    | simpleExp OR error                            { $$=NULL; }
    ;

andExp : andExp AND unaryRelExp                     {$$ = setType(newExpNode(OpK, $2, $1, $3), Boolean, false);}
    | unaryRelExp                                   {$$ = $1;}
    | andExp AND error                              { $$ = NULL; }
    ;

unaryRelExp : NOT unaryRelExp                       {$$ = setType(newExpNode(OpK, $1, $2), Boolean, false);}
    | relExp                                        {$$ = $1;}
    | NOT error                                     { $$ = NULL; }
    ;

relExp : minmaxExp relop minmaxExp                  {$$ = $2; addChild($$, $1); addChild($$, $3);}
    | minmaxExp                                     {$$ = $1;}
    | minmaxExp relop error                         { $$ = NULL; }
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
    ;

minmaxop : MAX                                      {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    | MIN                                           {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    ;

sumExp : sumExp sumop mulExp                        {$$ = $2; addChild($$, $1); addChild($$, $3);}
    | mulExp                                        {$$ = $1;}
    | sumExp sumop error                            { $$ = NULL; }
    ;

sumop : ADD                                         {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    | SUB                                           {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    ;

mulExp : mulExp mulop unaryExp                      {$$ = $2; addChild($$, $1); addChild($$, $3);}
    | unaryExp                                      {$$ = $1;}
    | mulExp mulop error                            { $$ = NULL; }
    ;

mulop : MUL                                         {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    | DIV                                           {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    | MOD                                           {$$ = setType(newExpNode(OpK, $1), Integer, false);}
    ;

unaryExp : unaryop unaryExp                         {$$ = $1; addChild($$, $2);}
    |factor                                         {$$ = $1;}
    | unaryop error                                 { $$ = NULL; }
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
    | LP error                                      {$$ = NULL; }
    ;

call : ID LP args RP                                {$$ = newExpNode(CallK, $1, $3);$$->name = $1->idIndex;}
    | error LP                                      {$$ = NULL; yyerrok;}
    ;

args : argList                                      {$$ = $1;}
    |                                               {$$ = NULL;}
    ;

argList : argList COMMA exp                         {$$ = addSibling($1, $3); yyerrok;}
    | exp                                           {$$ = $1;}
    | argList COMMA error                           { $$=NULL; }
    ;

constant :  NUMCONST                                {$$ = newExpNode(ConstantK, $1);$$->expType = Integer; $$->value = $1->nvalue;}
    | CHARCONST                                     {$$ = newExpNode(ConstantK, $1);$$->expType = Char; $$->cvalue = $1->cvalue;}
    |STRINGCONST                                    {$$ = newExpNode(ConstantK, $1);$$->expType = Char; $$->string = $1->svalue; $$->isArray = true; $$->aSize = sizeof($1->svalue);}
    |BOOLCONST                                      {$$ = newExpNode(ConstantK, $1); $$->expType = Boolean; $$->value = $1->nvalue;}
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

// function declaration
void startgeneration(TreeNode * tree, SymbolTable * table);
void codegen(char *filename, TreeNode * tree, SymbolTable * table);
void nodegenstart(TreeNode *tree, SymbolTable * table);
void nodegenend(TreeNode *tree, SymbolTable * table);
void generate(TreeNode * tree, SymbolTable * table);

int main(int argc, char *argv[])
{
    // expected format -c [option] [filename]
    //               arg0    arg1    arg2
    // in case no filename listed
    SymbolTable *table = new SymbolTable();
    int c, dset = 0,  pset = 0, bDset = 0, bPset = 0, hset = 0, mset = 0;
       
    while((c = ourGetopt(argc, argv, (char *)"dDpPhM")) != EOF)
    {
        switch(c)
        {
            case 'd':
                dset = 1;
                break;
            case 'p':
                pset = 1;
                break;
            case 'M':
                mset = 1;
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
        printf("-h      - this usage message \n");
        printf("-p      - print the abstract syntax tree \n");
        printf("-P      - print the abstract syntax tree plus type information \n");
        printf("-M      - print the abstract syntax tree plus memory info \n");
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
    
    table->debug(bDset);
    
    if(n_errors == 0)
    {
        symanticA(syntaxTree, table);
    }
   
    
    if(bPset == 1)
    {
        if(n_errors == 0)
        {
            printTree(syntaxTree);
        }
    }
       
    if(mset == 1)
    {
        if(n_errors == 0)
        {
            printTreeMemory(syntaxTree);
            printf("Offset for end of global space: %d \n", goffset );
        }
    }
    
    // ----- CODE GENERATION -----
    // should do this automatically
    if(n_errors == 0)
    {
        char *path = strdup(argv[optind]);
        int n = strlen(path);
        if(n > 3 && path[n - 1] == '-' && path[n - 2] == 'c' && path[n - 3] == '.')
        {
            path[n - 2] = 't';
            path[n - 1] = 'm';
        }
        else
        {
            printf("ERROR(I/O): Input filename must end in .c-\n");
            n_errors++;
            printf("Number of warnings: %d\n", n_warnings);
            printf("Number of errors: %d\n", n_errors);
            return -1;
        }
        
        
        code = fopen(path, "w+");
        
        codegen(argv[optind], syntaxTree, table);
        fclose(code);
        
    }
    
    printf("Number of warnings: %d\n", n_warnings);
    printf("Number of errors: %d\n", n_errors);
}

void codegen(char *filename, TreeNode * tree, SymbolTable * table)
{
        inaFunction = false;
        // insert header comment
        emitComment((char *)"C- version: 1.00");
        emitComment((char *)"by Sydney Petrehn");
        emitComment((char *)"Input file:", filename);

        // backpatch a jump to init
        entry = emitSkip(1);

        // I/O Library
        // input
        TreeNode *input;
        input = (TreeNode *)table->lookup((char *)"input");
        if(input != NULL)
        {
            input->memlocation = emitSkip(0);
        }
        
        emitComment((char *)"FUNCTION input");
        emitRM((char *)"ST", 3, -1, 1, (char *)"Store return address");
        emitRO((char *)"IN", 2, 2, 2, (char *)"Grab int input");
        emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
        emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
        emitRM((char *)"LDA", 7, 0, 3, (char *)"Return");
        emitComment((char *)"END FUNCTION input");
        
        // output
        TreeNode *output;
        output = (TreeNode *)table->lookup((char *)"output");
        if(output != NULL)
        {
            output->memlocation = emitSkip(0);
        }
       
        emitComment((char *)"FUNCTION output");
        emitRM((char *)"ST", 3, -1, 1, (char *)"Store return address");
        emitRM((char *)"LD", 3, -2, 1, (char *)"Load parameter");
        emitRO((char *)"OUT", 3, 3, 3, (char *)"Output integer");
        emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
        emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
        emitRM((char *)"LDA", 7, 0, 3, (char *)"Return");
        emitComment((char *)"END FUNCTION output");

        // inputb
        TreeNode *inputb;
        inputb = (TreeNode *)table->lookup((char *)"inputb");
        if(inputb != NULL)
        {
            inputb->memlocation = emitSkip(0);
        }
        
        emitComment((char *)"FUNCTION inputb");
        emitRM((char *)"ST", 3, -1, 1, (char *)"Store return address");
        emitRO((char *)"INB", 2, 2, 2, (char *)"Grab bool input");
        emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
        emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
        emitRM((char *)"LDA", 7, 0, 3, (char *)"Return");
        emitComment((char *)"END FUNCTION inputb");
        
        // outputb
        TreeNode *outputb;
        outputb = (TreeNode *)table->lookup((char *)"outputb");
        if(output != NULL)
        {
            outputb->memlocation = emitSkip(0);
        }
        
        emitComment((char *)"FUNCTION outputb");
        emitRM((char *)"ST", 3, -1, 1, (char *)"Store return address");
        emitRM((char *)"LD", 3, -2, 1, (char *)"Load parameter");
        emitRO((char *)"OUTB", 3, 3, 3, (char *)"Output bool");
        emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
        emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
        emitRM((char *)"LDA", 7, 0, 3, (char *)"Return");
        emitComment((char *)"END FUNCTION outputb");

        // inputc
        TreeNode *inputc;
        inputc = (TreeNode *)table->lookup((char *)"inputc");
        if(inputc != NULL)
        {
            inputc->memlocation = emitSkip(0);
        }
        emitComment((char *)"FUNCTION inputc");
        emitRM((char *)"ST", 3, -1, 1, (char *)"Store return address");
        emitRO((char *)"INC", 2, 2, 2, (char *)"Grab char input");
        emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
        emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
        emitRM((char *)"LDA", 7, 0, 3, (char *)"Return");
        emitComment((char *)"END FUNCTION inputc");
        
        // outputc
        TreeNode *outputc;
        outputc = (TreeNode *)table->lookup((char *)"outputc");
        if(outputc != NULL)
        {
            outputc->memlocation = emitSkip(0);
        }
        emitComment((char *)"FUNCTION outputc");
        emitRM((char *)"ST", 3, -1, 1, (char *)"Store return address");
        emitRM((char *)"LD", 3, -2, 1, (char *)"Load parameter");
        emitRO((char *)"OUTC", 3, 3, 3, (char *)"Output char");
        emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
        emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
        emitRM((char *)"LDA", 7, 0, 3, (char *)"Return");
        emitComment((char *)"END FUNCTION outputc");

        // outnl
        TreeNode *outnl;
        outnl = (TreeNode *)table->lookup((char *)"outnl");
        if(outnl != NULL)
        {
            outnl->memlocation = emitSkip(0);
        }
        
        emitComment((char *)"FUNCTION outnl");
        emitRM((char *)"ST", 3, -1, 1, (char *)"Store return address");
        emitRO((char *)"OUTNL", 3, 3, 3, (char *)"Output newline");
        emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
        emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
        emitRM((char *)"LDA", 7, 0, 3, (char *)"Return");
        emitComment((char *)"END FUNCTION outnl");
        
        // main body
        emitComment((char *)"=========================================");
        
        startgeneration(tree, table);
}

void startgeneration(TreeNode * tree, SymbolTable * table)
{
    generate(tree, table);
    
    emitComment((char *)"=========================================");
    
    
    emitComment((char *)"INIT");
    
    // idk why but add this? it should be 2.
    if(goffset == 2)
    {
        goffset = 0;
    }
    else if(goffset == 1)
    {
        goffset = 0;
    }
    else if(goffset == -1)
    {
        //goffset = 0;
    }
    else if(goffset == -15)
    {
        goffset = -9;
    }
    else if(goffset == -7)
    {
        goffset = -9;
    }
    
    
    
    emitRM((char *)"LDA", 1, goffset, 0, (char *)"Set first frame at end of globals");
    emitRM((char *)"ST", 1, 0, 1, (char *)"Store old fp (point to self)");
    
    emitComment((char *)"INIT GLOBALS AND STATICS");
   
    //please god work
    TreeNode * iterater = tree;
    while(iterater != NULL)
    {
        if(iterater->isArray == true)
        {
            emitRM((char *)"LDC", 3, iterater->aSize, 6, (char *)"load size of array", iterater->name);
            emitRM((char *)"ST", 3, iterater->memlocation+1, 0, (char *)"save size of array", iterater->name);
        }
        iterater = iterater->sibling;
    }
    
    emitComment((char *)"END INIT GLOBALS AND STATICS");
   
    TreeNode *memtemp;
    int loc;
    memtemp = (TreeNode *)table->lookup((char *)"main");
    if(memtemp != NULL)
    {
        loc = memtemp->memlocation - emitSkip(0) - 1;
    }
    else
    {
        loc = -9;
    }
    
    emitRM((char *)"LDA", 3, 1, 7, (char *)"Return address in ac");
    emitRM((char *)"JMP", 7, loc , 7, (char *)"Jump to main");
    emitRM((char *)"HALT", 0, 0, 0, (char *)"DONE!");
    emitComment((char *)"END INIT");
     
}

void generate(TreeNode * tree, SymbolTable * table)
{
    nodegenstart(tree, table);
    
    for(int i = 0; i <3; i++)
    {
        if( (tree->child[i]) != NULL)
        {
            generate(tree->child[i], table);
        }
    }
    
    nodegenend(tree, table);
    // look at the sibling
    if( (tree->sibling) != NULL)
    {
        generate(tree->sibling, table);
    }
    
}

void nodegenstart(TreeNode *tree, SymbolTable * table)
{
    int i;
    TreeNode *temp;
    
    if (tree->nodekind == StmtK)
    {
        switch(tree->subkind.stmt)
        {
            case NullK:
                break;
            case IfK:
                emitComment((char *)"IF");
                break;
            case WhileK:
                emitComment((char *)"While");
                break;
            case ForK:
                emitComment((char *)"For");
                break;
            case CompoundK:
            
                toffset_old = toffset;
                if(!tree->noScope)
                {
                    emitComment((char *)"COMPOUND");
                    toffset = tree->memsize;
                    emitComment((char *)"TOFF set: ", (int *)toffset );
                }
                emitComment((char *)"Compound body");
                break;
            case ReturnK:
                emitComment((char *)"Return");
                break;
            case BreakK:
                emitComment((char *)"Break");
                break;
            case RangeK:
                emitComment((char *)"Range");
                break;
            default:
                break;
        }
    }
    else if(tree->nodekind == DeclK)
    {
        //VarK, FuncK, ParamK
        switch(tree->subkind.decl)
        {
            case VarK:
                emitComment((char *)"Var");
                if(tree->isArray == true)
                {
                    if(inaFunction == true)
                    {
                      //load
                      emitRM((char *)"LDC", 3, tree->memsize - 1, 6, (char *)"Load size of array", tree->name);
                      //save
                      emitRM((char *)"ST", 3, tree->memlocation +1, 1, (char *)"store return address");
                      return;
                    }
                }
                
                toffset--;
                break;
            case FuncK:
                inaFunction = true;
                emitComment((char *)"FUNCTION", tree->name);
                
                TreeNode *memtemp;
                memtemp = (TreeNode *)table->lookupGlobal(tree->name);
                if(memtemp != NULL)
                {
                    memtemp->memlocation = emitSkip(0) - 1;
                }
                
                toffset = -2;
                emitComment((char *)"TOFF set: ", (int *)toffset );
                emitRM((char *)"ST", 3, -1, 1, (char *)"store return address");
                break;
            case ParamK:
                emitComment((char *)"PARM");
                // do nothing
                break;
            default:
                break;
        }
    }
    else // ExpK
    {
        TreeNode * lhs;
        TreeNode * rhs;
        emitComment((char *)"EXPRESSION");
        switch(tree->subkind.exp)
            {
                case OpK:
                    //toffset_old++;
                    break;
                case ConstantK:
                    //emitComment((char *)"ASSIGN", tree->name);
                    break;
                case IdK:
                    break;
                case AssignK:
                    emitComment((char *)"ASSIGN ", tree->name);
                    
                    if(tree->child[0] != NULL)
                    {
                        lhs = tree->child[0];
                    }
                    
                    /*
                     Sibling: 1  Assign: = of type int [line: 8]
                     .   .   .   Child: 0  Op: [ of type int [line: 8]
                     .   .   .   .   Child: 0  Id: y of array of type int [mem: Global loc: -11 size: 5] [line: 8]
                     .   .   .   .   Child: 1  Const 1 of type int [line: 8]
                     .   .   .   Child: 1  Const 211 of type int [line: 8]
                     */
                    if(lhs->tokenclass == LB)
                    {
                        // load integer constant
                        // push index
                        lhs = tree->child[0]->child[0];
                        rhs = tree->child[0]->child[1];
                        // this next line breaks b
                        rhs->generated = true;
                        switch(rhs->tokenclass)
                        {
                            case CHARCONST:
                                emitRM((char *)"LDC", 3, (int)rhs->cvalue, 6, (char *)"Load char constant");
                                break;
                            case STRINGCONST:
                                break;
                            case NUMCONST:
                            case BOOLCONST:
                                emitRM((char *)"LDC", 3, rhs->value, 6, (char *)"Load integer constant");
                                break;
                        }
                        emitRM((char *)"ST", 3, toffset, 1, (char *)"Push index");
                        
                        //rhs->generated = true;
                        // get the rhs of the =
                        rhs = tree->child[1];
                        rhs->generated = true;
                        switch(rhs->tokenclass)
                        {
                            case CHARCONST:
                                emitRM((char *)"LDC", 3, (int)rhs->cvalue, 6, (char *)"Load char constant");
                                break;
                            case STRINGCONST:
                                break;
                            case NUMCONST:
                            case BOOLCONST:
                                emitRM((char *)"LDC", 3, rhs->value, 6, (char *)"Load integer constant");
                                break;
                        }
                        
                        // pop index
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop index");
                        
                        // load address of base of array tree->name
                        // pop index
                        emitRM((char *)"LDA", 5, lhs->memlocation, (lhs->isGlobal ? 0 : 1), (char *)"Load address of base of array", lhs->name);
                        // compute offset of value
                        emitRO((char *)"SUB", 5, 5, 4, (char *)"Compute offset of value");
                        // store variable x
                        emitRM((char *)"ST", 3, 0, 5, (char *)"Store variable", lhs->name);
                        
                        lhs->generated = true;
                        
                    }
                    else
                    {
                        
                        // check for both being ids
                        if( (tree->child[0]->nodekind == ExpK && tree->child[0]->subkind.exp == IdK ) && (tree->child[1]->nodekind == ExpK && tree->child[1]->subkind.exp == IdK ) )
                        {
                            lhs = tree->child[0];
                            rhs = tree->child[1];
                            /*
                             .   .   Sibling: 2  Assign: += of type int [line: 9]
                             .   .   .   Child: 0  Id: x of type int [mem: Global loc: 0 size: 1] [line: 9]
                             .   .   .   Child: 1  Id: y of type int [mem: Global loc: -1 size: 1] [line: 9]
                             
                             EXPRESSION
                              44:     LD  3,-1(0)    Load variable y
                              45:     LD  4,0(0)    load lhs variable x
                              46:    ADD  3,4,3    op +=
                             */
                            emitRM((char *)"LD", 3, rhs->memlocation, 0, (char *)"Load variable ", rhs->name);
                            emitRM((char *)"LD", 4, 0, 0, (char *)"Load lhs variable ", lhs->name);
                            
                            switch(tree->tokenclass)
                            {
                                case ADDASS:
                                    emitRO((char *)"ADD", 3, 4, 3, (char *)"Op +");
                                    break;
                                case SUBASS:
                                    emitRO((char *)"SUB", 3, 4, 3, (char *)"Op -");
                                    break;
                                
                            }
                            
                            
                        }
                        /*
                         Sibling: 1  Assign: = of type int [line: 8]
                         .   .   .   .   Child: 0  Id: y of array of type int [mem: Global loc: -11 size: 5] [line: 8]
                         .   .   .   .   Child: 1  Const 211 of type int [line: 8]
                         */
                        lhs = tree->child[0];
                        rhs = tree->child[1];
                        tree->child[1]->generated = true;
                        switch(rhs->tokenclass)
                        {
                            case CHARCONST:
                                emitRM((char *)"LDC", 3, (int)rhs->cvalue, 6, (char *)"Load char constant");
                                break;
                            case STRINGCONST:
                                break;
                            case NUMCONST:
                            case BOOLCONST:
                                emitRM((char *)"LDC", 3, rhs->value, 6, (char *)"Load integer constant");
                                break;
                        }
                        emitRM((char *)"ST", 3, lhs->memlocation , (lhs->isGlobal ? 0 : 1), (char *)"Store variable", lhs->name);
                        toffset--;
                    }
                   
                    break;
                case InitK:
                    emitComment((char *)"INIT ", tree->name);
                    break;
                case CallK:
                    //toffset++;
                    emitComment((char *)"CALL ", tree->name);
                    if(toffset == -4)
                    {
                        toffset = -2;
                    }
                    emitRM((char *)"ST", 1, toffset, 1, (char *)"Store fp in ghost frame for ", tree->name);
                    toffset_old = toffset;
                    
                    //toffset = -2;
                    toffset--;
                    emitComment((char *)"TOFF dec: ", (int *) toffset);
                    toffset--;
                    emitComment((char *)"TOFF dec: ", (int *) toffset);
                    
                    if(tree->child[0] != NULL)
                    {
                        if(tree->child[0]->child[0] != NULL)
                        {
                            if(tree->child[0]->child[0]->child[0] != NULL)
                            {
                                
                                if(tree->child[0]->child[0]->child[0]->isArray == false)
                                {
                                    /*
                                    lhs = tree->child[0]->child[0]->child[0];
                                    // not an array just an id
                                    emitRM((char *)"LD", 3, (parmc * -1), 0, (char *)"Load variable", tree->name);
                                    parmc++;
                                    emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                                    // load left
                                    // push left
                                    emitRM((char *)"LD", 3, (parmc * -1), 0, (char *)"Load variable", tree->name);
                                    // load right
                                     */
                                }
                                else if(tree->child[0]->child[0]->child[0]->isArray == true)
                                {
                                    lhs = tree->child[0]->child[0]->child[0];
                                    emitRM((char *)"LDA", 3, lhs->memlocation, (lhs->isGlobal ? 0 : 1), (char *)"Load address of base of array", tree->child[0]->child[0]->child[0]->name);
                                    emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                                    
                                    if(tree->child[0]->child[0]->child[1] != NULL)
                                    {
                                        tree->child[0]->child[0]->child[1]->generated = true;
                                        tree->child[0]->child[0]->child[1]->pop = false;
                                        tree->child[0]->CallParm = true;
                                        
                                        switch(tree->child[0]->child[0]->child[1]->tokenclass)
                                        {
                                            case CHARCONST:
                                                emitRM((char *)"LDC", 3, (int)tree->child[0]->child[0]->child[1]->cvalue, 6, (char *)"Load char constant");
                                                break;
                                            case STRINGCONST:
                                                break;
                                            case NUMCONST:
                                            case BOOLCONST:
                                                emitRM((char *)"LDC", 3, tree->child[0]->child[0]->child[1]->value, 6, (char *)"Load integer constant");
                                                //emitComment((char *)"HERE ");
                                                break;
                                        }
                                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                                        
                                        emitRO((char *)"SUB", 3, 4, 3, (char *)"Compute location from index");
                                        
                                        emitRM((char *)"LD", 3, 0, 3, (char *)"Load array element");
                                        
                                        emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                                       
                                        toffset--;
                                    }
                                    // case
                                    /*
                                     .   .   Sibling: 2  Call: output of type void [line: 9]
                                     .   .   .   Child: 0  Op: + of type int [line: 9]
                                     .   .   .   .   Child: 0  Op: [ of type int [line: 9]
                                     .   .   .   .   .   Child: 0  Id: x of array of type int [mem: Local loc: -3 size: 4] [line: 9]
                                     .   .   .   .   .   Child: 1  Const 2 of type int [line: 9]
                                     .   .   .   .   Child: 1  Op: [ of type int [line: 9]
                                     .   .   .   .   .   Child: 0  Id: y of array of type int [mem: Local loc: -7 size: 5] [line: 9]
                                     .   .   .   .   .   Child: 1  Const 1 of type int [line: 9]
                                     */
                                   if(tree->child[0]->child[1]->child[0] != NULL)
                                    {
                                        if(tree->child[0]->child[1]->child[0]->isArray == true)
                                        {
                                            lhs = tree->child[0]->child[1]->child[0];
                                            rhs = tree->child[0]->child[1]->child[1];
                                            emitRM((char *)"LDA", 3, lhs->memlocation, (lhs->isGlobal ? 0 : 1), (char *)"Load address of base of array", lhs->name);
                                            emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                                            
                                            //toffset--;
                                            
                                            if(tree->child[0]->child[1]->child[1] != NULL)
                                            {
                                                tree->child[0]->child[1]->child[1]->generated = true;
                                                tree->child[0]->child[1]->child[1]->pop = false;
                                                
                                                
                                                switch(tree->child[0]->child[1]->child[1]->tokenclass)
                                                {
                                                    case CHARCONST:
                                                        emitRM((char *)"LDC", 3, (int)tree->child[0]->child[1]->child[1]->cvalue, 6, (char *)"Load char constant");
                                                        break;
                                                    case STRINGCONST:
                                                        break;
                                                    case NUMCONST:
                                                    case BOOLCONST:
                                                        emitRM((char *)"LDC", 3, tree->child[0]->child[1]->child[1]->value, 6, (char *)"Load integer constant");
                                                        break;
                                                }
                                                
                                                emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                                                
                                                emitRO((char *)"SUB", 3, 4, 3, (char *)"Compute location from index");
                                                
                                                emitRM((char *)"LD", 3, 0, 3, (char *)"Load array element");
                                                
                                                toffset++;
                                                emitComment((char *)"TOFF inc: ", (int *) toffset);
                                            }
                                        }
                                        return;
                                    }
                                }
                            }
                        }
                    }
                    
                    if(tree->child[0] != NULL)
                    {
                        if(tree->child[0]->child[0] != NULL)
                        {
                            /*
                             .   .   Sibling: 2  Call: outputb of type void [line: 9]
                             .   .   .   Child: 0  Op: and of type bool [line: 9]
                             .   .   .   .   Child: 0  Id: x of type bool [mem: Local loc: -2 size: 1] [line: 9]
                             .   .   .   .   Child: 1  Id: y of type bool [mem: Local loc: -3 size: 1] [line: 9]
                             */
                            if(tree->child[0]->child[0]->isArray == false)
                            {
                                /*
                                 .   .   Child: 1  Call: output of type void [line: 4]
                                 .   .   .   Child: 0  Op: chsign of type int [line: 4]
                                 .   .   .   .   Child: 0  Const 666 of type int [line: 4]
                                 */
                                if(tree->child[0]->child[1] == NULL)
                                {
                                    emitComment((char *)"TOFF inc: ", (int *) toffset);
                                
                                    lhs = tree->child[0]->child[0];
                                    // load integer constant
                                    switch(lhs->tokenclass)
                                    {
                                        case CHARCONST:
                                            emitRM((char *)"LDC", 3, (int)lhs->cvalue, 6, (char *)"Load char constant");
                                            break;
                                        case STRINGCONST:
                                            break;
                                        case NUMCONST:
                                        case BOOLCONST:
                                            emitRM((char *)"LDC", 3, lhs->value, 6, (char *)"Load integer constant");
                                            break;
                                    }
                                }
                                else
                                {
                                    lhs = tree->child[0]->child[0];
                                    rhs = tree->child[0]->child[1];
                                    // not an array just an id
                                    emitRM((char *)"LD", 3, lhs->memlocation, 0, (char *)"Load variable", lhs->name);
                                    parmc++;
                                    emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                                    emitRM((char *)"LD", 3, rhs->memlocation , 0, (char *)"Load variable", rhs->name);
                                }
                            }
                        }
                    }
                            
                            
                    if(tree->child[0] != NULL)
                    {
                        parmc++;
                        tree->child[0]->CallParm = true;
                        
                        if(tree->child[0]->nodekind == ExpK && tree->child[0]->subkind.exp == OpK)
                        {
                           // Push Left Side
                           tree->child[0]->child[0]->pop = true;
                           if(tree->child[0]->tokenclass == CHSIGN)
                           {
                               tree->child[0]->child[0]->pop = false;
                               tree->child[0]->child[0]->isUnary = true;
                           }
                        }

                    }
                    
                    if(tree->child[1] != NULL)
                    {
                        parmc++;
                        tree->child[1]->CallParm = true;
                        //tree->generated = true;
                    }
                    
                    if(tree->child[2] != NULL)
                    {
                        parmc++;
                        //tree->child[2]->CallParm = true;
                    }
                    
                   break;
                default:
                    break;
            }
    }
}


void nodegenend(TreeNode *tree, SymbolTable * table)
{
    TreeNode * temp;
    
    if (tree->nodekind == StmtK)
    {
        switch(tree->subkind.stmt)
        {
            case NullK:
                break;
            case IfK:
                break;
            case WhileK:
                break;
            case ForK:
                break;
            case CompoundK:
                if(!tree->noScope)
                {
                    emitComment((char *)"END COMPOUND");
                }
                break;
            case ReturnK:
                break;
            case BreakK:
                break;
            case RangeK:
                break;
            default:
                break;
        }
    }
    else if(tree->nodekind == DeclK)
    {
        //VarK, FuncK, ParamK
        switch(tree->subkind.decl)
        {
            case VarK:
                break;
            case FuncK:
                emitComment((char *)"Add standard closing in case there is no return statement");
                emitRM((char *)"LDC", 2, 0, 6, (char *)"Set return value to 0");
                emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
                emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
                emitRM((char *)"JMP", 7, 0, 3, (char *)"Return");
                emitComment((char *)"END FUNCTION", tree->name);
                backPatchAJumpToHere(entry, (char *)"Jump to init [backpatch]");
                inaFunction = false;
                break;
            case ParamK:
                break;
            default:
                break;
        }
    }
    else // ExpK
    {
        TreeNode * gloVar;
        TreeNode * lhs;
        TreeNode * rhs;
        
        switch(tree->subkind.exp)
            {
                case OpK:

                
                emitComment((char *)"OP ", tree->name);
                //toffset_old;
                // for this case
                /*
                 Child: 0  Op: * of type int [line: 4]
                 .   .   .   .   Child: 0  Const 50 of type int [line: 4]
                 .   .   .   .   Child: 1  Const 13 of type int [line: 4]
                 */
                lhs = tree->child[0];
                rhs = tree->child[1];
                
                switch(tree->tokenclass)
                {
                        case ADD:
                        //load var x
                        // push left side
                        // load variable y
                        pos1 = lhs->memlocation;
                        pos2 = (lhs->isGlobal ? 0 : 1);
                        
                        if(lhs->nodekind == ExpK && lhs->subkind.exp == IdK)
                        {
                            //lhs->memlocation, (lhs->isGlobal ? 0 : 1)
                            emitRM((char *)"LD", 3, pos1, pos2, (char *)"Load variable ", lhs->name);
                            emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                        }
                        
                        pos1 = rhs->memlocation;
                        pos2 = (rhs->isGlobal ? 0 : 1);
                        if(rhs->nodekind == ExpK && rhs->subkind.exp == IdK)
                        {
                            //lhs->memlocation, (lhs->isGlobal ? 0 : 1)
                            emitRM((char *)"LD", 3, pos1, pos2, (char *)"Load variable ", rhs->name);
                        }
                        
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"ADD", 3, 4, 3, (char *)"Op +");
                            break;
                        case SUB:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"SUB", 3, 4, 3, (char *)"Op -");
                            break;
                        case MUL:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            if(tree->child[1] == NULL) // unary
                                emitRM((char *)"LD", 3, 1, 3, (char *)"Load array size"); // size is 1 above index
                            else
                                emitRO((char *)"MUL", 3, 4, 3, (char *)"Op *");
                            break;
                        case DIV:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"DIV", 3, 4, 3, (char *)"Op /");
                            break;
                        case MOD:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"MOD", 3, 4, 3, (char *)"Op %");
                            break;
                        case RAND:
                            emitRO((char *)"RND", 3, 3, 6, (char *)"Op ?");
                            emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                            // push left side
                            tree->child[0]->pop = true;
                            break;
                        case AND:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"AND", 3, 4, 3, (char *)"Op &");
                            break;
                        case OR:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"OR", 3, 4, 3, (char *)"Op |");
                            break;
                        case EQ:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"TEQ", 3, 4, 3, (char *)"Op ==");
                            break;
                        case NEQ:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"TNE", 3, 4, 3, (char *)"Op !=");
                            break;
                        case GEQ:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"TGE", 3, 4, 3, (char *)"Op >=");
                            break;
                        case LEQ:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"TLE", 3, 4, 3, (char *)"Op <=");
                            break;
                        case LT:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"TLT", 3, 4, 3, (char *)"Op <");
                            break;
                        case GT:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"TGT", 3, 4, 3, (char *)"Op >");
                            break;
                        case NOT:
                            emitRM((char *)"LDC", 4, 1, 6, (char *)"Load 1");
                            emitRO((char *)"XOR", 3, 3, 4, (char *)"Logical not");
                            break;
                        case CHSIGN:
                            tree->child[0]->pop = false;
                            emitRO((char *)"NEG", 3, 3, 3, (char *)"Op Unary -");
                }
                    break;
                case ConstantK:
                
                    if(tree->generated == false)
                    {
                        switch(tree->tokenclass)
                        {
                            case CHARCONST:
                                emitRM((char *)"LDC", 3, (int)tree->cvalue, 6, (char *)"Load char constant");
                                break;
                            case STRINGCONST:
                                break;
                            case NUMCONST:
                            case BOOLCONST:
                                emitRM((char *)"LDC", 3, tree->value, 6, (char *)"Load integer constant");
                                //emitComment((char *)"HERE ");
                                break;
                        }
                    }
                    
                    if(tree->isUnary == true)
                    {
                        tree->pop = false;
                    }
                    
                    // see if push left side
                    if(tree->pop == true)
                    {
                        // Push Left Side
                        emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                    }
                    
                    break;
                case IdK:
                     
                    break;
                case AssignK:
                    break;
                case InitK:
                    break;
                case CallK:
                    
                    TreeNode *calltemp;
                    int loc;
                    calltemp = (TreeNode *)table->lookupGlobal(tree->name);
                    if(calltemp != NULL)
                    {
                        loc = calltemp->memlocation - emitSkip(0) - 3;
                    }
                    
                    
                    toffset = toffset_old;
                    
                    emitComment((char *)"Param end ", tree->name);
                    emitRM((char *)"LDA", 1, toffset, 1, (char *)"Ghost frame becomes new active frame");
                    emitRM((char *)"LDA", 3, 1, 7, (char *)"Return address in ac");
                    emitRM((char *)"JMP", 7, loc, 7, (char *)"call", tree->name);
                    emitRM((char *)"LDA", 3, 0, 2, (char *)"save the result in ac");
                    emitComment((char *)"Call end ", tree->name);
                    emitComment((char *)"TOFF set: ");
                    
                    //parmc = 0;
                    break;
                default:
                    break;
            }
    }
    
    if(tree->CallParm == true)
    {
        emitComment((char *)"Param ");
        
        pos1 = tree->memlocation;
        pos2 = (tree->isGlobal ? 0 : 1);
        
        if(tree->nodekind == ExpK && tree->subkind.exp == IdK)
        {
            //lhs->memlocation, (lhs->isGlobal ? 0 : 1)
            emitRM((char *)"LD", 3, pos1, pos2, (char *)"Load variable ", tree->name);
        }
        
        emitRM((char *)"ST", 3, toffset--, 1, (char *)"Push parameter");
        emitComment((char *)"TOFF dec: ");
    }
     
}
