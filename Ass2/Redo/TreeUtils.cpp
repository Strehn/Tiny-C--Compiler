//
//  TreeUtils.cpp
//  
//
//  Created by Sydney Petrehn on 2/19/21.
//

#include <stdlib.h> // pulls in declaration of malloc, free
#include <string.h> // pulls in declaration for strlen.
#include <string>
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
        // ------ Add Data for New Node -----
        temp->sibling = NULL;
        temp->nodekind = DeclK;
        temp->lineno = token->linenum;
        temp->subkind.decl = kind;
        temp->expType = type;
        temp->child[0] = c0;
        temp->child[1] = c1;
        temp->child[2] = c2;
        
        // ----- Get Data From Token -----
        temp->attr.string = token->svalue;
        temp->attr.name = token->idIndex;
        temp->attr.value = token->nvalue;
        temp->attr.cvalue = token->cvalue;
        temp->attr.tmp = token->tokenstr;
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
        // ------ Add Data for New Node -----
        temp->sibling = NULL;
        temp->nodekind = StmtK;
        temp->lineno = token->linenum;
        temp->subkind.stmt = kind;
        temp->child[0] = c0;
        temp->child[1] = c1;
        temp->child[2] = c2;
        
        // ----- Get Data From Token -----
        
        temp->attr.string = token->svalue;
        temp->attr.name = token->idIndex;
        temp->attr.value = token->nvalue;
        temp->attr.cvalue = token->cvalue;
        temp->attr.tmp = token->tokenstr;
    }
    
    return temp;
}

