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
#include "SymanticAnalysis.hpp"
#include "TreeUtils.hpp"
#include "parser.tab.h"

int n_errors = 0;
int n_warnings = 0;

// Functions
void settTypes(TreeNode *tree);
void getaType(TreeNode *tree);

// -----Symantic Analysis Stuff -----
///// ----- SYMANTIC ANALYSIS -----
void makeTable(TreeNode *tree, SymbolTable *table)
{
    // analyze the tree to add the stuff to the symbol table
    // Import same kind of stuff from the print function
    // Set Types
    settTypes(tree);
    
    // Analyze Tree
    analyzenode(tree, table);
    
    // Check for Main
    if ( table->lookup("main") == NULL )
        {
            printf("ERROR(LINKER): a function named 'main()' must be defined.\n");
            n_errors++;
        }
    // get captial D flag working
    
    // print the table need to make a new function
    //table->print(//this points to data);
}
void settTypes(TreeNode *tree)
{
    if (tree->nodekind==StmtK)
    {
        // StmtKind {NullK, IfK, WhileK, ForK, CompoundK, ReturnK, BreakK, RangeK};
        switch (tree->subkind.stmt)
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
    else if (tree->nodekind == ExpK)
    {
        // ExpKind {OpK, ConstantK, IdK, AssignK, InitK, CallK};
        switch (tree->subkind.exp)
        {
            case OpK:
                
                break;
            case ConstantK:
                switch(tree->expType)
                {
                    case Integer:
                        break;
                    case Boolean:
                        break;
                    case Char:
                        break;
                    case String:
                        break;
                    default:
                        break;
                }
                break;
            case IdK:
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
    else if (tree->nodekind==DeclK)
    {
        // DeclKind {VarK, FuncK, ParamK};

        switch (tree->subkind.decl)
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
    
    
    // look at the sibling
    if( (tree->sibling) != NULL)
    {
        analyzenode(tree->sibling, table);
    }
    
    nodeend(tree, table);
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
    
    if(!table->insert(tree->name, tree))
    {
        TreeNode *temp = (TreeNode *)table->lookup(tree->name);
        printf("ERROR(%d): Symbol '%s' is already declared at line %d. \n", tree->lineno, tree->name, temp->lineno);
        n_errors++;
    }
    //VarK, FuncK, ParamK
    switch(tree->subkind.decl)
    {
        case VarK:
            if(tree->isArray == true)
            {
                if(tree->expType == Integer)
                {
                    
                }
                else
                {
                    printf("ERROR(%d): Array '%s' should be indexed by type int but got ", tree->lineno, tree->name);
                    getaType(tree);
                    printf(".\n");
                }
            }
            break;
        case FuncK:
            tree->isInitialized = true;
            table->enter(tree->name);
            for(int i = 0; i < MAXCHILDREN; i++)
            {
                if((tree->child[i] != NULL) && (tree->child[i]->nodekind == StmtK) && (tree->child[i]->subkind.stmt == CompoundK))
                {        // child's parent is a compound
                    tree->child[i]->funcCompound = true;
                }
            }
            break;
        case ParamK:
            break;
        default:
            break;
    }
    
}

char* getsType(ExpType tree)
{
    switch(tree)
    {
        case Integer:
            return (char*)"int";
            break;
        case Boolean:
            return (char*)"bool";
            break;
        case Char:
            return (char*)"char";
            break;
        case String:
            return (char*)"char";
            break;
        case Void:
            return (char*)"void";
        case UndefinedType:
            return (char*)"undefined type";
        case Array:
            return (char*)"array";
        default:
            return (char*)"default";
    }
}
    
void expStart(TreeNode *tree, SymbolTable *table)
{
    if(tree == NULL)
    {
        printf("NULL NODE THAT SHOULD NOT BE NULL\n");
        return;
    }
    
    TreeNode * temp = NULL;

    switch(tree->subkind.exp)
        {
            case OpK:
                break;
            case ConstantK:
                break;
            case IdK:
                temp = (TreeNode *) table->lookup(tree->name);
                if(temp == NULL)
                {
                    printf("ERROR(%d): Symbol '%s' is not declared.\n", tree->lineno, tree->name);
                    n_errors++;
                }
                else
                {
                    tree->expType = Char;
                    tree->isArray = true;
                }
                break;
            case AssignK:
                break;
            case InitK:
                break;
            case CallK:
                temp = (TreeNode *) table->lookup(tree->name);
                if(temp == NULL)
                {
                    printf("ERROR(%d): Symbol '%s' is not declared.\n", tree->lineno, tree->name);
                    n_errors++;
                }
                else
                {
                    tree->expType = Char;
                    if(temp->subkind.decl != FuncK)
                    {
                        printf("ERROR(%d): '%s' is a simple variable and cannot be called.\n", tree->lineno, temp->name);
                        n_errors++;
                    }
                    tree->isUsed = true;
                }
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
            if(tree->isUsed == false)
            {
                printf("WARNING(%d): Variable '%s' seems to not be used.\n", tree->lineno, tree->name);
            }
            else if(tree->isInitialized == false)
            {
                printf("WARNING(%d): Variable '%s' may be uninitialized when used here.\n", tree->lineno, tree->name);
            }
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
    
    char * intstring = (char *)"int";
    char * boolstring = (char *)"bool";
    
    TreeNode * temp = NULL;
    
    if(tree->child[0] != NULL)
    {
        if(tree->child[0]->subkind.exp == IdK)
        {
            temp = (TreeNode *)table->lookup(tree->child[0]->name);
            if(temp != NULL)
            {
                lhs_type = getsType(temp->expType);
            }
        }
        else
        {
            lhs_type = getsType(tree->child[0]->expType);
        }
    }
    else
    {
        lhs_type = (char *)"undefined";
    }
    
    if(tree->child[1] != NULL)
    {
        if(tree->child[1]->subkind.exp == IdK)
        {
            temp = (TreeNode *)table->lookup(tree->child[1]->name);
            if(temp != NULL)
            {
                rhs_type = getsType(temp->expType);
            }
        }
        else
        {
            rhs_type = getsType(tree->child[0]->expType);
        }
    }
    else
    {
        rhs_type = (char *)"undefined";
    }
    
    //{OpK, ConstantK, IdK, AssignK, InitK, CallK}
    switch(tree->subkind.exp)
    {
        case OpK:
            switch(tree->tokenclass)
            {
                case EQ:
                    
                    if(lhs_type != rhs_type)
                    {
                        printf("ERROR(%d): '==' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                        n_errors++;
                    }
                    
                    break;
                case NEQ:
                    
                    if(lhs_type != rhs_type)
                    {
                        printf("ERROR(%d): '!=' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                        n_errors++;
                    }
                    
                    break;
                case LEQ:
                    
                    if(lhs_type != rhs_type)
                    {
                        printf("ERROR(%d): '<=' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                        n_errors++;
                    }
                    if( (tree->child[0] != NULL && tree->child[0]->isArray == true) && (tree->child[1] != NULL) && (tree->child[1]->isArray == false))
                    {
                        printf("ERROR(%d): '<=' requires both operands be arrays or not but lhs is an array and rhs is not an array. \n", tree->lineno);
                        n_errors++;
                    }
                    else if( (tree->child[0] != NULL && tree->child[0]->isArray == false) && (tree->child[1] != NULL) && (tree->child[1]->isArray == true))
                    {
                        printf("ERROR(%d): '<=' requires both operands be arrays or not but lhs is not an array and rhs is an array. \n", tree->lineno);
                        n_errors++;
                    }
                     
                    break;
                case GEQ:
                    
                    if(lhs_type != rhs_type)
                    {
                        printf("ERROR(%d): '>=' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                        n_errors++;
                    }
                    if( (tree->child[0] != NULL && tree->child[0]->isArray == true) && (tree->child[1] != NULL) && (tree->child[1]->isArray == false))
                    {
                        printf("ERROR(%d): '>=' requires both operands be arrays or not but lhs is an array and rhs is not an array. \n", tree->lineno);
                        n_errors++;
                    }
                    else if( (tree->child[0] != NULL && tree->child[0]->isArray == false) && (tree->child[1] != NULL) && (tree->child[1]->isArray == true))
                    {
                        printf("ERROR(%d): '>=' requires both operands be arrays or not but lhs is not an array and rhs is an array. \n", tree->lineno);
                        n_errors++;
                    }
                     
                    break;
                case ASS:
                    if(lhs_type != rhs_type && table->lookup(tree->child[0]->name) != NULL)
                    {
                        printf("ERROR(%d): '=' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                        n_errors++;
                    }
                    else if(lhs_type != rhs_type && table->lookup(tree->child[1]->name) != NULL)
                    {
                        printf("ERROR(%d): '=' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                        n_errors++;
                    }
                    else if(lhs_type != rhs_type)
                    {
                        printf("ERROR(%d): '=' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case ADDASS:
                    
                    if( lhs_type != intstring)
                    {
                        printf("ERROR(%d): '+=' requires operands of type int but lhs is type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if(rhs_type != intstring)
                    {
                        printf("ERROR(%d): '+=' requires operands of type int but lhs is type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case SUBASS:
                    
                    if( lhs_type != intstring)
                    {
                        printf("ERROR(%d): '-=' requires operands of type int but lhs is type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if(rhs_type != intstring)
                    {
                        printf("ERROR(%d): '-=' requires operands of type int but lhs is type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case MULASS:
                    
                    if( lhs_type != intstring)
                    {
                        printf("ERROR(%d): '*=' requires operands of type int but lhs is type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if(rhs_type != intstring)
                    {
                        printf("ERROR(%d): '*=' requires operands of type int but lhs is type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case DIVASS:
                    
                    if( lhs_type != intstring)
                    {
                        printf("ERROR(%d): '/=' requires operands of type int but lhs is type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if(rhs_type != intstring)
                    {
                        printf("ERROR(%d): '/=' requires operands of type int but lhs is type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                    break;
                case MAX:
                    
                    if(lhs_type != rhs_type)
                    {
                        printf("ERROR(%d): ':>:' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case MIN:
                    
                    if(lhs_type != rhs_type)
                    {
                        printf("ERROR(%d): ':<:' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case DEC:
                    
                    if( lhs_type != intstring)
                    {
                        printf("ERROR(%d): '--' requires operands of type int but lhs is type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if(rhs_type != intstring)
                    {
                        printf("ERROR(%d): '--' requires operands of type int but lhs is type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case INC:
                    
                    if( lhs_type != intstring)
                    {
                        printf("ERROR(%d): '++' requires operands of type int but lhs is type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if(rhs_type != intstring)
                    {
                        printf("ERROR(%d): '++' requires operands of type int but lhs is type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case ADD:
                    
                    if( lhs_type != intstring)
                    {
                        printf("ERROR(%d): '+' requires operands of type int but lhs is type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( rhs_type != intstring)
                    {
                        printf("ERROR(%d): '+' requires operands of type int but rhs is type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case SUB:
                    
                    if( lhs_type != intstring)
                    {
                        printf("ERROR(%d): '-' requires operands of type int but lhs is type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( rhs_type != intstring)
                    {
                        printf("ERROR(%d): '-' requires operands of type int but rhs is type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case LT:
                    
                    if(lhs_type != rhs_type)
                    {
                        printf("ERROR(%d): '<' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case GT:
                    
                    if(lhs_type != rhs_type)
                    {
                        printf("ERROR(%d): '>' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, lhs_type, rhs_type);
                        n_errors++;
                    };
                     
                    break;
                case SIZEOF:
                    
                    if( lhs_type != intstring)
                    {
                        printf("ERROR(%d): unary 'sizeof' requires an operand of type int but was given type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                     
                    break;
                case CHSIGN:
                    
                    if( lhs_type != intstring)
                    {
                        printf("ERROR(%d): unary 'chsign' requires an operand of type int but was given type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                     
                    break;
                case MUL:
                    
                    if( lhs_type != intstring)
                    {
                        printf("ERROR(%d): '*' requires operands of type int but lhs is %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( rhs_type != intstring)
                    {
                        printf("ERROR(%d): '*' requires operands of type int but rhs is %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case DIV:
                    
                    if( lhs_type != intstring)
                    {
                        printf("ERROR(%d): '/' requires operands of type int but lhs is %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if( rhs_type != intstring)
                    {
                        printf("ERROR(%d): '/' requires operands of type int but rhs is %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case MOD:
                    
                    if( lhs_type != intstring)
                    {
                        printf("ERROR(%d): '%%' requires operands of type int but lhs is %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if(rhs_type != intstring)
                    {
                        printf("ERROR(%d): '%%' requires operands of type int but rhs is %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case RAND:
                    
                    if(lhs_type != intstring)
                    {
                        printf("ERROR(%d): Unary '?' requires an operand of type int but was given type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                     
                    break;
                case AND:
                    
                    if(lhs_type != boolstring)
                    {
                        printf("ERROR(%d): 'and' requires operands of type bool but lhs is of type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if(rhs_type != boolstring)
                    {
                        printf("ERROR(%d): 'and' requires operands of type bool but rhs is of type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case OR:
                    
                    if(lhs_type != boolstring)
                    {
                        printf("ERROR(%d): 'or' requires operands of type bool but lhs is of type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if(rhs_type != boolstring)
                    {
                        printf("ERROR(%d): 'or' requires operands of type bool but rhs is of type %s.\n", tree->lineno, rhs_type);
                        n_errors++;
                    }
                     
                    break;
                case NOT:
                    
                    if(lhs_type != rhs_type)
                    {
                        printf("ERROR(%d): Unary 'not' requires operands of type bool but was given type %s.\n", tree->lineno, lhs_type);
                        n_errors++;
                    }
                    if(tree->isArray == true)
                    {
                        printf("ERROR(%d): The operation 'not' does not work with arrays.", tree->lineno);
                        n_errors++;
                    }
                     
                    break;
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
            }
            break;
        case ConstantK:
            break;
        case IdK:
            /*
            if(!table->insert(tree->name, tree))
            {
                temp = (TreeNode *)table->lookup(tree->name);
                printf("ERROR(%d): Symbol '%s' is already declared at line %d. \n", tree->lineno, tree->name, temp->lineno);
                n_errors++;
            }
             */
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

void getaType(TreeNode *tree)
{
    switch(tree->expType)
    {
        case 1:
            printf("int");
            break;
        case 2:
            printf("bool");
            break;
        case 3:
            printf("char");
            break;
        case 4:
            printf("string");
            break;
        default:
            printf("void");
            break;
    }
}

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
