//
//  SymanticAnalysis.cpp
//
//
//  Created by Sydney Petrehn on 3/4/21.
//
#include <stdlib.h> // pulls in declaration of malloc, free
#include <string.h> // pulls in declaration for strlen.
#include <string>
#include <iostream>
#include "Semantic.hpp"
#include "TreeUtils.hpp"
#include "parser.tab.h"

int n_errors = 0;
int n_warnings = 0;

//Functions
void symanticA(TreeNode *tree, SymbolTable *table);
void analyzenode(TreeNode *tree, SymbolTable *table);

void nodestart(TreeNode *tree, SymbolTable *table);
void declStart(TreeNode *tree, SymbolTable *table);
void expStart(TreeNode *tree, SymbolTable *table);
void stmtStart(TreeNode *tree, SymbolTable *table);

void nodeend(TreeNode *tree, SymbolTable *table);
void declend(TreeNode *tree, SymbolTable *table);
void expend(TreeNode *tree, SymbolTable *table);
void stmtend(TreeNode *tree, SymbolTable *table);

char * getsType(TreeNode *tree);


// ----- Function Declaration
void symanticA(TreeNode *tree, SymbolTable *table)
{
    // analyze the tree to add the stuff to the symbol table
    // Analyze Tree
    analyzenode(tree, table);
    
    // Check for Main
    if ( table->lookup("main") == NULL )
        {
            printf("ERROR(LINKER): A function named 'main()' must be defined.\n");
            n_errors++;
        }
}

void analyzenode(TreeNode *tree, SymbolTable *table)
{
    if(tree == NULL)
    {
        printf ("Error, Null Tree Node \n");
        return;
    }
    
    nodestart(tree, table);
    // look at the children
    for(int i = 0; i <3; i++)
    {
        if( (tree->child[i]) != NULL)
        {
            analyzenode(tree->child[i], table);
        }
    }
    
    nodeend(tree, table);
    
    // look at the sibling
    if( (tree->sibling) != NULL)
    {
        analyzenode(tree->sibling, table);
    }
    
    //CHECK FOR IS USED AND INITIALIZED HERE
    //checkUsage(tree, table);
}

void nodestart(TreeNode *tree, SymbolTable *table)
{
    // check which kind it is
    //DeclK, StmtK, ExpK
    if (tree->nodekind == StmtK)
    {
        stmtStart(tree, table);
    }
    else if(tree->nodekind == DeclK)
    {
        declStart(tree, table);
    }
    else // ExpK
    {
        expStart(tree, table);
    }
    
}

void declStart(TreeNode *tree, SymbolTable *table)
{
    if(tree == NULL)
    {
        printf("NULL NODE THAT SHOULD NOT BE NULL\n");
        return;
    }

    //VarK, FuncK, ParamK
    switch(tree->subkind.decl)
    {
        case VarK:
            break;
        case FuncK:
            break;
        case ParamK:
            break;
        default:
            break;
    }
    
}

void expStart(TreeNode *tree, SymbolTable *table)
{
    if(tree == NULL)
        {
            printf("NULL NODE THAT SHOULD NOT BE NULL\n");
            return;
        }
        
        switch(tree->subkind.exp)
            {
                case OpK:
                    break;
                case ConstantK:
                    break;
                case IdK:
                    // lookup in table, save exptype as that type if expType = undefined
                    break;
                case AssignK:
                    break;
                case InitK:
                    break;
                case CallK:
                    break;
                default:
                    break;
            }
        
}