TreeNode *newExpNode(ExpKind kind,
                     TokenData * token,
                     TreeNode *c0,
                     TreeNode *c1)
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
        // ------ Add Data for New Node -----
        temp->sibling = NULL;
        temp->nodekind = ExpK;
        temp->lineno = token->linenum;
        temp->subkind.exp = kind;
        temp->child[0] = c0;
        temp->child[1] = c1;
        
        // ----- Get Data From Token -----
        
        temp->attr.string = token->svalue;
        temp->attr.name = token->idIndex;
        temp->attr.value = token->nvalue;
        temp->attr.cvalue = token->cvalue;
        temp->attr.tmp = token->tokenstr;
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
    if (t == NULL || c == NULL)
    {
            return;
    }
    else if (t->n_children >= 0 && t->n_children < 3)
    {
            t->child[t->n_children] = c;
            t->n_children++;
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

int childcounter = 0;
int siblingcounter = 0;
int csavedstate;
int ssavedstate;
bool cisFirst = true;
bool sisFirst = true;


// used to keep track if the node being printed is a sibling
bool tisSibling = false;

/* printSpaces indents by printing spaces */
static void printSpaces(void)
{ int i;
  for (i=0;i<indentno;i++)
    printf(".   ");
}

void getType(TreeNode *tree)
{
    switch(tree->expType)
    {
        case 1:
            printf("int ");
            break;
        case 2:
            printf("bool ");
            break;
        case 3:
            printf("char ");
            break;
        case 4:
            printf("string ");
            break;
        default:
            printf("void ");
            break;
    }
}

void printOp(TreeNode *tree)
{
    if(strcmp("=",tree->attr.string)==0)
    {
        printf("Assign: %s [line: %d]\n", tree->attr.string, tree->lineno);
        
    }
    else if(strcmp("++",tree->attr.string)==0)
    {
        printf("Assign: %s [line: %d]\n", tree->attr.name, tree->lineno);
        
    }
    else if(strcmp("==",tree->attr.string)==0)
    {
        printf("Assign: %s [line: %d]\n", tree->attr.string, tree->lineno);
        
    }
    else if(strcmp("--",tree->attr.string)==0)
    {
        printf("Assign: %s [line: %d]\n", tree->attr.string, tree->lineno);
        
    }
    else if(strcmp("+=",tree->attr.string)==0)
    {
        printf("Assign: %s [line: %d]\n", tree->attr.string, tree->lineno);
        
    }
    else if(strcmp("-=",tree->attr.string)==0)
    {
        printf("Assign: %s [line: %d]\n", tree->attr.string, tree->lineno);
        
    }
    else if(strcmp("*=",tree->attr.string)==0)
    {
        printf("Assign: %s [line: %d]\n", tree->attr.string, tree->lineno);
        
    }
    else if(strcmp("-=",tree->attr.string)==0)
    {
        printf("Assign: %s [line: %d]\n", tree->attr.string, tree->lineno);
        
    }
    else if(strcmp("/=",tree->attr.string)==0)
    {
        printf("Assign: %s [line: %d]\n", tree->attr.string, tree->lineno);
        
    }
    else if(strcmp("-",tree->attr.string)==0 && tree->child[0] == NULL)
    {
        printf("Op: chsign [line: %d]\n", tree->lineno);
        
    }
    else
    {
        printf("Op: %s [line: %d]\n", tree->attr.string , tree->lineno);
    }
}

// using recursion print the tree
void printTree(TreeNode *tree)
{
    // ----- Varaibles -----
    int i;
    siblingcounter = 0;
    INDENT;
    
    while (tree != NULL)
    {
        printSpaces();
        
        // ------ If child print out child prefix -----
        
        if(tisChild == true)
        {
            if(cisFirst == true)
            {
                csavedstate = childcounter;
                childcounter = 0;
                cisFirst = false;
            }
            printf("Child: %d  ", childcounter);
            childcounter = csavedstate;
            tisChild = false;
        }
        
        if(tisSibling == true)
        {
            printf("Sibling: %d  ", siblingcounter);
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
        else if (tree->nodekind == ExpK)
        {
            // ExpKind {OpK, ConstantK, IdK, AssignK, InitK, CallK};
            switch (tree->subkind.exp)
            {
                case OpK:
                    printOp(tree);
                    break;
                case ConstantK:
                    printf("Const ");
                    switch(tree->expType)
                    {
                        case Integer:
                            printf("of type int: %d \n", tree->attr.value);
                            break;
                        case Boolean:
                            printf("of type bool %d \n", tree->attr.value);
                            break;
                        case Char:
                            printf("of type char: '%c' \n", tree->attr.cvalue[0]);
                            break;
                        case String:
                            printf("is array of type char: \"%s\" \n", tree->attr.string);
                            break;
                        default:
                            printf("of usassigned type \n");
                    }
                    break;
                case IdK:
                    printf("Id: %s [line: %d]\n", tree->attr.name, tree->lineno);
                    break;
                case AssignK:
                    printf("Assign: %s [line: %d]\n", tree->attr.string, tree->lineno);
                    break;
                case InitK:
                    printf("Op: %s [line: %d]\n", tree->attr.string, tree->lineno);
                    break;
                case CallK:
                    printf("Call: %s [line: %d]\n", tree->attr.tmp, tree->lineno);
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
                    if(tree->isArray == true)
                    {
                        printf("Var: %s is array of type ", tree->attr.tmp);
                    }
                    else
                    {
                        printf("Var: %s of type ", tree->attr.tmp);
                    }
                    getType(tree);
                    printf("[line: %d]\n", tree->lineno);
                    break;
                case FuncK:
                    printf("Func: %s returns type ", tree->attr.string);
                    getType(tree);
                    printf("[line: %d]\n", tree->lineno);
                    break;
                case ParamK:
                    if(tree->isArray)
                    {
                        printf("Param %s is array of type ", tree->attr.string);
                        getType(tree);
                        printf("[line: %d]\n", tree->lineno);
                    }
                    else
                    {
                            printf("Param %s of type ", tree->attr.string);
                            getType(tree);
                            printf("[line: %d]\n", tree->lineno);
                    }
                    break;
                default:
                    printf("Unknown DeclNode kind\n");
                    break;
            }
        }
        else printf("Unknown node kind\n");
        
        if(cisFirst == false)
        {
            cisFirst = true;
        }
        for (i=0;i<MAXCHILDREN;i++)
        {
            if(tree->child[i] != NULL)
            {
                tisChild = true;
                printTree(tree->child[i]);
                childcounter++;
            }
        }
        cisFirst = false;
        childcounter = 0;
        i = 0;
        tisChild = false;
        
        tree = tree->sibling;
        tisSibling = true;
        siblingcounter++;
      }
    
    tisSibling = false;
    UNINDENT;
}

