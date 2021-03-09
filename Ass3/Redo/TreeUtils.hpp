//
//  TreeUtils.hpp
//  
//
//  Created by Sydney Petrehn on 2/19/21.
//

#ifndef TreeUtils_hpp
#define TreeUtils_hpp

#include <stdio.h>
#include "scanType.h"


# define MAXCHILDREN 3
// Global Operators
// the exact type of the token or node involved.  These are divided into
// various "kinds" in the enums that follow


// Kinds of Operators
// these are the token numbers for the operators same as in flex
typedef int OpKind;

// Kinds of Statements
//typedef enum {DeclK, StmtK, ExpK} NodeKind;
enum NodeKind {DeclK, StmtK, ExpK};

// Subkinds of Declarations
enum DeclKind {VarK, FuncK, ParamK};

// Subkinds of Statements
enum  StmtKind {NullK, IfK, WhileK, ForK, CompoundK, ReturnK, BreakK, RangeK};

// Subkinds of Expressions
enum ExpKind {OpK, ConstantK, IdK, AssignK, InitK, CallK};

// ExpType is used for type checking (Void means no type or value, UndefinedType means undefined)
enum ExpType {Void, Integer, Boolean, Char, String, CharInt, Equal, UndefinedType};

// What kind of scoping is used?  (decided during typing)
enum VarKind {None, Local, Global, Parameter, LocalStatic};

// example code given
typedef struct treeNode
{
    // connectivity in the tree
    struct treeNode *child[MAXCHILDREN];   // children of the node
    struct treeNode *sibling;              // siblings for the node

    // what kind of node
    int lineno;                            // linenum relevant to this node
    NodeKind nodekind;                     // type of this node
    union                                  // subtype of type
    {
    DeclKind decl;                     // used when DeclK
    StmtKind stmt;                     // used when StmtK
    ExpKind exp;                       // used when ExpK
    } subkind;
    
    // extra properties about the node depending on type of the node
    // union is all one collective memory space, can only have one thing stored in here
    //union                                  // relevant data to type -> attr
    //{
        int value;                         // used when an integer constant or boolean
        char cvalue;               // used when a character
        char *string;                      // used when a string constant
        char *name;                        // used when IdK
        char *tmp;
   // } attr;
    
    int tokenclass;                         // type of token (same as in bison)
    ExpType expType;                   // used when ExpK for type checking
    int aSize;
    bool isArray;                          // is this an array
    bool isStatic;                         // is staticly allocated?
    int n_children;
    bool isUsed;
    bool isInitialized;
    bool noScope;
    bool funcCompound;

    // even more semantic stuff will go here in later assignments.
} TreeNode;


TreeNode *newDeclNode(DeclKind kind,
                      ExpType type,
                      TokenData *token=NULL,
                      TreeNode *c0=NULL,
                      TreeNode *c1=NULL,
                      TreeNode *c2=NULL);

TreeNode *newStmtNode(StmtKind kind,
                      TokenData *token,
                      TreeNode *c0=NULL,
                      TreeNode *c1=NULL,
                      TreeNode *c2=NULL);

TreeNode *newExpNode(ExpKind kind,
                     TokenData *token,
                     TreeNode *c0=NULL,
                     TreeNode *c1=NULL);

TreeNode *addSibling(TreeNode *t, TreeNode *s);

void addChild(TreeNode *t, TreeNode *c);

void setType(TreeNode *t, ExpType type, bool isStatic);

static void printSpaces(void);

void printTree(TreeNode *tree);



#endif /* TreeUtils_hpp */
