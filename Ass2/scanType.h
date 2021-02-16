#ifndef _SCANTYPE_H_
#define _SCANTYPE_H_
#define MAX_CHILDREN 3
//
//  SCANNER TOKENDATA
//  Sydney Petrehn
//  Feburary 10, 2021
//
struct TokenData {
    int  tokenclass;        // token class
    int  linenum;           // line where found
    char *tokenstr;         // what string was actually read
    char cvalue;            // any character value
    int  nvalue;            // any numeric value or Boolean value
    char *svalue;           // any string value e.g. an id
    int  strlen;            // length of the parsed token
};

typedef enum { STMT_K, EXP_K } NodeKind;
typedef enum { EXPRESSION_K, COMPOUND_K, RETURN_K, BREAK_K, SELECTION_K, ITERATION_K } StmtKind;
typedef enum { OP_K, CONST_K, ID_K } ExpKind;
typedef enum { INT_T, BOOL_T, CHAR_T } ExpType;


class treeNode
{
    public:
    treeNode *children[MAX_CHILDREN];
    treeNode *sibling;
    int index, depth;
    bool isChild, isFirst;
    
    treeNode();
    void printTree();
    void append(treeNode *);
    void addChild(treeNode *, int);
    void setFirst();
    void printPrefix();
    void getData();
};


// ----- need to work with string, expression, function ... -----
// wikipedia said this is a good way for compilers so im going to try it
// Using inheritance for the class treeNode

// consistantly use the same variables for my sanity

// Variables
 class variables: public treeNode
{
    int arrSize;
    int line;
    char *name;
    char *type;
    bool isStatic;
    bool isArray;
    
public:
    variable(tokenData *);
    variable(tokenData *, tokenData *);
    variableA(tokenData *);
    variableA(int, treeNode *, treeNode *);
    void setTypeAndStatic(char *, bool);
    virtual void print();
    virtual void printa();
};

// Functions
class functions: public treeNode
{
    int line;
    char *name;
    char *type;
    bool isArray;
    
public:
    Parm(tokenData *, bool);
    void setType(char *);
    virtual void printParm();
    FunDecl(TokenData *, TokenData *, treeNode *, treeNode *);
    FunDecl(TokenData *, treeNode *, treeNode *);
    virtual void printDecl();
    Call(TokenData *, treeNode *);
    virtual void printCall();
};

// Statmenets
class statement: public treeNode
{
    int line;
    
public:
    CompoundStatement(int, treeNode *, treeNode *);
    virtual void CompoundPrint();
    If(int, treeNode *, treeNode *, treeNode *);
    If(int, treeNode *, treeNode *);
    virtual void IfPrint();
    While(int, treeNode *, treeNode *);
    virtual void WhilePrint();
    Return(int);
    Return(int, treeNode *);
    virtual void ReturnPrint();
    For(int, TokenData *, TokenData *, AST *);
    virtual void ForPrint();
    Break(int);
    virtual void BreakPrint();
};

// expressions
class expression: public treeNode
{
    int type;
    char *str;
    int line;
    TokenData *data;
    
public:
    Relation(TokenData *, treeNode *, treeNode*);
    virtual void printRelation();
    LogicExpression(TokenData *, treeNode *, treeNode *);
    LogicExpression(TokenData *, treeNode *);
    virtual void printLogic();
    Operation(TokenData *, treeNode *, treeNode *);
    Operation(TokenData *, treeNode *);
    virtual void printOper();
    Constant(TokenData *);
    virtual void printConst();

}


#endif
