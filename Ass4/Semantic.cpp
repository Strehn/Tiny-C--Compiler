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

// ----- Globals -----
int n_errors = 0;
int n_warnings = 0;
int loopdepth = 0;
TreeNode *currentfunction = NULL;
TreeNode *currentvar = NULL;

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

// random functions i ended up needing
char * getsType(TreeNode *tree);
char * geteType(ExpType tree);

void checkIndex(TreeNode * tree);
void setUsed(TreeNode * tree, SymbolTable * table);

void checkFuncasVar(TreeNode *tree, SymbolTable *table);
void checkArrays(TreeNode * tree);

// Used to print out errors depending on mismatched types
void typeInt(TreeNode * tree);
void typeBool(TreeNode * tree);
void typeArray(TreeNode * tree);
void typeEqual(TreeNode * tree);
void typeUnary(TreeNode * tree);

// ------ Extra Function Declarations -----
void typeInt(TreeNode * tree)
{
    if(tree != NULL)
    {
        if(tree->child[0]->expType == UndefinedType
           || tree->child[0]->expType == UndefinedType)
        {
            return;
        }
        if((tree->child[0] != NULL
            && tree->child[0]->expType != Integer))
        {
            printf("ERROR(%d): '%s' requires operands of type int but lhs is of type %s.\n", tree->lineno, tree->name, getsType(tree->child[0]));
            n_errors++;
        }
        if((tree->child[1] != NULL
            && tree->child[1]->expType != Integer))
        {
            printf("ERROR(%d): '%s' requires operands of type int but rhs is of type %s.\n", tree->lineno, tree->name, getsType(tree->child[1]));
            n_errors++;
        }
    }
}

void typeBool(TreeNode * tree)
{
    if(tree != NULL)
    {
        if(tree->child[0]->expType == UndefinedType
           || tree->child[0]->expType == UndefinedType)
        {
            return;
        }
        if((tree->child[0] != NULL
            && tree->child[0]->expType != Boolean))
        {
            printf("ERROR(%d): '%s' requires operands of type bool but lhs is of type %s.\n", tree->lineno, tree->name, getsType(tree->child[0]));
            n_errors++;
        }
        if((tree->child[1] != NULL
            && tree->child[1]->expType != Boolean))
        {
            printf("ERROR(%d): '%s' requires operands of type bool but rhs is of type %s.\n", tree->lineno, tree->name, getsType(tree->child[1]));
            n_errors++;
        }
    }
}

void typeArray(TreeNode * tree)
{
    if(tree != NULL)
    {
        if((tree->child[0] != NULL
            && tree->child[0]->isArray == true)
           && (tree->child[1] != NULL
               && tree->child[1]->isArray == false)){
            printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is an array and rhs is not an array.\n", tree->lineno, tree->name);
            n_errors++;
        }
        else if ((tree->child[0] != NULL
                  && tree->child[0]->isArray == false)
                 && (tree->child[1] != NULL
                     && tree->child[1]->isArray == true)){
            printf("ERROR(%d): '%s' requires both operands be arrays or not but lhs is not an array and rhs is an array.\n", tree->lineno, tree->name);
            n_errors++;
        }
    }
}

void typeEqual(TreeNode * tree)
{
    TreeNode * tmp = NULL;

    if(tree != NULL)
    {
        
        if(tree->child[0] != NULL && tree->child[1] != NULL)
        {
            if(tree->child[0]->expType == UndefinedType || tree->child[1]->expType == UndefinedType)
            {
                return;
            }
            if((tree->child[0]->nodekind == DeclK && tree->child[0]->subkind.decl == FuncK) || (tree->child[1]->nodekind == DeclK && tree->child[1]->subkind.decl == FuncK))
            {
                return;
            }
            if(tree->child[0]->expType != tree->child[1]->expType)
            {
                printf("ERROR(%d): '%s' requires operands of the same type but lhs is type %s and rhs is type %s.\n", tree->lineno, tree->name, getsType(tree->child[0]), getsType(tree->child[1]));
                n_errors++;
            }
        }
    }
}

void typeUnary(TreeNode * tree)
{
    if(tree != NULL)
    {
        if(tree->child[0] != NULL)
        {
            if(tree->child[0]->expType == UndefinedType)
            {
                return;
            }
            if(tree->child[0]->expType != Integer){
                printf("ERROR(%d): Unary '%s' requires an operand of type int but was given type %s.\n", tree->lineno, tree->name, getsType(tree->child[0]));
                n_errors++;
            }
        }
    }
}

