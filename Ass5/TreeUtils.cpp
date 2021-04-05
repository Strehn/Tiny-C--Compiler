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
extern int n_errors;

//{VarK, FuncK, ParamK};
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
        temp->string = token->svalue;
        temp->name = token->idIndex;
        temp->value = token->nvalue;
        temp->cvalue = token->cvalue;
        temp->tmp = token->tokenstr;
        temp->tokenclass = token->tokenclass;
    }
    return temp;
}

//{NullK, IfK, WhileK, ForK, CompoundK, ReturnK, BreakK, RangeK}
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
        temp->string = token->svalue;
        temp->name = token->idIndex;
        temp->value = token->nvalue;
        temp->cvalue = token->cvalue;
        temp->tmp = token->tokenstr;
        temp->tokenclass = token->tokenclass;
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
        temp->string = token->svalue;
        temp->name = token->idIndex;
        temp->value = token->nvalue;
        temp->cvalue = token->cvalue;
        temp->tmp = token->tokenstr;
        temp->tokenclass = token->tokenclass;
    }
    
    return temp;
}



// add a TreeNode to a list of siblings.
// Adding a NULL to the list is probably a programming error!
TreeNode *addSibling(TreeNode *t, TreeNode *s)
{
    if (s==NULL && n_errors == 0)
    {
            printf("ERROR(SYSTEM): never add a NULL to a sibling list.\n");
            exit(1);
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
TreeNode* setType(TreeNode *t, ExpType type, bool isStatic)
{
    TreeNode *temp = t;
    while (t) {
        t->expType = type;
        t->isStatic = isStatic;

        t = t->sibling;
    }
    return temp;
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
int csavedstate = 0;
bool cisFirst = true;
bool sisFirst = false;


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
    switch(tree->tokenclass)
    {
        case EQ:
            printf("Op: == ");
            break;
        case NEQ:
            printf("Op: != ");
            break;
        case LEQ:
            printf("Op: <= ");
            break;
        case GEQ:
            printf("Op: >= ");
            break;
        case ASS:
            printf("Assign: = ");
            break;
        case ADDASS:
            printf("Assign: += ");
            break;
        case SUBASS:
            printf("Assign: -= ");
            break;
        case MULASS:
            printf("Assign: *= ");
            break;
        case DIVASS:
            printf("Assign: /= ");
            break;
        case MAX:
            printf("Op: :>: ");
            break;
        case MIN:
            printf("Op: :<: ");
            break;
        case DEC:
            printf("Assign: -- ");
            break;
        case INC:
            printf("Assign: ++ ");
            break;
        case ADD:
            printf("Op: + ");
            break;
        case SUB:
            printf("Op: - ");
            break;
        case LT:
            printf("Op: < ");
            break;
        case GT:
            printf("Op: > ");
            break;
        case SIZEOF:
            printf("Op: sizeof ");
            break;
        case CHSIGN:
            printf("Op: chsign ");
            break;
        case MUL:
            printf("Op: * ");
            break;
        case DIV:
            printf("Op: / ");
            break;
        case MOD:
            printf("Op: %% ");
            break;
        case RAND:
            printf("Op: ? ");
            break;
        case AND:
            printf("Op: and ");
            break;
        case OR:
            printf("Op: or ");
            break;
        case NOT:
            printf("Op: not ");
            break;
        case SEMICOLON:
            printf("Op: ; ");
            break;
        case COLON:
            printf("Op: : ");
            break;
        case LP:
            printf("Op: ( ");
            break;
        case RP:
            printf("Op: ) ");
            break;
        case LB:
            printf("Op: [ ");
            break;
        case RB:
            printf("Op: ] ");
            break;
        case COMMA:
            printf("Op: add ");
            break;
        case LCB:
            printf("Op: { ");
            break;
        case RCB:
            printf("Op: } ");
            break;
        default:
            printf("Shouldn't be here");
    }
}

// using recursion print the tree
void printTree(TreeNode *tree)
{
    // ----- Varaibles -----
    int i, siblingcounter = 0, ssavedstate = 0;
    INDENT;
    
    while (tree != NULL)
    {
        printSpaces();
        
        // ------ If child print out child prefix -----
        if(tisChild == true)
        {
            if(cisFirst == true)
            {
                cisFirst = false;
                childcounter = 0;
            }
            printf("Child: %d  ", childcounter);
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
                    switch(tree->expType)
                    {
                        case Integer:
                            printf("of type int ");
                            printf("[line: %d]\n", tree->lineno);
                            break;
                        case Boolean:
                            if(tree->value == 1)
                            {
                                printf("of type bool ");
                                printf("[line: %d]\n", tree->lineno);
                            }
                            else
                            {
                                printf("of type bool ");
                                printf("[line: %d]\n", tree->lineno);
                            }
                            break;
                        case Char:
                            printf("of type char ");
                            printf("[line: %d]\n", tree->lineno);
                            break;
                        case String:
                            printf("is array of type char ");
                            printf("[line: %d]\n", tree->lineno);
                            break;
                        default:
                            printf("of undefined type ");
                            printf("[line: %d]\n", tree->lineno);
                    }
                    break;
                case ConstantK:
                    printf("Const ");
                    switch(tree->expType)
                    {
                        case Integer:
                            printf("%d of type int ", tree->value);
                            printf("[line: %d]\n", tree->lineno);
                            break;
                        case Boolean:
                            if(tree->value == 1)
                            {
                                printf("true of type bool ");
                                printf("[line: %d]\n", tree->lineno);
                            }
                            else
                            {
                                printf("false of type bool ");
                                printf("[line: %d]\n", tree->lineno);
                            }
                            break;
                        case Char:
                            if(tree->isArray == true)
                            {
                                printf("is array %s of type char ", tree->string);
                                printf("[line: %d]\n", tree->lineno);
                            }
                            else
                            {
                                printf("'%c' of type char ", tree->cvalue);
                                printf("[line: %d]\n", tree->lineno);
                            }
                            break;
                        case String:
                            break;
                        default:
                            printf("of usassigned type ");
                            printf("[line: %d]\n", tree->lineno);
                    }
                    break;
                case IdK:
                    printf("Id: %s ", tree->tmp);
                    switch(tree->expType)
                    {
                        case Integer:
                            printf("of type int ");
                            printf("[line: %d]\n", tree->lineno);
                            break;
                        case Boolean:
                            if(tree->value == 1)
                            {
                                printf("of type bool ");
                                printf("[line: %d]\n", tree->lineno);
                            }
                            else
                            {
                                printf("of type bool ");
                                printf("[line: %d]\n", tree->lineno);
                            }
                            break;
                        case Char:
                            printf("of type char ");
                            printf("[line: %d]\n", tree->lineno);
                            break;
                        case String:
                            printf("is array of type char: %s ", tree->string);
                            printf("[line: %d]\n", tree->lineno);
                            break;
                        default:
                            printf("of undefined type ");
                            printf("[line: %d]\n", tree->lineno);
                    }
                    break;
                case AssignK:
                    printOp(tree);
                    switch(tree->expType)
                    {
                        case Integer:
                            printf("of type int ");
                            printf("[line: %d]\n", tree->lineno);
                            break;
                        case Boolean:
                            if(tree->value == 1)
                            {
                                printf("of type bool ");
                                printf("[line: %d]\n", tree->lineno);
                            }
                            else
                            {
                                printf("of type bool ");
                                printf("[line: %d]\n", tree->lineno);
                            }
                            break;
                        case Char:
                            printf("of type char ");
                            printf("[line: %d]\n", tree->lineno);
                            break;
                        case String:
                            printf("is array of type char ");
                            printf("[line: %d]\n", tree->lineno);
                            break;
                        default:
                            printf("of usassigned type ");
                            printf("[line: %d]\n", tree->lineno);
                    }
                    break;
                case InitK:
                    printOp(tree);
                    printf("[line: %d]\n", tree->lineno);
                    break;
                case CallK:
                    printf("Call: %s ", tree->tmp);
                    switch(tree->expType)
                    {
                        case Integer:
                            printf("of type int ");
                            printf("[line: %d]\n", tree->lineno);
                            break;
                        case Boolean:
                            if(tree->value == 1)
                            {
                                printf("of type bool ");
                                printf("[line: %d]\n", tree->lineno);
                            }
                            else
                            {
                                printf("of type bool ");
                                printf("[line: %d]\n", tree->lineno);
                            }
                            break;
                        case Char:
                            printf("of type char ");
                            printf("[line: %d]\n", tree->lineno);
                            break;
                        case String:
                            printf("is array of type char ");
                            printf("[line: %d]\n", tree->lineno);
                            break;
                        default:
                            printf("of type void ");
                            printf("[line: %d]\n", tree->lineno);
                    }
                    break;
                default:
                    printf("Unknown ExpNode kind\n");
                    break;
                    
                    printf("[line: %d]\n", tree->lineno);
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
                        printf("Var: %s is array of type ", tree->tmp);
                    }
                    else
                    {
                        printf("Var: %s of type ", tree->tmp);
                    }
                    getType(tree);
                    printf("[line: %d]\n", tree->lineno);
                    break;
                case FuncK:
                    printf("Func: %s returns type ", tree->tmp);
                    getType(tree);
                    printf("[line: %d]\n", tree->lineno);
                    break;
                case ParamK:
                    if(tree->isArray)
                    {
                        printf("Parm: %s is array of type ", tree->tmp);
                        getType(tree);
                        printf("[line: %d]\n", tree->lineno);
                    }
                    else
                    {
                            printf("Parm: %s of type ", tree->tmp);
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
        
        for (i=0;i<MAXCHILDREN;i++)
        {
            if(tree->child[i] != NULL)
            {
                if(i == 0 && cisFirst == false)
                {
                    cisFirst = true;
                }
                childcounter = i;
                tisChild = true;
                printTree(tree->child[i]);
            }
            else
            {
                cisFirst = false;
            }
        }
        cisFirst = false;
        tisChild = false;
        i = 0;
        
        ssavedstate = siblingcounter;
        
        if(tree->sibling != NULL)
        {
            tree = tree->sibling;
            tisSibling = true;
            siblingcounter++;
        }
        else // NULL needs to pass so the while statement gets the null
        {
            siblingcounter = ssavedstate;
            tree = tree->sibling;
        }
        
      
    }
    UNINDENT;
}