void stmtStart(TreeNode *tree, SymbolTable *table)
{
    if(tree == NULL)
    {
        printf("NULL NODE THAT SHOULD NOT BE NULL\n");
        return;
    }
    
    switch(tree->subkind.stmt)
    {
        case NullK:
            break;
        case IfK:
            table->enter("if");
            for(int i = 0; i < 3; i++)
            {
                if((tree->child[i]))
                {
                    if(tree->child[i]->nodekind == StmtK)
                    {
                        if(tree->child[i]->subkind.stmt == CompoundK)
                        {
                            tree->child[i]->noScope = true;
                        }
                    }
                }
            }
            break;
        case WhileK:
            table->enter("while");
            for(int i = 0; i < 3; i++)
            {
                if((tree->child[i]))
                {
                    if(tree->child[i]->nodekind == StmtK)
                    {
                        if(tree->child[i]->subkind.stmt == CompoundK)
                        {
                            tree->child[i]->noScope = true;
                        }
                    }
                }
            }
            break;
        case ForK:
            table->enter("for");
            for(int i = 0; i < 3; i++)
            {
                if((tree->child[i]))
                {
                    if(tree->child[i]->nodekind == StmtK)
                    {
                        if(tree->child[i]->subkind.stmt == CompoundK)
                        {
                            tree->child[i]->noScope = true;
                        }
                    }
                }
            }
            break;
        case CompoundK:
            if(tree->noScope != true)
            {
                table->enter("compound");
            }
            break;
        case ReturnK:
            if(tree->isArray == true)
            {
                printf("ERROR(%d): Cannot return an array.\n", tree->lineno);
                n_errors++;
            }
            break;
        case BreakK:
            break;
        case RangeK:
            break;
        default:
            break;
    }
}

void nodeend(TreeNode *tree, SymbolTable *table)
{
    // check which kind it is
    //DeclK, StmtK, ExpK
    if (tree->nodekind == StmtK)
    {
        stmtend(tree, table);
    }
    else if(tree->nodekind == DeclK)
    {
        declend(tree, table);
    }
    else // ExpK
    {
        expend(tree, table);
    }
}

void declend(TreeNode *tree, SymbolTable *table)
{
    if(tree == NULL)
    {
        printf("NULL NODE THAT SHOULD NOT BE NULL\n");
        return;
    }
    
    //VarK, FuncK, ParamK
    switch(tree->subkind.decl)
    {
        case VarK:
            tree->isInitialized = true;
            break;
        case FuncK:
            break;
        case ParamK:
            break;
        default:
            break;
    }
}