void checkArrays(TreeNode * tree)
{
    if(tree != NULL)
    {
        if( (tree->child[0] != NULL && tree->child[0]->isArray) || (tree->child[1] != NULL && tree->child[1]->isArray) )
        {
            printf("ERROR(%d): The operation '%s' does not work with arrays.\n", tree->lineno, tree->name);
            n_errors++;
        }
    }
}

void checkFuncasVar(TreeNode *tree, SymbolTable *table)
{
    //functions as variable
    if( (tree->child[0] != NULL) && (tree->child[0]->nodekind = ExpK) && (tree->child[0]->subkind.exp = IdK))
    {
        if(table->lookup(tree->child[0]->name) != NULL && ((TreeNode *)table->lookup(tree->child[0]->name))->subkind.decl == FuncK)
        {
            printf("ERROR(%d): Cannot use function '%s' as a variable.\n", tree->lineno, tree->child[0]->name);
            n_errors++;
        }
    }
    
   
    //functions as variable
    if( (tree->child[1] != NULL) && (tree->child[1]->nodekind = ExpK) && (tree->child[1]->subkind.exp = IdK))
    {
        if(table->lookup(tree->child[1]->name) != NULL && ((TreeNode *)table->lookup(tree->child[1]->name))->subkind.decl == FuncK)
        {
            printf("Error(%d): Cannot use function '%s' as a variable.\n", tree->lineno, tree->child[1]->name);
        }
    }
}

void checkIndex(TreeNode * tree)
{
    //index
    char * lhs_type;
    char * rhs_type;
    
    if(tree->child[0] != NULL && tree->child[0]->isArray != true)
    {
        printf("ERROR(%d): Cannot index nonarray '%s'.\n", tree->lineno, tree->child[0]->name);
        n_errors++;
    }
    if(tree->child[0] != NULL && tree->child[1] != NULL && tree->child[1]->expType != Integer)
    {
        lhs_type = getsType(tree->child[1]);
        printf("ERROR(%d): Array '%s' should be indexed by type int but got type %s.\n", tree->lineno, tree->child[0]->name, lhs_type);
        n_errors++;
    }
    if(tree->child[1] != NULL && tree->child[1]->isArray == true)
    {
        lhs_type = getsType(tree->child[1]);
        printf("ERROR(%d): Array index is the unindexed array '%s'.\n", tree->lineno, tree->child[1]->name);
        n_errors++;
    }
}

void setUsed(TreeNode * tree, SymbolTable * table)
{
    TreeNode * temp = NULL;

    for(int i = 0; i < 3; i++)
    {
        if(tree->child[i] != NULL)
        {
            if((tree->child[i]->nodekind == ExpK && tree->child[i]->subkind.exp == IdK) || (tree->child[i]->nodekind == DeclK && tree->child[i]->subkind.decl == VarK))
            {
                temp = ((TreeNode*)table->lookup(tree->child[i]->name));
                if(temp != NULL)
                {
                    temp->isUsed = true;
                }
            }
            setUsed(tree->child[i], table);
        }
    }
    if((tree->nodekind == ExpK && tree->subkind.exp == IdK) || (tree->nodekind == DeclK && tree->subkind.decl == VarK))
    {
        temp = ((TreeNode *)table->lookup(tree->name));
        if(temp != NULL)
        {
            temp->isUsed = true;
        }
    }
    if(tree->sibling != NULL)
    {
        setUsed(tree->sibling, table);
    }
}

void printifUsed(std::string, void * tree)
{
    TreeNode * temp = (TreeNode *) tree;
    if(temp->isUsed == false)
    {
        
        if( temp->nodekind == DeclK )
        {
            if(temp->subkind.decl == ParamK)
            {
                printf("WARNING(%d): The parameter '%s' seems not to be used.\n", temp->lineno, temp->name);
                n_warnings++;
                temp->isUsed = true;
                return;
            }
            if(temp->subkind.decl == FuncK)
            {
                printf("WARNING(%d): The function '%s' seems not to be used.\n", temp->lineno, temp->name);
                n_warnings++;
                temp->isUsed = true;
                return;
            }
        }
    }
    printf("WARNING(%d): The variable '%s' seems not to be used.\n", temp->lineno, temp->name);
    n_warnings++;
    temp->isUsed = true;
}

void scopeUsed(SymbolTable *table)
{
    table->applyToAll(printifUsed);
}

