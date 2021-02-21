//
//  TreeUtils.cpp
//  
//
//  Created by Sydney Petrehn on 2/19/21.
//

#include <stdlib.h> // pulls in declaration of malloc, free
#include <string.h> // pulls in declaration for strlen.

#include <iostream>
#include "TreeUtils.hpp"
#include "parser.tab.h"

using namespace std;

extern int line;

TreeNode *newDeclNode(DeclKind kind,
                      ExpType type,
                      TokenData *token,
                      TreeNode *c0,
                      TreeNode *c1,
                      TreeNode *c2)
{
    // ----- Variables -----
    TreeNode *temp = (TreeNode *)malloc(sizeof(TreeNode));
    int i;
    // ----- Make the new node and return it to $$ -----
    if( temp == NULL)
    {
        printf("ERROR(SYSTEM): never add a NULL to a node list. \n");
    }
    else
    {
        for (i=0;i<MAXCHILDREN;i++)
        {
            temp->child[i] = NULL;
        }
        temp->sibling = NULL;
        temp->nodekind = DeclK;
        temp->attr.string = token->tokenstr;
        temp->attr.name = token->svalue;
        temp->lineno = token->linenum;
        temp->subkind.decl = kind;
        temp->child[0] = c0;
        temp->child[1] = c1;
        temp->child[2] = c2;
    }
    
    return temp;
    
}

TreeNode *newStmtNode(StmtKind kind,
                      TokenData *token,
                      TreeNode *c0,
                      TreeNode *c1,
                      TreeNode *c2)
{
    
    // ----- Variables -----
    TreeNode *temp = (TreeNode *)malloc(sizeof(TreeNode));
    int i;
    // ----- Make the new node and return it to $$ -----
    if( temp == NULL)
    {
        printf("ERROR(SYSTEM): never add a NULL to a node list. \n");
    }
    else
    {
        for (i=0;i<MAXCHILDREN;i++)
        {
            temp->child[i] = NULL;
        }
        temp->sibling = NULL;
        temp->nodekind = StmtK;
        temp->lineno = token->linenum;
        temp->attr.string = token->tokenstr;
        temp->attr.name = token->svalue;
        temp->subkind.stmt = kind;
        temp->child[0] = c0;
        temp->child[1] = c1;
        temp->child[2] = c2;
    }
    
    return temp;
}

TreeNode *newExpNode(ExpKind kind)
{
    // ----- Variables -----
    TreeNode *temp = (TreeNode *)malloc(sizeof(TreeNode));
    int i;
    
    // ----- Make the new node and return it to $$ -----
    if( temp == NULL)
    {
        printf("ERROR(SYSTEM): never add a NULL to a node list. \n");
    }
    else
    {
        for (i=0;i<MAXCHILDREN;i++)
        {
            temp->child[i] = NULL;
        }
        temp->sibling = NULL;
        temp->nodekind = ExpK;
        temp->lineno = line;
        temp->expType = Void;
        
        temp->subkind.exp = kind;
    }
    
    return temp;
}

// add a TreeNode to a list of siblings.
// Adding a NULL to the list is probably a programming error!
TreeNode *addSibling(TreeNode *t, TreeNode *s)
{
    if (s==NULL) {
        printf("ERROR(SYSTEM): never add a NULL to a sibling list.\n");
    }
    if (t!=NULL) {
        TreeNode *tmp;

        tmp = t;
        while (tmp->sibling!=NULL) tmp = tmp->sibling;
        tmp->sibling = s;
        return t;
    }
    return s;
}

void addChild(TreeNode *t, TreeNode *c)
{
    int i;
    if (t!=NULL) {
        TreeNode *tmp;

        tmp = t;
        while (tmp->child[i]!=NULL)
        {
            tmp = tmp->child[i+1];
            i++;
        }
        tmp->child[i] = c;
    }
}

// pass the static and type attribute down the sibling list
void setType(TreeNode *t, ExpType type, bool isStatic)
{
    while (t) {
        t->expType = type;
        t->isStatic = isStatic;

        t = t->sibling;
    }
}

/* Variable indentno is used by printTree to
 * store current number of spaces to indent
 */
static int indentno = -1;

/* macros to increase/decrease indentation */
#define INDENT indentno+=1
#define UNINDENT indentno-=1

// used to keep track if the node being printed is a child
bool tisChild = false;

// used to keep track if the node being printed is a sibling
bool tisSibling = false;

/* printSpaces indents by printing spaces */
static void printSpaces(void)
{ int i;
  for (i=0;i<indentno;i++)
    printf(".   ");
}