void expend(TreeNode *tree, SymbolTable *table)
{
    
    if(tree == NULL)
    {
        printf("NULL NODE THAT SHOULD NOT BE NULL\n");
        return;
    }
    
    char * lhs_type = NULL;
    char * rhs_type = NULL;
    
    TreeNode * temp = NULL;
    
    if(tree->child[0] != NULL)
    {
        if(tree->child[0]->nodekind == DeclK)
        {
            if(tree->child[0]->subkind.decl == FuncK)
            {
                printf("ERROR(%d): Cannot use function '%s' as a variable.\n", tree->lineno, tree->child[0]->name);
                n_errors++;
            }
        }
        
        if(tree->child[0]->subkind.exp == IdK)
        {
            temp = (TreeNode *)table->lookup(tree->child[0]->name);
            if(temp != NULL)
            {
                lhs_type = getsType(temp);
            }
        }
        else
        {
            lhs_type = getsType(tree->child[0]);
        }
    }
    else // child is null
    {
        lhs_type = (char *)"undefined";
    }
    
    
    if(tree->child[1] != NULL)
    {
        if(tree->child[1]->nodekind == DeclK)
        {
            if(tree->child[1]->subkind.decl == FuncK)
            {
                printf("ERROR(%d): Cannot use function '%s' as a variable.\n", tree->lineno, tree->child[1]->name);
                n_errors++;
            }
        }
        
        if(tree->child[1]->subkind.exp == IdK)
        {
            temp = (TreeNode *)table->lookup(tree->child[1]->name);
            if(temp != NULL)
            {
                rhs_type = getsType(temp);
            }
        }
        else
        {
            rhs_type = getsType(tree->child[1]);
        }
    }
    else // child 1 is null
    {
        rhs_type = (char *)"undefined";
    }
   
    
    //{OpK, ConstantK, IdK, AssignK, InitK, CallK}
    if( (tree->subkind.exp == OpK) || (tree->subkind.exp == InitK) || (tree->subkind.exp == AssignK) )
    {
        tree->isInitialized = true;
    //switch(tree->subkind.exp)
    //{
        //case OpK:
            switch(tree->tokenclass)
            {
                case EQ:
                    if(tree->child[0] != NULL && tree->child[1] != NULL)
                    {
                        if(tree->child[0]->expType == UndefinedType || tree->child[1]->expType == UndefinedType)
                        {
                            tree->child[0]->isUsed = true;
                            tree->child[1]->isUsed = true;
                        }
                        if(tree->child[0]->expType != tree->child[1]->expType)
                        {
                            printf("ERROR(%d): '==' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                            n_errors++;
                        }
                    }
                    break;
                case NEQ:
                    if(tree->child[0] != NULL && tree->child[1] != NULL)
                    {
                        if(tree->child[0]->expType == UndefinedType || tree->child[1]->expType == UndefinedType)
                        {
                            tree->child[0]->isUsed = true;
                            tree->child[1]->isUsed = true;
                            return;
                        }
                        if(tree->child[0]->expType != tree->child[1]->expType)
                        {
                            printf("ERROR(%d): '!=' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                            n_errors++;
                        }
                    }
                    break;
                case LEQ:
                    if(tree->child[0] != NULL && tree->child[1] != NULL)
                    {
                        if(tree->child[0]->expType == UndefinedType || tree->child[1]->expType == UndefinedType)
                        {
                            tree->child[0]->isUsed = true;
                            tree->child[1]->isUsed = true;
                            return;
                        }
                        if(tree->child[0]->expType != tree->child[1]->expType)
                        {
                            printf("ERROR(%d): '<=' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                            n_errors++;
                        }
                    }
                    
                    // check for array
                    if((tree->child[0] != NULL && tree->child[0]->isArray == true) && (tree->child[1]!= NULL && tree->child[1]->isArray == false))
                    {
                        printf("ERROR(%d): '<=' requires both operands be arrays or not but lhs is an array and rhs is not an array. \n", tree->lineno);
                        n_errors++;
                    }

                    else if((tree->child[0] != NULL && tree->child[0]->isArray == false) && (tree->child[1]!= NULL && tree->child[1]->isArray == true))
                    {
                        printf("ERROR(%d): '<=' requires both operands be arrays or not but lhs is not an array and rhs is an array. \n", tree->lineno);
                        n_errors++;
                    }
                    break;
                case GEQ:
                    if(tree->child[0] != NULL && tree->child[1] != NULL)
                    {
                        if(tree->child[0]->expType == UndefinedType || tree->child[1]->expType == UndefinedType)
                        {
                            tree->child[0]->isUsed = true;
                            tree->child[1]->isUsed = true;
                            return;
                        }
                        if(tree->child[0]->expType != tree->child[1]->expType)
                        {
                            printf("ERROR(%d): '>=' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                            n_errors++;
                        }
                    }
                    
                    // check for array
                    if((tree->child[0] != NULL && tree->child[0]->isArray == true) && (tree->child[1]!= NULL && tree->child[1]->isArray == false))
                    {
                        printf("ERROR(%d): '>=' requires both operands be arrays or not but lhs is an array and rhs is not an array. \n", tree->lineno);
                        n_errors++;
                    }

                    else if((tree->child[0] != NULL && tree->child[0]->isArray == false) && (tree->child[1]!= NULL && tree->child[1]->isArray == true))
                    {
                        printf("ERROR(%d): '>=' requires both operands be arrays or not but lhs is not an array and rhs is an array. \n", tree->lineno);
                        n_errors++;
                    }
                    break;
                case ASS:
                    if(tree->child[0] != NULL && tree->child[1] != NULL)
                    {
                        if(tree->child[0]->expType == UndefinedType || tree->child[1]->expType == UndefinedType)
                        {
                            tree->child[0]->isUsed = true;
                            tree->child[1]->isUsed = true;
                        }
                        if(tree->child[0]->expType != tree->child[1]->expType)
                        {
                            printf("ERROR(%d): '=' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                            n_errors++;
                        }
                    }
                    
                    // check for array
                    if((tree->child[0] != NULL && tree->child[0]->isArray == true) && (tree->child[1]!= NULL && tree->child[1]->isArray == false))
                    {
                        printf("ERROR(%d): '==' requires both operands be arrays or not but lhs is an array and rhs is not an array. \n", tree->lineno);
                        n_errors++;
                    }

                    else if((tree->child[0] != NULL && tree->child[0]->isArray == false) && (tree->child[1]!= NULL && tree->child[1]->isArray == true))
                    {
                        printf("ERROR(%d): '==' requires both operands be arrays or not but lhs is not an array and rhs is an array. \n", tree->lineno);
                        n_errors++;
                    }
                    break;
                case ADDASS:
                    
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Integer) )
                    {
                        printf("ERROR(%d): '+=' requires operands of type int but lhs is of type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( (tree->child[1] != NULL && tree->child[1]->expType != Integer) )
                    {
                        printf("ERROR(%d): '+=' requires operands of type int but lhs is of type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                    
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                        tree->child[0]->isInitialized = true;
                    }
                    if(tree->child[1] != NULL)
                    {
                        tree->child[1]->isUsed = true;
                        tree->child[1]->isInitialized = true;
                    }
                    break;
                case SUBASS:
                          
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Integer) )
                    {
                        printf("ERROR(%d): '-=' requires operands of type int but lhs is of type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( (tree->child[1] != NULL && tree->child[1]->expType != Integer) )
                    {
                        printf("ERROR(%d): '-=' requires operands of type int but lhs is of type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                        tree->child[0]->isInitialized = true;
                    }
                    if(tree->child[1] != NULL)
                    {
                        tree->child[1]->isUsed = true;
                        tree->child[1]->isInitialized = true;
                    }
                    break;
                case MULASS:
                    
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Integer) )
                    {
                        printf("ERROR(%d): '*=' requires operands of type int but lhs is of type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( (tree->child[1] != NULL && tree->child[1]->expType != Integer) )
                    {
                        printf("ERROR(%d): '*=' requires operands of type int but lhs is of type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                        tree->child[0]->isInitialized = true;
                    }
                    if(tree->child[1] != NULL)
                    {
                        tree->child[1]->isUsed = true;
                        tree->child[1]->isInitialized = true;
                    }
                    break;
                case DIVASS:
        
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Integer) )
                    {
                        printf("ERROR(%d): '/=' requires operands of type int but lhs is of type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( (tree->child[1] != NULL && tree->child[1]->expType != Integer) )
                    {
                        printf("ERROR(%d): '/=' requires operands of type int but lhs is of type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                        tree->child[0]->isInitialized = true;
                    }
                    if(tree->child[1] != NULL)
                    {
                        tree->child[1]->isUsed = true;
                        tree->child[1]->isInitialized = true;
                    }
                    break;
                case MAX:
                    if(tree->child[0] != NULL && tree->child[1] != NULL)
                    {
                        if(tree->child[0]->expType == UndefinedType || tree->child[1]->expType == UndefinedType)
                        {
                            tree->child[0]->isUsed = true;
                            tree->child[1]->isUsed = true;
                            return;
                        }
                        if(tree->child[0]->expType != tree->child[1]->expType)
                        {
                            printf("ERROR(%d): ':>:' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                            n_errors++;
                        }
                    }
                    break;
                case MIN:
                    if(tree->child[0] != NULL && tree->child[1] != NULL)
                    {
                        if(tree->child[0]->expType == UndefinedType || tree->child[1]->expType == UndefinedType)
                        {
                            tree->child[0]->isUsed = true;
                            tree->child[1]->isUsed = true;
                            return;
                        }
                        if(tree->child[0]->expType != tree->child[1]->expType)
                        {
                            printf("ERROR(%d): ':<:' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                            n_errors++;
                        }
                    }
                    break;
                case DEC:
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Integer) )
                    {
                        printf("ERROR(%d): '--' requires operands of type int but lhs is of type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( (tree->child[1] != NULL && tree->child[1]->expType != Integer) )
                    {
                        printf("ERROR(%d): '--' requires operands of type int but lhs is of type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                    }
                    if(tree->child[1] != NULL)
                    {
                        tree->child[1]->isUsed = true;
                    }
                    break;
                case INC:
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Integer) )
                    {
                        printf("ERROR(%d): '++' requires operands of type int but lhs is of type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( (tree->child[1] != NULL && tree->child[1]->expType != Integer) )
                    {
                        printf("ERROR(%d): '++' requires operands of type int but lhs is of type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                    }
                    if(tree->child[1] != NULL)
                    {
                        tree->child[1]->isUsed = true;
                    }
                    break;
                case ADD:
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Integer) )
                    {
                        printf("ERROR(%d): '+' requires operands of type int but lhs is of type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( (tree->child[1] != NULL && tree->child[1]->expType != Integer) )
                    {
                        printf("ERROR(%d): '+' requires operands of type int but lhs is of type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                    }
                    if(tree->child[1] != NULL)
                    {
                        tree->child[1]->isUsed = true;
                    }
                    break;
                case SUB:
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Integer) )
                    {
                        printf("ERROR(%d): '-' requires operands of type int but lhs is of type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( (tree->child[1] != NULL && tree->child[1]->expType != Integer) )
                    {
                        printf("ERROR(%d): '-' requires operands of type int but lhs is of type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                    }
                    if(tree->child[1] != NULL)
                    {
                        tree->child[1]->isUsed = true;
                    }
                    break;
                case LT:
                    if(tree->child[0] != NULL && tree->child[1] != NULL)
                    {
                        if(tree->child[0]->expType == UndefinedType || tree->child[1]->expType == UndefinedType)
                        {
                            tree->child[0]->isUsed = true;
                            tree->child[1]->isUsed = true;
                            return;
                        }
                        if(tree->child[0]->expType != tree->child[1]->expType)
                        {
                            printf("ERROR(%d): '<' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                            n_errors++;
                        }
                    }
                    break;
                case GT:
                    if(tree->child[0] != NULL && tree->child[1] != NULL)
                    {
                        if(tree->child[0]->expType == UndefinedType || tree->child[1]->expType == UndefinedType)
                        {
                            tree->child[0]->isUsed = true;
                            tree->child[1]->isUsed = true;
                            return;
                        }
                        if(tree->child[0]->expType != tree->child[1]->expType)
                        {
                            printf("ERROR(%d): '>' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                            n_errors++;
                        }
                    }
                    break;
                case SIZEOF:
                    if(tree->child[0]->isArray == false)
                    {
                        printf("ERROR(%d): The operation 'sizeof' only works with arrays.\n", tree->lineno);
                        n_errors++;
                    }
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Integer) )
                    {
                        printf("ERROR(%d): Unary 'sizeof' requires an operand of type int but was given type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                    }
                   
                    break;
                case CHSIGN:
                    
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Integer) )
                    {
                        printf("ERROR(%d): Unary 'chsign' requires an operand of type int but was given type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                    }
                    break;
                case MUL:
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Integer) )
                    {
                        printf("ERROR(%d): '*' requires operands of type int but lhs is of type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( (tree->child[1] != NULL && tree->child[1]->expType != Integer) )
                    {
                        printf("ERROR(%d): '*' requires operands of type int but lhs is of type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                    }
                    if(tree->child[1] != NULL)
                    {
                        tree->child[1]->isUsed = true;
                    }
                    break;
                case DIV:
                    if(tree->child[0]->isArray == true)
                    {
                        printf("ERROR(%d): The operation '/' does not work with arrays.\n", tree->lineno);
                        n_errors++;
                    }
                    else if(tree->child[1]->isArray == true)
                    {
                        printf("ERROR(%d): The operation '/' does not work with arrays.\n", tree->lineno);
                        n_errors++;
                    }
                    
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Integer) )
                    {
                        printf("ERROR(%d): '/' requires operands of type int but lhs is of type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( (tree->child[1] != NULL && tree->child[1]->expType != Integer) )
                    {
                        printf("ERROR(%d): '/' requires operands of type int but lhs is of type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                    
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                    }
                    if(tree->child[1] != NULL)
                    {
                        tree->child[1]->isUsed = true;
                    }
                    break;
                case MOD:
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Integer) )
                    {
                        printf("ERROR(%d): '%%' requires operands of type int but lhs is of type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( (tree->child[1] != NULL && tree->child[1]->expType != Integer) )
                    {
                        printf("ERROR(%d): '%%' requires operands of type int but lhs is of type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                    
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                    }
                    if(tree->child[1] != NULL)
                    {
                        tree->child[1]->isUsed = true;
                    }
                    break;
                case RAND:
                    if(tree->child[0]->isArray == true)
                    {
                        printf("ERROR(%d): The operation '?' does not work with arrays.\n", tree->lineno);
                        n_errors++;
                    }
                    
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Integer) )
                    {
                        printf("ERROR(%d): Unary '?' requires an operand of type int but was given type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                    }
                    break;
                case AND:
                    if(tree->child[0] != NULL && tree->child[1] != NULL)
                    {
                        if(tree->child[0]->expType == UndefinedType || tree->child[1]->expType == UndefinedType)
                        {
                            tree->child[0]->isUsed = true;
                            tree->child[1]->isUsed = true;
                            return;
                        }
                        if(tree->child[0]->expType != tree->child[1]->expType)
                        {
                            printf("ERROR(%d): 'and' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                            n_errors++;
                        }
                    }
                    // check for array
                    if((tree->child[0] != NULL && tree->child[0]->isArray == true) && (tree->child[1]!= NULL && tree->child[1]->isArray == false))
                    {
                        printf("ERROR(%d): 'and' requires both operands be arrays or not but lhs is an array and rhs is not an array. \n", tree->lineno);
                        n_errors++;
                    }

                    else if((tree->child[0] != NULL && tree->child[0]->isArray == false) && (tree->child[1]!= NULL && tree->child[1]->isArray == true))
                    {
                        printf("ERROR(%d): 'and' requires both operands be arrays or not but lhs is not an array and rhs is an array. \n", tree->lineno);
                        n_errors++;
                    }
                    break;
                case OR:
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Boolean) )
                    {
                        printf("ERROR(%d): 'or' requires an operand of type int but was given type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    
                    // check for array
                    if((tree->child[0] != NULL && tree->child[0]->isArray == true) && (tree->child[1]!= NULL && tree->child[1]->isArray == false))
                    {
                        printf("ERROR(%d): 'or' requires both operands be arrays or not but lhs is an array and rhs is not an array. \n", tree->lineno);
                        n_errors++;
                    }

                    else if((tree->child[0] != NULL && tree->child[0]->isArray == false) && (tree->child[1]!= NULL && tree->child[1]->isArray == true))
                    {
                        printf("ERROR(%d): 'or' requires both operands be arrays or not but lhs is not an array and rhs is an array. \n", tree->lineno);
                        n_errors++;
                    }
                    break;
                case NOT:
                    
                    if( (tree->child[0] != NULL && tree->child[0]->expType != Boolean) )
                    {
                        printf("ERROR(%d): Unary 'not' requires an operand of type bool but was given type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                   
                    if(tree->child[0]->isArray == true)
                    {
                        printf("ERROR(%d): The operation 'not' does not work with arrays.", tree->lineno);
                        n_errors++;
                    }
                    
                    if(tree->child[0] != NULL)
                    {
                        tree->child[0]->isUsed = true;
                    }
                    if(tree->child[1] != NULL)
                    {
                        tree->child[1]->isUsed = true;
                    }
                case SEMICOLON:
                    //printf("Op: ; ");
                    break;
                case COLON:
                    //printf("Op: : ");
                    break;
                case LP:
                    //printf("Op: ( ");
                    break;
                case RP:
                    //printf("Op: ) ");
                    break;
                case LB:
                    //printf("Op: [ ");
                    break;
                case RB:
                    //printf("Op: ] ");
                    break;
                case COMMA:
                    //printf("Op: add ");
                    break;
                case LCB:
                    //printf("Op: { ");
                    break;
                case RCB:
                    //printf("Op: } ");
                    break;
                default:
                    printf("Shouldn't be here");
                    break;
            }
    }
    
    switch( tree->subkind.exp)
    {
        case ConstantK:
            
            break;
        case IdK:
            break;
        case AssignK:
            if(tree->isInitialized != true)
            {
                printf("WARNING(%d): Variable '%s' may be uninitialized when used here.\n", tree->lineno, tree->name);
                n_warnings++;
            }
            break;
        case InitK:
            tree->isInitialized = true;
            break;
        case CallK:
            break;
        default:
            break;
    }
}

void stmtend(TreeNode *tree, SymbolTable *table)
{
    if(tree == NULL)
    {
        printf("NULL NODE THAT SHOULD NOT BE NULL\n");
        return;
    }
    
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
            if(tree->noScope != true)
            {
                table->leave();
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

char * getsType(TreeNode *tree)
{
    switch(tree->expType)
    {
        case 1:
            return "int";
            break;
        case 2:
            return "bool";
            break;
        case 3:
            return "char";
            break;
        case 4:
            return "string";
            break;
        default:
            return "void";
            break;
    }
}

/////  ----- CODE GIVEN BY PROFESSOR -----

// print nothing about the pointer
void pointerPrintNothing(void *data)
{
}
   
// print the pointer as a hex address
void pointerPrintAddr(void *data)
{
    printf("0x%016llx ", (unsigned long long int)(data));
}
   
// print the pointer as a long long int
void pointerPrintLongInteger(void *data)
{
    printf("%18lld ", (unsigned long long int)(data));
}
   
// print the pointer as a char * string
void pointerPrintStr(void *data)
{
    printf("%s ", (char *)(data));
}

// // // // // // // // // // // // // // // // // // // //
//
// Class: Scope
//

Scope::Scope(std::string newname) {
    name = newname;
    debugFlg = false;
}


Scope::~Scope() {
}

// returns char *name of scope
std::string Scope::scopeName() {
    return name;
}

// set scope debugging
void Scope::debug(bool state) {
    debugFlg = state;
}


// print the scope
void Scope::print(void (*printData)(void *)) {
    printf("Scope: %-15s -----------------\n", name.c_str());
    for (std::map<std::string , void *>::iterator it=symbols.begin(); it!=symbols.end(); it++) {
        printf("%20s: ", (it->first).c_str());
        printData(it->second);
        printf("\n");
    }
    
}


// apply the function to each symbol in this scope
void Scope::applyToAll(void (*action)(std::string , void *)) {
    for (std::map<std::string , void *>::iterator it=symbols.begin(); it!=symbols.end(); it++) {
        action(it->first, it->second);
    }
}


// returns true if insert was successful and false if symbol already in this scope
bool Scope::insert(std::string sym, void *ptr) {
    if (symbols.find(sym) == symbols.end()) {
        if (debugFlg) printf("DEBUG(Scope): insert in \"%s\" the symbol \"%s\".\n",
                             name.c_str(),
                             sym.c_str());
        if (ptr==NULL) {
            printf("ERROR(SymbolTable): Attempting to save a NULL pointer for the symbol '%s'.\n",
                   sym.c_str());
        }
        symbols[sym] = ptr;
        return true;
    }
    else {
        if (debugFlg) printf("DEBUG(Scope): insert in \"%s\" the symbol \"%s\" but symbol already there!\n", name.c_str(), sym.c_str());
        return false;
    }
}

void *Scope::lookup(std::string sym) {
    if (symbols.find(sym) != symbols.end()) {
        if (debugFlg) printf("DEBUG(Scope): lookup in \"%s\" for the symbol \"%s\" and found it.\n", name.c_str(), sym.c_str());
        return symbols[sym];
    }
    else {
        if (debugFlg) printf("DEBUG(Scope): lookup in \"%s\" for the symbol \"%s\" and did NOT find it.\n", name.c_str(), sym.c_str());
        return NULL;
    }
}

bool Scope::debugFlg;




// // // // // // // // // // // // // // // // // // // //
//
// Class: SymbolTable
//
//  This is a stack of scopes that represents a symbol table
//

SymbolTable::SymbolTable()
{
    debugFlg = false;
    enter((std::string )"Global");
}


void SymbolTable::debug(bool state)
{
    debugFlg = state;
}


// Returns the number of scopes in the symbol table
int SymbolTable::depth()
{
    return stack.size();
}


// print all scopes using data printing func
void SymbolTable::print(void (*printData)(void *))
{
    printf("===========  Symbol Table  ===========\n");
    for (std::vector<Scope *>::iterator it=stack.begin(); it!=stack.end(); it++) {
        (*it)->print(printData);
    }
    printf("===========  ============  ===========\n");
}


// Enter a scope
void SymbolTable::enter(std::string name)
{
    if (debugFlg) printf("DEBUG(SymbolTable): enter scope \"%s\".\n", name.c_str());
    stack.push_back(new Scope(name));
}


// Leave a scope (not allowed to leave global)
void SymbolTable::leave()
{
    if (debugFlg) printf("DEBUG(SymbolTable): leave scope \"%s\".\n", (stack.back()->scopeName()).c_str());
    if (stack.size()>1) {
        delete stack.back();
        stack.pop_back();
    }
    else {
        printf("ERROR(SymbolTable): You cannot leave global scope.  Number of scopes: %d.\n", (int)stack.size());
    }
}


// Lookup a symbol anywhere in the stack of scopes
// Returns NULL if symbol not found, otherwise it returns the stored void * associated with the symbol
void * SymbolTable::lookup(std::string sym)
{
    void *data;
    std::string name;

    data = NULL;  // set even though the scope stack should never be empty
    for (std::vector<Scope *>::reverse_iterator it=stack.rbegin(); it!=stack.rend(); it++) {
        data = (*it)->lookup(sym);
        name = (*it)->scopeName();
        if (data!=NULL) break;
    }

    if (debugFlg) {
        printf("DEBUG(SymbolTable): lookup the symbol \"%s\" and ", sym.c_str());
        if (data) printf("found it in the scope named \"%s\".\n", name.c_str());
        else printf("did NOT find it!\n");
    }

    return data;
}


// Lookup a symbol in the global scope
// returns NULL if symbol not found, otherwise it returns the stored void * associated with the symbol
void * SymbolTable::lookupGlobal(std::string sym)
{
    void *data;

    data = stack[0]->lookup(sym);
    if (debugFlg) printf("DEBUG(SymbolTable): lookup the symbol \"%s\" in the Globals and %s.\n", sym.c_str(),
                         (data ? "found it" : "did NOT find it"));

    return data;
}


// Insert a symbol into the most recent scope
// Returns true if insert was successful and false if symbol already in the most recent scope
bool SymbolTable::insert(std::string sym, void *ptr)
{
    if (debugFlg) {
        printf("DEBUG(symbolTable): insert in scope \"%s\" the symbol \"%s\"",
               (stack.back()->scopeName()).c_str(), sym.c_str());
        if(ptr==NULL) printf(" WARNING: The inserted pointer is NULL!!");
        printf("\n");
    }

    return (stack.back())->insert(sym, ptr);
}


// Insert a symbol into the global scope
// Returns true is insert was successful and false if symbol already in the global scope
bool SymbolTable::insertGlobal(std::string sym, void *ptr)
{
    if (debugFlg) {
        printf("DEBUG(Scope): insert the global symbol \"%s\"", sym.c_str());
        if(ptr==NULL) printf(" WARNING: The inserted pointer is NULL!!");
        printf("\n");
    }

    return stack[0]->insert(sym, ptr);
}


// Apply function to each simple in the local scope.   The function gets both the
// string and the associated pointer.
void SymbolTable::applyToAll(void (*action)(std::string , void *))
{
    stack[stack.size()-1]->applyToAll(action);
}


// Apply function to each simple in the global scope.   The function gets both the
// string and the associated pointer.
void SymbolTable::applyToAllGlobal(void (*action)(std::string , void *))
{
    stack[0]->applyToAll(action);
}




// // // // // // // // // // // // // // // // // // // //
//
// Some tests
//
std::string words[] = {"alfa", "bravo", "charlie", "dog", "echo", "foxtrot", "golf"};
int wordsLen = 7;


int counter;
void countSymbols(std::string sym, void *ptr) {
    counter++;
    printf("%d %20s: ", counter, sym.c_str());
    pointerPrintAddr(ptr);
    printf("\n");
 }

