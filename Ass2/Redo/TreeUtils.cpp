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

TreeNode *newExpNode(ExpKind kind,
                     TokenData * token,
                     TreeNode *c0,
                     TreeNode *c1)
{
    // ----- Variables -----
    c0 = (TreeNode *)malloc(sizeof(TreeNode));
    int i;
    
    for (i=0;i<MAXCHILDREN;i++)
    {
        c0->child[i] = NULL;
    }
    
    // ----- Make the new node and return it to $$ -----
    if( c0 == NULL)
    {
        printf("ERROR(SYSTEM): never add a NULL to a node list. \n");
    }
    else
    {
        switch(kind)
        {
            case OpK:
                c0->attr.op = token->tokenclass;
                break;
            case ConstantK:
                switch(token->tokenclass)
                {
                    case NUMCONST:
                        c0->attr.value = token->nvalue;
                        break;
                    case BOOLCONST:
                        c0->attr.value = token->nvalue;
                        break;
                    case CHARCONST:
                        c0->attr.cvalue = token->cvalue;
                        break;
                    case STRINGCONST:
                        c0->attr.string = token->svalue;
                        break;
                }
                break;
            case IdK:
                c0->attr.string = token->svalue;
                break;
            case AssignK:
                c0->attr.string = token->svalue;
                break;
            case InitK:
                c0->attr.string = token->svalue;
                break;
            case CallK:
                c0->attr.string = token->svalue;
                break;
               
        }
        c0->child[0] = c1;
    }
    
    return c0;
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

int childcounter = 0;
int siblingcounter = 0;
int savedstate;
bool isFirst = true;

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
        case 5:
            printf("void ");
            break;
        case 6:
            printf("charint ");
            break;
        case 7:
            printf("equal ");
            break;
    }
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
            if(isFirst == true)
            {
                savedstate = childcounter;
                childcounter = 0;
                isFirst = false;
            }
            printf("Child: %d ", childcounter);
            childcounter = savedstate;
            tisChild = false;
        }
        
        if(tisSibling == true)
        {
            printf("Sibling: %d ", siblingcounter);
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
                    /*
                    if((tree->attr.string == "=") || (tree->attr.string == "++") || (tree->attr.string == "--") || (tree->attr.string == "+=") || (tree->attr.string == "-=")
                    || (tree->attr.string == "*=")|| (tree->attr.string == "/="))
                            printf("Assign: %s [line: %d]\n", tree->attr.string, tree->lineno);
                        else if((tree->attr.string == "-") && tree->child[0] == NULL) // if there is no right child then it's unary minus
                            printf("Op: chsign [line: %d]\n", tree->lineno);
                        else
                            printf("Op: %s [line: %d]\n", tree->attr.string , tree->lineno);
                     */
                    break;
                case ConstantK:
                    printf("Const ");
                    switch(tree->expType)
                    {
                        case Char:
                            if(strcmp("\'\\n\'",tree->attr.cvalue)==0)
                            {
                                printf("char: '\n' [line: %d]\n", tree->lineno);
                                
                            }
                            else if(strcmp("\'\\t\'",tree->attr.cvalue)==0)
                            {
                                printf("char: 't' [line: %d]\n", tree->lineno);
                                
                            }
                            else if(strcmp((char*)"\'\\\'\'",tree->attr.cvalue)==0)
                            {
                                printf("char: '%c' [line: %d]\n",'\'', tree->lineno);
                                
                            }
                            else if(strcmp((char*)"\'\\0\'",tree->attr.cvalue)==0)
                            {
                                printf("char: '%c' [line: %d]\n",'\0', tree->lineno);
                                
                            }
                            else if(strcmp( (char*)"\'\\\"\'", tree->attr.cvalue) ==0)
                            {
                                printf("char: '%c' [line: %d]\n",'\"', tree->lineno);}
                                                            
                            else
                            {
                                printf("char: %s [line: %d]\n", tree->attr.cvalue, tree->lineno);
                            }
                            break;
                        case String:
                                printf("is array of type char: %s [line: %d]\n", tree->attr.string,  tree->lineno);
                                break;
                        case Integer:
                                printf("of type int: %d [line: %d]\n", tree->attr.value,  tree->lineno);
                                break;
                        case Boolean:
                                printf("of type bool: %s [line: %d]\n", tree->attr.cvalue, tree->lineno);
                                break;
                        default:
                                printf("Should not reach this");
                    }
                    break;
                case IdK:
                        printf("Id: %s [line: %d]\n", tree->attr.string, tree->lineno);
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
                    printf("Var: %s of type ", tree->attr.string);
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
        
        if(isFirst == false)
        {
            isFirst = true;
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
        isFirst = false;
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