// using recursion print the tree
void printTree(TreeNode *tree)
{
    // ----- Varaibles -----
    int i;
    
    INDENT;
    
    while (tree != NULL)
    {
        printSpaces();
        
        // ------ If child print out child prefix -----
        
        if(tisChild == true)
        {
            printf("Child: [%d] ", i);
            tisChild = false;
        }
        
        if(tisSibling == true)
        {
            printf("Sibling: ");
            tisSibling = false;
        }

        if (tree->nodekind==StmtK)
        {
            // StmtKind {NullK, IfK, WhileK, ForK, CompoundK, ReturnK, BreakK, RangeK};
            switch (tree->subkind.stmt)
            {
                case NullK:
                    printf("Null [line: %d]\n", tree->lineno);
                    break;
                case IfK:
                    printf("If [line: %d]\n", tree->lineno);
                    break;
                case WhileK:
                    printf("While [line: %d]\n", tree->lineno);
                    break;
                case ForK:
                    printf("For [line: %d]\n", tree->lineno);
                    break;
                case CompoundK:
                    printf("Compound [line: %d]\n", tree->lineno);
                    break;
                case ReturnK:
                    printf("Return [line: %d]\n", tree->lineno);
                    break;
                case BreakK:
                    printf("Break [line: %d]\n", tree->lineno);
                    break;
                case RangeK:
                    printf("Range [line: %d]\n", tree->lineno);
                    break;
                default:
                    printf("Unknown ExpNode kind\n");
                    break;
            }
        }
        else if (tree->nodekind==ExpK)
        {
            // ExpKind {OpK, ConstantK, IdK, AssignK, InitK, CallK};

            switch (tree->subkind.exp)
            {
                case OpK:
                    if((tree->attr.string == "=") || (tree->attr.string == "++") || (tree->attr.string == "--") || (tree->attr.string == "+=") || (tree->attr.string == "-=")
                    || (tree->attr.string == "*=")|| (tree->attr.string == "/="))
                            printf("Assign: %s [line: %d]\n", tree->attr.string, tree->lineno);
                        else if((tree->attr.string == "-") && tree->child[0] == NULL) // if there is no right child then it's unary minus
                            printf("Op: chsign [line: %d]\n", tree->lineno);
                        else
                            printf("Op: %s [line: %d]\n", tree->attr.string , tree->lineno);
                    break;
                case ConstantK:
                    switch(tree->attr.op)
                    {
                        case CHARCONST:
                                printf("Const: '%c' of type %s [line: %d]\n", tree->attr.cvalue, tree->attr.name, tree->lineno);
                                break;
                        case STRINGCONST:
                                std::cout << "Const: \"" << tree->attr.string << "\" of type %s [line: " << tree->attr.name << tree->lineno << "]\n";
                                break;
                        default:
                                printf("Const: %s of type %s [line: %d]\n", tree->attr.string, tree->attr.name, tree->lineno);
                    }
                    break;
                case IdK:
                    if(tree->child[0] == NULL)
                            printf("Id: %s [line: %d]\n", tree->attr.name, tree->lineno);
                        else
                            printf("Op: [ [line: %d]\n", tree->lineno);
                    break;
                case AssignK:
                    printf("Assign: %s [line: %d]\n", tree->attr.name, tree->lineno);
                    break;
                case InitK:
                    printf("Op: %s [line: %d]\n", tree->attr.name, tree->lineno);
                    break;
                case CallK:
                    printf("Call: %s [line: %d]\n", tree->attr.string, tree->lineno);
                    break;
                default:
                    printf("Unknown ExpNode kind\n");
                    break;
            }
        }
        else if (tree->nodekind==DeclK)
        {
            // DeclKind {VarK, FuncK, ParamK};

            switch (tree->subkind.decl)
            {
                case VarK:
                    if(tree->attr.name != "undefined")
                    {
                            if(tree->isArray)
                            {
                                printf("Var: %s is array of type %s [line: %d]\n", tree->attr.string, tree->attr.name, tree->lineno);
                            }
                            else
                            {
                                printf("Var: %s of type %s [line: %d]\n", tree->attr.string, tree->attr.string, tree->lineno);
                            }
                    }
                    else
                    {
                        printf("Var: %s of undefined type [line: %d]\n", tree->attr.string, tree->lineno);
                    }
                    break;
                case FuncK:
                    printf("Func %s returns type %s [line: %d]\n", tree->attr.string, tree->attr.name, tree->lineno);
                    break;
                case ParamK:
                    if(tree->isArray)
                            printf("Param %s is array of type %s [line: %d]\n", tree->attr.string, tree->attr.name, tree->lineno);
                        else
                            printf("Param %s of type %s [line: %d]\n", tree->attr.string, tree->attr.name, tree->lineno);
                        
                    break;
                default:
                    printf("Unknown DeclNode kind\n");
                    break;
            }
        }
        else printf("Unknown node kind\n");
        
        for (i=0;i<MAXCHILDREN;i++)
        {
            if(tree->child[i] != NULL)
            {
                tisChild = true;
                printTree(tree->child[i]);
            }
        }
        
        i = 0;
        tisChild = false;
        tree = tree->sibling;
        tisSibling = true;
      }
    tisSibling = false;
    UNINDENT;
}

