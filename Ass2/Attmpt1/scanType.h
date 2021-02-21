#ifndef _SCANTYPE_H_
#define _SCANTYPE_H_

#define MAX_CHILDREN 3
//
//  SCANNER TOKENDATA
//  Sydney Petrehn
//  Feburary 10, 2021
//

#include <iostream>
#include <stdbool.h>
#include <string>
#include <string.h>



struct TokenData {
    int  tokenclass;        // token class
    int  linenum;           // line where found
    char *tokenstr;         // what string was actually read
    char cvalue;            // any character value
    int  nvalue;            // any numeric value or Boolean value
    char *svalue;           // any string value e.g. an id
    int  strlen;            // length of the parsed token
};

class treeNode
{
public:
    treeNode *children[MAX_CHILDREN];
    treeNode *sibling;
    int index, depth;
    bool isChild, isFirst;
    
    treeNode();
    virtual void printTree();
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
// need to be sepeate functions so I can call them to do things initially

// ----- Variables -----

 class Var: public treeNode
{
    int arrSize;
    int line;
    char *name;
    char *type;
    bool isStatic;
    bool isArray;
    
public:
    Var(TokenData *);
    Var(TokenData *, TokenData *);
    void setTypeAndStatic(char *, bool);
    virtual void print();
};

class VarAccess: public treeNode
{

    char *name;
    bool isArray;
    int line;

public:
    VarAccess(TokenData *);
    VarAccess(int, treeNode *, treeNode *);
    virtual void print();
};



// Functions
class Parm: public treeNode
{
    int line;
    char *name;
    char *type;
    bool isArray;
    
public:
    Parm(TokenData *, bool);
    void setType(char *);
    virtual void print();
};

class FunDecl: public treeNode
{
    int line;
    char *name;
    char *type;
    bool isArray;
    
public:
    FunDecl(TokenData *, TokenData *, treeNode *, treeNode *);
    FunDecl(TokenData *, treeNode *, treeNode *);
    virtual void print();
    
};
    
class Call: public treeNode
{
    int line;
    char *name;
    char *type;
    bool isArray;
        
public:
    Call(TokenData *, treeNode *);
    virtual void print();

};

// Statmenets
class CompoundStatement: public treeNode
{
    int line;
    
public:
    CompoundStatement(int, treeNode *, treeNode *);
    virtual void Print();   
};

class If: public treeNode
{
    int line;
    
public:
    If(int, treeNode *, treeNode *);
    If(int, treeNode *, treeNode *, treeNode *);
    virtual void Print();
};

class WHILe: public treeNode
{
    int line;
    
public:
    WHILe(int, treeNode *, treeNode *);
    virtual void Print();
};

class Range: public treeNode
{
    int line;
    
public:
    Range(int, treeNode *, treeNode *);
    Range(int, treeNode *, treeNode *, treeNode *);
    virtual void Print();
};


class Return: public treeNode
{
    int line;
    
public:
    Return(int);
    Return(int, treeNode *);
    virtual void Print();
    
};

class For: public treeNode
{
    int line;
    
public:
    For(int, TokenData *, treeNode *, treeNode *);
    virtual void Print();
};

class Break: public treeNode
{
    int line;
    
public:
    
    Break(int);
    virtual void Print();
    
};

// expressions
class Relation: public treeNode
{
    int type;
    char *str;
    int line;
    TokenData *data;
    
public:
    Relation(TokenData *, treeNode *, treeNode*);
    virtual void print();

};

class LogicExpression: public treeNode
{
    int type;
    char *str;
    int line;
    TokenData *data;
    
public:
    LogicExpression(TokenData *, treeNode *, treeNode *);
    LogicExpression(TokenData *, treeNode *);
    virtual void print();
    
};

class Operation: public treeNode
{
    int type;
    char *str;
    int line;
    TokenData *data;
    
public:
    Operation(TokenData *, treeNode *, treeNode *);
    Operation(TokenData *, treeNode *);
    virtual void print();
    
};

class Constant: public treeNode
{
    int type;
    char *str;
    int line;
    TokenData *data;
    
public:
    Constant(TokenData *);
    virtual void print();
    
};


#endif