void printifUninitialized(TreeNode * tree, SymbolTable * table)
{
    TreeNode * temp = NULL;
    TreeNode * tchild = NULL;
    
    if(tree->child[0] != NULL)
    {
        tchild = tree->child[0];
    }
    
    if((tree != NULL && tree->nodekind == ExpK && tree->subkind.exp == IdK))
    {
        temp = ((TreeNode *)table->lookup(tree->name));
            if(temp != NULL && temp->isInitialized == false)
            {
                temp->isInitialized = true;
                printf("WARNING(%d): Variable '%s' may be uninitialized when used here.\n", tree->lineno, temp->name);
                n_warnings++;
            }
    }

    if((tree->child[0] != NULL && tree->child[0]->nodekind == ExpK && tree->child[0]->subkind.exp == IdK))
    {
        temp = ((TreeNode *)table->lookup(tree->child[0]->name));
            if(temp != NULL && temp->isInitialized == false)
            {
                temp->isInitialized = true;
                printf("WARNING(%d): Variable '%s' may be uninitialized when used here.\n", tree->lineno, temp->name);
                n_warnings++;
            }
    }
    if((tree->child[1] != NULL && tree->child[1]->nodekind == ExpK && tree->child[1]->subkind.exp == IdK))
    {
        temp = ((TreeNode *)table->lookup(tree->child[1]->name));
            if(temp != NULL && temp->isInitialized == false)
            {
                temp->isInitialized = true;
                printf("WARNING(%d): Variable '%s' may be uninitialized when used here.\n", tree->lineno, temp->name);
                n_warnings++;
            }
    }
    
    while(tchild != NULL)
    {
        if(tchild->nodekind == ExpK && tchild->subkind.exp == IdK)
        {
            temp = ((TreeNode *)table->lookup(tchild->name));
            if(temp != NULL)
            {
                if(temp->isInitialized == false)
                {
                    temp->isInitialized = true;
                }
            }
        }
        tchild = tchild->sibling;
    }
}


void addIO(TreeNode * tree, SymbolTable * table)
{
    // New Node
    TreeNode * temp = new TreeNode;
    temp->child[0] = new TreeNode;
   
    //void output(int)
    temp->nodekind = DeclK;
    temp->subkind.decl = FuncK;
    temp->expType = Void;
    temp->name = (char *)"output";
    temp->lineno = (-1);
    
    temp->child[0]->nodekind = DeclK;
    temp->child[0]->subkind.decl = ParamK;
    temp->child[0]->expType = Integer;
    temp->child[0]->name = (char *)"dummy";
    temp->child[0]->lineno = -1;
     
    table->insert(temp->name, temp);
    
     
    
    //void outputb(bool)
     temp->nodekind = DeclK;
     temp->subkind.decl = FuncK;
     temp->expType = Void;
     temp->name = (char *)"outputb";
     temp->lineno = (-1);
     
     temp->child[0]->nodekind = DeclK;
     temp->child[0]->subkind.decl = ParamK;
     temp->child[0]->expType = Boolean;
     temp->child[0]->name = (char *)"dummy";
     temp->child[0]->lineno = -1;
      
     table->insert(temp->name, temp);
    
    //void outputc(char)
    temp->nodekind = DeclK;
    temp->subkind.decl = FuncK;
    temp->expType = Void;
    temp->name = (char *)"outputc";
    temp->lineno = (-1);
    
    temp->child[0]->nodekind = DeclK;
    temp->child[0]->subkind.decl = ParamK;
    temp->child[0]->expType = Char;
    temp->child[0]->name = (char *)"dummy";
    temp->child[0]->lineno = -1;
     
    table->insert(temp->name, temp);
    
    temp->child[0] = NULL;
    
    // int input()
    temp->nodekind = DeclK;
    temp->subkind.decl = FuncK;
    temp->expType = Integer;
    temp->name = (char *)"input";
    temp->lineno = (-1);
    
    table->insert(temp->name, temp);
    
    // bool inputb()
    temp->nodekind = DeclK;
    temp->subkind.decl = FuncK;
    temp->expType = Boolean;
    temp->name = (char *)"inputb";
    temp->lineno = (-1);
    
    table->insert(temp->name, temp);
    
    //char inputc()
    temp->nodekind = DeclK;
    temp->subkind.decl = FuncK;
    temp->expType = Char;
    temp->name = (char *)"inputc";
    temp->lineno = (-1);
    
    table->insert(temp->name, temp);
    
    //void outnl()
    temp->nodekind = DeclK;
    temp->subkind.decl = FuncK;
    temp->expType = Void;
    temp->name = (char *)"outnl";
    temp->lineno = (-1);
    
    table->insert(temp->name, temp);
     
}

