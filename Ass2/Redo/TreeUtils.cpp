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
        temp->attr.string = token->svalue;
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
        temp->attr.string = token->svalue;
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
static int indentno = 0;

/* macros to increase/decrease indentation */
#define INDENT indentno+=2
#define UNINDENT indentno-=2

/* printSpaces indents by printing spaces */
static void printSpaces(void)
{ int i;
  for (i=0;i<indentno;i++)
    printf(".  ");
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
        if (tree->nodekind==StmtK)
        {
            // StmtKind {NullK, IfK, WhileK, ForK, CompoundK, ReturnK, BreakK, RangeK};
            switch (tree->subkind.stmt)
            {
                case NullK:
                    printf("Null\n");
                    break;
                case IfK:
                    printf("If\n");
                    break;
                case WhileK:
                    printf("While\n");
                    break;
                case ForK:
                    printf("For to: \n");
                    break;
                case CompoundK:
                    printf("Read: \n");
                    break;
                case ReturnK:
                    printf("Return\n");
                    break;
                case BreakK:
                    printf("Break\n");
                    break;
                case RangeK:
                    printf("Range\n");
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
                    printf("Op: \n");
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
                    printf("Id: \n");
                    break;
                case AssignK:
                    printf("AssignK: \n");
                    break;
                case InitK:
                    printf("InitK: \n");
                    break;
                case CallK:
                    printf("CallK: \n");
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
                    printf("FuncK: \n");
                    break;
                case ParamK:
                    printf("Id: \n");
                    break;
                default:
                    printf("Unknown DeclNode kind\n");
                    break;
            }
        }
        else printf("Unknown node kind\n");
        
        for (i=0;i<MAXCHILDREN;i++)
        {
             printTree(tree->child[i]);
        }
        
        tree = tree->sibling;
      }
    UNINDENT;
}