void parameterCheck(TreeNode * tree, SymbolTable *table)
{
    
    TreeNode * temp = (TreeNode *)table->lookup(tree->name);
    TreeNode * function = temp;
    
    TreeNode * passed = tree->child[0];
    TreeNode * expected = function->child[0];
    
    int i = 1;
    
    temp->isUsed = true;
    
    /*
    
    while(passed != NULL || expected != NULL)
    {
        
        if(passed == NULL)
        {
            // too few parameters
            printf("ERROR(%d): Too few parameters passed for function '%s' declared on line %d.\n", tree->lineno, function->name, function->lineno);
            n_errors++;
        }
        
        if(expected == NULL)
        {
            // too many parameter
            printf("ERROR(%d): Too many parameters passed for function '%s' declared on line %d.\n", tree->lineno, function->name, function->lineno);
            n_errors++;
        }
        
        if(passed->expType != UndefinedType && passed->expType != expected->expType)
        {
            // expecting type thing in parameter
            printf("ERROR(%d): Expecting type %s in parameter %d of call to '%s' declared on line %d but got type %s.\n", tree->lineno, getsType(expected), i, function->name, function->lineno, getsType(passed));
            n_errors++;
        }
        
        if(passed->isArray == true && expected->isArray == false)
        {
            printf("ERROR(%d): Not expecting array in parameter %d of call to '%s' declared on line %d.\n", tree->lineno, i, tree->name, function->lineno);
            n_errors++;
        }
        
        if(passed->isArray == false && expected->isArray == true)
        {
            printf("ERROR(%d): Expecting array in parameter %d of call to '%s' declared on line %d.\n", tree->lineno, i, tree->name, function->lineno);
            n_errors++;
        }
        
        passed = passed->sibling;
        expected = expected->sibling;
        i++;
    }
     */
}

// ----- Main Driving Code Function Declaration -----
void symanticA(TreeNode *tree, SymbolTable *table)
{
    // Add the I/O functions
    addIO(tree, table);
    
    // analyze the tree to add the stuff to the symbol table
    // Analyze Tree
    analyzenode(tree, table);
    
    TreeNode * temp = ((TreeNode *)(table->lookup("main")));
    if(temp != NULL)
    {
        temp->isUsed = true;
    }
    
    scopeUsed(table);
    
    // Check for Main
    if ( table->lookup("main") == NULL || ((TreeNode *)(table->lookup("main")))->subkind.decl != FuncK || ((TreeNode *)(table->lookup("main")))->child[0] != NULL)
        {
            printf("ERROR(LINKER): A function named 'main' with no parameters must be defined.\n");
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
             currentvar = tree;
             if(tree->child[0] != NULL)
             {
                 if(tree->child[0]->nodekind == ExpK && tree->child[0]->subkind.exp == ConstantK )
                 {
                     tree->isInitialized = true;
                 }
             }
            break;
        case FuncK:
            currentfunction = tree;
            tree->isInitialized = true;
            table->enter(tree->name);
            for(int i = 0; i < MAXCHILDREN; i++)
            {
                if((tree->child[i] != NULL) && (tree->child[i]->nodekind == StmtK) && (tree->child[i]->subkind.stmt == CompoundK))
                {        // child's parent is a compound
                    tree->child[i]->funcCompound = true;
                }
            }
            
            // get the return actual value
            //bool found = false;
            
            break;
        case ParamK:
            tree->isInitialized = true;
            break;
        default:
            break;
    }
}

void declend(TreeNode *tree, SymbolTable *table)
{
    if(tree == NULL)
    {
        printf("NULL NODE THAT SHOULD NOT BE NULL\n");
        return;
    }
    
    TreeNode * temp = NULL;
    
    //VarK, FuncK, ParamK
    switch(tree->subkind.decl)
    {
        case VarK:
            if(tree->isArray == true)
            {
                setUsed(tree, table);
            }
            char * type1;
            char * type2;
            if(tree->child[0] != NULL )
            {
                type1 = getsType(tree);
                type2 = getsType(tree->child[0]);
                
                if(tree->child[0] != NULL && tree->child[0]->subkind.exp != ConstantK)
                {
                    printf("ERROR(%d): Initializer for variable '%s' is not a constant expression.\n", tree->lineno, tree->name);
                    n_errors++;
                }
                else if(strcmp(type2, type1) != 0 && strcmp(type2, (char *)"undefined"))
                {
                    printf("ERROR(%d): Initializer for variable '%s' of type %s is of type %s\n", tree->lineno, tree->name, type1, type2);
                    n_errors++;
                }
                
                if(tree->isArray == true && tree->child[0]->isArray == false)
                {
                    printf("ERROR(%d): Initializer for variable '%s' requires both operands be arrays or not but variable is an array and rhs is not an array.\n", tree->lineno, tree->name);
                    n_errors++;
                }
                else if(tree->isArray == false && tree->child[0]->isArray == true)
                {
                    printf("ERROR(%d): Initializer for variable '%s' requires both operands be arrays or not but variable is not an array and rhs is an array.\n", tree->lineno, tree->name);
                    n_errors++;
                }
                                                                                                                                
            }
            currentvar = NULL;
            break;
        case FuncK:
            // get used
            scopeUsed(table);
            table->leave(); // leave the current scope
            
            currentfunction = NULL;
            break;
        case ParamK:
            /*
            if(tree->isUsed == false)
            {
                TreeNode *temp = (TreeNode *)table->lookup(tree->name);
                if(temp->isUsed == false)
                {
                    tree->isUsed = true;
                    temp->isUsed = true;
                    printf("WARNING(%d): The parameter '%s' seems not to be used.\n", tree->lineno, tree->name);
                    n_warnings++;
                }
                
            }
             */
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
            loopdepth++;
            table->enter("if");
            char * temp1;
            char * temp2;
            
            for(int i = 0; i < 3; i++)
            {
                if(tree->child[i] != NULL)
                {
                    if((tree->child[i]->nodekind == StmtK) && (tree->child[i]->subkind.stmt == CompoundK) )
                    {
                        tree->child[i]->funcCompound = true;
                    }
                }
            }
            break;
        case WhileK:
            loopdepth++;
            table->enter("while");
            for(int i = 0; i < 3; i++)
            {
                if(tree->child[i] != NULL)
                {
                    if((tree->child[i]->nodekind == StmtK) && (tree->child[i]->subkind.stmt == CompoundK) )
                    {
                        tree->child[i]->funcCompound = true;
                    }
                }
            }
            break;
        case ForK:
            table->enter("for");
            loopdepth++;
            // NEED TO IMPLEMENT USAGE WARNINGS
            setUsed(tree->child[1]->child[1], table);

            if(tree->child[0] != NULL && (tree->child[0]->nodekind == ExpK) && (tree->child[0]->subkind.exp == IdK) && (table->lookup(tree->name)))
            {
                
                tree->child[0]->isInitialized = true;
                setUsed(tree->child[0], table);
            }
             
            for(int i = 0; i < 3; i++)
            {
                if((tree->child[i] != NULL) && (tree->child[i]->nodekind == StmtK) && (tree->child[i]->subkind.stmt == CompoundK))
                {        // child's parent is a compound
                    tree->child[i]->funcCompound = true;
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
            break;
        case BreakK:
            break;
        case RangeK:
            break;
        default:
            break;
    }
}

void stmtend(TreeNode *tree, SymbolTable *table)
{
    char * expected = NULL;
    char * actual = NULL;
    
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
            // print out if it was used
            scopeUsed(table);
            if(tree->child[0] != NULL)
            {
                setUsed(tree, table);
                
            }
            
            char * temp1;
            char * temp2;
            
            // Child[1] and Child[2]
            // Check that the condition is correct
            if(tree->child[0] != NULL)
            {
                if(tree->child[0]->expType != Boolean)
                {
                    temp1 = getsType(tree->child[0]);
                    printf("ERROR(%d): Expecting Boolean test condition in if statement but got type %s.\n", tree->lineno, temp1);
                    n_errors++;
                }
                
            }
            loopdepth--;
            table->leave();
            break;
        case WhileK:
            // get used warnings
            scopeUsed(table);
            
            if(tree->child[0] != NULL)
            {
                if(tree->child[0]->expType != Boolean)
                {
                    temp1 = getsType(tree->child[0]);
                    printf("ERROR(%d): Expecting Boolean test condition in while statement but got type %s.\n", tree->lineno, temp1);
                    n_errors++;
                }
                
            }
            loopdepth--;
            table->leave();
            break;
        case ForK:
            // get used warnings
            scopeUsed(table);
            table->leave();
            loopdepth--;
            break;
        case CompoundK:
            if(tree->funcCompound != true)
            {
                scopeUsed(table);
                table->leave();
            }
            break;
        case ReturnK:
            
            if(tree->child[0] != NULL)
            {
                tree->expType = tree->child[0]->expType;
            }
            
            expected = getsType(currentfunction);
            actual = getsType(tree);
            
            if(tree->child[0] != NULL)
            {
                setUsed(tree->child[0], table);
            }
            
            if(tree->child[0] != NULL && tree->child[0]->isArray == true || tree->isArray == true)
            {
                printf("ERROR(%d): Cannot return an array.\n", tree->lineno);
                n_errors++;
            }
            
            if(tree->child[0] == NULL && strcmp(expected, (char *)"void") != 0)
            {
                printf("ERROR(%d): Function '%s' at line %d is expecting to return type %s but return has no return value.\n", tree->lineno, currentfunction->name, currentfunction->lineno, expected);
                n_errors++;
            }
            if(tree->child[0] != NULL && strcmp(expected, (char *)"void") == 0)
            {
                printf("ERROR(%d): Function '%s' at line %d is expecting no return value, but return has a value.\n", tree->lineno, currentfunction->name, currentfunction->lineno);
                n_errors++;
            }
            if(tree->child[0] != NULL && strcmp(expected, actual) != 0 && strcmp(actual, (char *)"undefined") != 0 && strcmp(expected, (char *)"void") != 0) {
                printf("ERROR(%d): Function '%s' at line %d is expecting to return type %s but returns type %s.\n", tree->lineno, currentfunction->name, currentfunction->lineno, expected, actual);
                n_errors++;
            }
            
            break;
        case BreakK:
            if(loopdepth == 0)
            {
                printf("ERROR(%d): Cannot have a break statement outside of loop.\n", tree->lineno);
                n_errors++;
            }
            break;
        case RangeK:
            if(tree != NULL)
            {
               if(tree->child[0] != NULL)
               {
                   if(tree->child[0]->isArray == true)
                   {
                       printf("ERROR(%d): Cannot use array in position 1 in range of for statement.\n", tree->lineno);
                       n_errors++;
                   }
                   if(tree->child[1]->isArray == true)
                   {
                       printf("ERROR(%d): Cannot use array in position 2 in range of for statement.\n", tree->lineno);
                       n_errors++;
                   }
               }
                
                if(tree->child[0]!= NULL)
                {
                    char * type1 = getsType(tree->child[0]);
                    if(tree->child[0]->expType != Integer)
                    {
                        printf("ERROR(%d): Expecting type int in position 1 in range of for statement but got type %s.\n", tree->lineno, type1);
                        n_errors++;
                    }
                }
            }
            break;
        default:
            break;
    }
}



void expStart(TreeNode *tree, SymbolTable *table)
{
    TreeNode * temp;
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
                    tree->isInitialized = true;
                    break;
                case IdK:
                    
                    if(currentvar != NULL)
                    {
                        if(currentvar->name == tree->name)
                        {
                            printf("ERROR(%d): Symbol '%s' is not declared.\n", tree->lineno, tree->name);
                            n_errors++;
                        }
                    }
                    
                    // lookup in table, save exptype as that type if expType = undefined
                    temp = (TreeNode *)table->lookup(tree->name);
                    if(temp == NULL)
                    {
                        printf("ERROR(%d): Symbol '%s' is not declared.\n", tree->lineno, tree->name);
                        n_errors++;
                    }
                    else
                    {
                        tree->expType = ((TreeNode*)table->lookup(tree->name))->expType;
                        tree->isArray = ((TreeNode*)table->lookup(tree->name))->isArray;
                    }
                    
                    break;
                case AssignK:
                    switch (tree->tokenclass)
                    {
                        case ASS:
                            if(tree->child[0]->tokenclass == LB)
                            {
                                for(int i = 0; i < 2; i++)
                                {
                                    if(tree->child[0]->child[i]->nodekind == ExpK && tree->child[0]->child[i]->subkind.exp == IdK)
                                    {
                                        temp = ((TreeNode *)table->lookup(tree->child[0]->child[i]->name));
                                        if(temp != NULL)
                                        {
                                            temp->isInitialized = true;
                                        }
                                    }
                                }
                            }
                            break;
                            
                        default:
                            break;
                    }
                    break;
                case InitK:
                    break;
                case CallK:
                    if(tree->child[0] != NULL){
                        setUsed(tree, table);
                    }
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
    
    // ----- Get the LHS of the operation -----
    if(tree->child[0] != NULL)
    {
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
    else // child 0 is null
    {
        lhs_type = (char *)"undefined";
    }
    
    // ----- get the RHS of the operation ------
    if(tree->child[1] != NULL)
    {
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
     
    // Get the subkind
    
     
    switch(tree->subkind.exp)
        {
            case OpK:
    
                //SET IT AS USED
                setUsed(tree, table);
                            
                // Error checking for array index
                if(tree->tokenclass == LB)
                {
                    // CHECK ARRAY INDEXING IS CORRECT
                    checkIndex(tree);
                                
                    // CHECK FUNC AS VAR
                    //functions as variable
                    /*
                    if( (tree->child[0] != NULL) && (tree->child[0]->nodekind = ExpK) && (tree->child[0]->subkind.exp = IdK))
                    {
                        if(table->lookup(tree->child[0]->name) != NULL && ((TreeNode *)table->lookup(tree->child[0]->name))->subkind.decl == FuncK)
                        {
                            printf("ERROR(%d): Cannot use function '%s' as a variable.\n", tree->lineno, tree->child[0]->name);
                            n_errors++;
                        }
                    }
                     */
                                
                    tree->expType = tree->child[0]->expType;
                    tree->isInitialized = tree->child[0]->isInitialized;
                    
                    if(tree->child[0] == NULL)
                    {
                        printifUninitialized(tree, table);
                    }
                }

                switch(tree->tokenclass)
                {
                    case EQ:
                        tree->name = (char *)"==";
                        typeEqual(tree);
                        typeArray(tree);
                        printifUninitialized(tree, table);
                        break;
                    case NEQ:
                        tree->name = (char *)"!=";
                        typeEqual(tree);
                        typeArray(tree);
                        printifUninitialized(tree, table);
                        break;
                    case LT:
                        tree->name = (char *)"<";
                        typeEqual(tree);
                        typeArray(tree);
                        printifUninitialized(tree, table);
                        break;
                    case GT:
                        tree->name = (char *)">";
                        typeEqual(tree);
                        typeArray(tree);
                        printifUninitialized(tree, table);
                        break;
                    case LEQ:
                        tree->name = (char *)"<=";
                        typeEqual(tree);
                        typeArray(tree);
                        printifUninitialized(tree, table);
                        break;
                    case GEQ:
                        tree->name = (char *)">=";
                        typeEqual(tree);
                        typeArray(tree);
                        printifUninitialized(tree, table);
                        break;
                        
                    case MUL:
                        tree->name = (char *)"*";
                        typeInt(tree);
                        typeArray(tree);
                        checkArrays(tree);
                        printifUninitialized(tree, table);
                        break;
                    case DIV:
                        tree->name = (char *)"/";
                        typeInt(tree);
                        typeArray(tree);
                        checkArrays(tree);
                        printifUninitialized(tree, table);
                        break;
                    case MOD:
                        tree->name = (char *)"%";
                        typeInt(tree);
                        typeArray(tree);
                        checkArrays(tree);
                        printifUninitialized(tree, table);
                        break;
                    case ADD:
                        tree->name = (char *)"+";
                        typeInt(tree);
                        typeArray(tree);
                        checkArrays(tree);
                        printifUninitialized(tree, table);
                        break;
                    case SUB:
                        tree->name = (char *)"-";
                        typeInt(tree);
                        typeArray(tree);
                        checkArrays(tree);
                        printifUninitialized(tree, table);
                        break;
                    case MAX:
                        tree->name = (char *)":<:";
                        typeInt(tree);
                        typeArray(tree);
                        checkArrays(tree);
                        printifUninitialized(tree, table);
                        break;
                    case MIN:
                        tree->name = (char *)":>:";
                        typeInt(tree);
                        typeArray(tree);
                        checkArrays(tree);
                        printifUninitialized(tree, table);
                        break;
                        
                    case CHSIGN:
                        tree->name = (char *)"chsign";
                        typeUnary(tree);
                        if(tree->child[0]->isArray == true)
                        {
                            printf("ERROR(%d): The operation 'chsign' does not work with arrays.\n", tree->lineno);
                            n_errors++;
                        }
                        printifUninitialized(tree, table);
                        break;

                    case SIZEOF:
                        tree->name = (char *)"sizeof";
                        if(tree->child[0] != NULL && ((TreeNode *)table->lookup(tree->child[0]->name)) != NULL)
                        {
                            if(tree->child[0]->isArray != true)
                            {
                                printf("ERROR(%d): The operation 'sizeof' only works with arrays.\n", tree->lineno);
                                n_errors++;
                            }
                        }
                        printifUninitialized(tree, table);
                        break;
                        
                    case AND:
                        tree->name = (char *)"and";
                        typeBool(tree);
                        checkArrays(tree);
                        break;
                    case OR:
                        tree->name = (char *)"or";
                        typeBool(tree);
                        checkArrays(tree);
                        break;

                    case RAND:
                        tree->name = (char *)"?";
                        typeUnary(tree);
                        checkArrays(tree);
                        break;

                    case NOT:
                        tree->name = (char *)"not";
                        if(lhs_type != (char *)"bool")
                        {
                            printf("ERROR(%d): Unary '%s' requires an operand of type bool but was given type %s.\n", tree->lineno, tree->name, getsType(tree->child[0]));
                            n_errors++;
                        }
                        checkArrays(tree);
                    break;
                }
 
                break;
            case ConstantK:
                break;
            case IdK:
                
                if(table->lookup(tree->name) != NULL && ((TreeNode *)table->lookup(tree->name))->subkind.decl == FuncK)
                {
                    printf("ERROR(%d): Cannot use function '%s' as a variable.\n", tree->lineno, tree->name);
                    n_errors++;
                }
                 
                break;
                       
            case AssignK:
                // CHECK FUNC AS VAR
                      
                switch(tree->tokenclass)
                {
                        setUsed(tree, table);
                    case ASS:
                        tree->name = (char *)"=";
                        typeEqual(tree);
                        
                        // Set if it is initialized
                        if(tree->child[0]->nodekind == ExpK && tree->child[0]->subkind.exp == IdK && table->lookup(tree->child[0]->name)){  // lhs is ID and found in symboltable
                            tree->expType = tree->child[0]->expType;
                            ((TreeNode *)table->lookup(tree->child[0]->name))->isInitialized = true;
                        }
                        else if(tree->child[0]->child[0] != NULL && tree->child[0]->child[0]->nodekind == ExpK && tree->child[0]->child[0]->subkind.exp == IdK && table->lookup(tree->child[0]->child[0]->name) != NULL){
                            // lhs is an array and an ID and found in the symboltable
                            tree->expType = tree->child[0]->child[0]->expType;
                            tree->child[0]->child[0]->isInitialized = true;
                            ((TreeNode *)table->lookup(tree->child[0]->child[0]->name))->isInitialized = true;
                        }
                        typeArray(tree);
                        setUsed(tree->child[0], table);
                        printifUninitialized(tree, table);
                        
                        break;
                        // These all take Integers
                    case ADDASS:
                            tree->name = (char *)"+=";
                            typeInt(tree);
                            checkArrays(tree);
                            //setUsed(tree->child[0], table);
                            printifUninitialized(tree, table);
                        break;
                    case SUBASS:
                            tree->name = (char *)"-=";
                            typeInt(tree);
                            checkArrays(tree);
                            //setUsed(tree->child[0], table);
                            printifUninitialized(tree, table);
                        break;
                    case MULASS:
                            tree->name = (char *)"*=";
                            typeInt(tree);
                            checkArrays(tree);
                            //setUsed(tree->child[0], table);
                            printifUninitialized(tree, table);
                        break;
                    case DIVASS:
                            tree->name = (char *)"/=";
                            typeInt(tree);
                            checkArrays(tree);
                            //setUsed(tree->child[0], table);
                            printifUninitialized(tree, table);
                        break;
                                    
                    case INC:
                        tree->name = (char *)"++";
                            typeUnary(tree);
                            printifUninitialized(tree, table);
                            checkArrays(tree);
                            break;
                        case DEC:
                            tree->name = (char *)"--";
                            typeUnary(tree);
                            printifUninitialized(tree, table);
                            checkArrays(tree);
                            break;
                     
                    }
            
                break;
                
                
            case InitK:
                
                break;
                
                
            case CallK:
                
                
                if( (tree->child[0] != NULL) && (tree->child[0]->nodekind = ExpK) && (tree->child[0]->subkind.exp == IdK) )
                {
                    if(table->lookup(tree->child[0]->name) != NULL && ((TreeNode *)table->lookup(tree->child[0]->name))->subkind.decl == FuncK)
                    {
                        printf("ERROR(%d): Cannot use function '%s' as a variable.\n", tree->lineno, tree->child[0]->name);
                        n_errors++;
                    }
                }
                
                
                
                temp = (TreeNode *)table->lookup(tree->name);
                if(temp == NULL)
                {
                    tree->expType = UndefinedType;
                    tree->isUndeclared = true;
                    printf("ERROR(%d): Function '%s' is not declared.\n", tree->lineno, tree->name);
                    n_errors++;
                }
                
                else
                {
                    if(temp->subkind.decl != FuncK)
                    {
                        printf("ERROR(%d): '%s' is a simple variable and cannot be called.\n", tree->lineno, temp->name);
                        n_errors++;
                    }
                    else
                    {
                        tree->expType = temp->expType;
                        temp->isUsed = true;
                        parameterCheck(tree,table);
                    }
                }
                
                if(tree != NULL)
                {
                    printifUninitialized(tree, table);
                }
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
            return (char *)"int";
            break;
        case 2:
            return (char *)"bool";
            break;
        case 3:
            return (char *)"char";
            break;
        case 4:
            return (char *)"char";
            break;
        default:
            return (char *)"void";
            break;
    }
}

char * geteType(ExpType tree)
{
    switch(tree)
    {
        case 1:
            return (char *)"int";
            break;
        case 2:
            return (char *)"bool";
            break;
        case 3:
            return (char *)"char";
            break;
        case 4:
            return (char *)"char";
            break;
        default:
            return (char *)"void";
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

