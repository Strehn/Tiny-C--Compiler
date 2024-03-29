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
int foffset = 0;
int goffset = 0;
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

void typecUnary(TreeNode * tree)
{
    if(tree != NULL)
    {
        if(tree->child[0] != NULL)
        {
            if(tree->child[0]->expType == UndefinedType)
            {
                return;
            }
            if(tree->child[0]->expType != Char){
                printf("ERROR(%d): Unary '%s' requires an operand of type char but was given type %s.\n", tree->lineno, tree->name, getsType(tree->child[0]));
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
            if((tree->child[i]->nodekind == ExpK && tree->child[i]->subkind.exp == IdK)       || (tree->child[i]->nodekind == DeclK && tree->child[i]->subkind.decl == VarK)   ||
                (tree->child[i]->nodekind == DeclK && tree->child[i]->subkind.decl == ParamK) ||
                (tree->child[i]->nodekind == DeclK && tree->child[i]->subkind.decl == FuncK)
                                                                                               )
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
            }
            if(temp->subkind.decl == FuncK)
            {
                printf("WARNING(%d): The function '%s' seems not to be used.\n", temp->lineno, temp->name);
                n_warnings++;
                temp->isUsed = true;
            }
            if(temp->subkind.decl == VarK)
            {
                printf("WARNING(%d): The variable '%s' seems not to be used.\n", temp->lineno, temp->name);
                n_warnings++;
                temp->isUsed = true;
            }
        }
    }
}

void scopeUsed(SymbolTable *table)
{
    table->applyToAll(printifUsed);
}

void printifUninitializedRHS(TreeNode * tree, SymbolTable * table)
{
    // print out if the RHS of an operation or assign is initialized
    TreeNode * temp = NULL;
    TreeNode * tchild = NULL;
    
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
}

void printifUninitializedCall(TreeNode * tree, SymbolTable * table)
{
    // print out if the RHS of an operation or assign is initialized
    TreeNode * temp = NULL;
    TreeNode * tchild = NULL;
   
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
    /*
     * need to do it like this since when i was trying to set it to null
     * it was then trying to insert a null node to the table.
     * there is probably an easier way to do this but this works so im leaving
     * this for now.
     */
    TreeNode * temp = new TreeNode;
    temp->child[0] = new TreeNode;
    
    TreeNode * temp2 = new TreeNode;
    temp2->child[0] = new TreeNode;
    
    TreeNode * temp3 = new TreeNode;
    temp3->child[0] = new TreeNode;
    
    TreeNode * temp4 = new TreeNode;
    
    TreeNode * temp5 = new TreeNode;
    
    TreeNode * temp6 = new TreeNode;
    
    TreeNode * temp7 = new TreeNode;
   
    //void output(int)
    temp->nodekind = DeclK;
    temp->subkind.decl = FuncK;
    temp->expType = Void;
    temp->name = (char *)"output";
    temp->lineno = (-1);
    temp->isUsed = true;
    temp->child[0]->nodekind = DeclK;
    temp->child[0]->subkind.decl = ParamK;
    temp->child[0]->expType = Integer;
    temp->child[0]->name = (char *)"dummy";
    temp->child[0]->lineno = -1;
    table->insert(temp->name, temp);

    
    //void outputb(bool)
     temp2->nodekind = DeclK;
     temp2->subkind.decl = FuncK;
     temp2->expType = Void;
     temp2->name = (char *)"outputb";
     temp2->lineno = (-1);
     temp2->isUsed = true;
     temp2->child[0]->nodekind = DeclK;
     temp2->child[0]->subkind.decl = ParamK;
     temp2->child[0]->expType = Boolean;
     temp2->child[0]->name = (char *)"dummy";
     temp2->child[0]->lineno = -1;
     table->insert(temp2->name, temp2);
    
    //void outputc(char)
    temp3->nodekind = DeclK;
    temp3->subkind.decl = FuncK;
    temp3->expType = Void;
    temp3->name = (char *)"outputc";
    temp3->lineno = (-1);
    temp3->isUsed = true;
    temp3->child[0]->nodekind = DeclK;
    temp3->child[0]->subkind.decl = ParamK;
    temp3->child[0]->expType = Char;
    temp3->child[0]->name = (char *)"dummy";
    temp3->child[0]->lineno = -1;
    table->insert(temp3->name, temp3);
    
    // int input()
    temp4->nodekind = DeclK;
    temp4->subkind.decl = FuncK;
    temp4->expType = Integer;
    temp4->name = (char *)"input";
    temp4->lineno = (-1);
    temp4->isUsed = true;
    table->insert(temp4->name, temp4);
    
    // bool inputb()
    temp5->nodekind = DeclK;
    temp5->subkind.decl = FuncK;
    temp5->expType = Boolean;
    temp5->name = (char *)"inputb";
    temp5->lineno = (-1);
    temp5->isUsed = true;
    table->insert(temp5->name, temp5);
    
    //char inputc()
    temp6->nodekind = DeclK;
    temp6->subkind.decl = FuncK;
    temp6->expType = Char;
    temp6->name = (char *)"inputc";
    temp6->lineno = (-1);
    temp6->isUsed = true;
    table->insert(temp6->name, temp6);
    
    //void outnl()
    temp7->nodekind = DeclK;
    temp7->subkind.decl = FuncK;
    temp7->expType = Void;
    temp7->name = (char *)"outnl";
    temp7->lineno = (-1);
    temp7->isUsed = true;
    table->insert(temp7->name, temp7);
}

void parameterCheck(TreeNode * tree, SymbolTable *table)
{
    
    TreeNode * temp = (TreeNode *)table->lookup(tree->name);
    TreeNode * function = temp;
    
    TreeNode * passed = NULL;
    passed = tree->child[0];
    TreeNode * expected = NULL;
    expected = function->child[0];
    
    if(passed == NULL && expected == NULL)
    {
        return;
    }
    else if(passed == NULL)
    {
        // too few parameters
        printf("ERROR(%d): Too few parameters passed for function '%s' declared on line %d.\n", tree->lineno, function->name, function->lineno);
        n_errors++;
    }
    else if(expected == NULL)
    {
        // too many parameter
        printf("ERROR(%d): Too many parameters passed for function '%s' declared on line %d.\n", tree->lineno, function->name, function->lineno);
        n_errors++;
    }
    setUsed(tree, table);
    int i = 1;
    
    temp->isUsed = true;
    
    while(passed != NULL && expected != NULL)
    {
        if(passed != NULL || expected != NULL)
        {
            setUsed(passed, table);
            
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
            passed = passed->sibling;
            expected = expected->sibling;
            printifUninitializedCall(passed, table);
            i++;
        }
    } // end of while
     
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
    
    tree->isUsed = false;
    
    if(currentfunction == NULL)
    {
        tree->isGlobal = true;
    }
    
    // memory
    if(currentfunction != NULL )
    {
        if(tree->isStatic == true)
        {
           // global
            if(tree->isArray == true)
            {
                tree->memlocation = goffset - 2;
                goffset = goffset - tree->aSize;
                tree->memsize = (tree->aSize + 1);
            }
            else
            {
                tree->memlocation = goffset;
                goffset--;
            }
        }
        else if(tree->isArray == true)
        {
            tree->memlocation = foffset - 2; // first is the location of array
            foffset = foffset - tree->aSize - 1;
            tree->memsize = (tree->aSize + 1);
        }
        else
        {
            tree->memlocation = foffset;
            foffset--;
        }
        
    }
    else if(tree->subkind.decl == FuncK)
    {
        tree->memlocation = foffset;
    }
    else // global
    {
        if(tree->isArray == true)
        {
            tree->memlocation = goffset - tree->aSize - 2;
            goffset = goffset - tree->aSize - 2;
            tree->memsize = (tree->aSize + 1);
        }
        else
        {
            tree->memlocation = goffset;
            goffset--;
        }
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
            tree->memsize = -2;
            //foffset--;
            break;
        case ParamK:
            if(tree->isArray)
            {
                tree->isInitialized = true;
            }
            //tree->isInitialized = true;
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
            if(currentfunction == NULL )
            {
                if(tree->child[0] != NULL)
                {
                    if(tree->child[0]->isArray)
                    {
                        tree->child[0]->memlocation = -1;
                        goffset = goffset + tree->aSize - 1;
                    }
                }
            }
            
            if(tree->isArray == true)
            {
                setUsed(tree, table);
                temp = ((TreeNode *)table->lookup(tree->name));
                temp->isInitialized = false;
            }
            
            char * type1;
            char * type2;
            if(tree->child[0] != NULL )
            {
                if(currentfunction == NULL)
                {
                    if(tree->child[0]->isArray == true)
                    {
                        printf("WARNING(%d): The variable '%s' seems not to be used.\n", tree->lineno, tree->name);
                        n_warnings++;
                    }
                    else if (tree->child[0]->expType == Char)
                    {
                        printf("WARNING(%d): The variable '%s' seems not to be used.\n", tree->lineno, tree->name);
                        n_warnings++;
                    }
                }
                
                type1 = getsType(tree);
                type2 = getsType(tree->child[0]);
                
                setUsed(tree, table);
                
                if(tree->child[0] != NULL && tree->child[0]->subkind.exp != ConstantK)
                {
                    //printf("ERROR(%d): Initializer for variable '%s' is not a constant expression.\n", tree->lineno, tree->name);
                    //n_errors++;
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
            
            //scopeUsed(table);
            currentvar = NULL;
            break;
        case FuncK:
            // get used
            scopeUsed(table);
            table->leave(); // leave the current scope
            
            // print if there is not a return where there should be
            if(tree->hasReturned == false)
            {
                if(tree->expType != Void)
                {
                    printf("WARNING(%d): Expecting to return type %s but function '%s' has no return statement.\n", tree->lineno, getsType(tree), tree->name);
                    n_warnings++;
                }
            }
            currentfunction = NULL;
            foffset = 0;
            break;
        case ParamK:
            temp = (TreeNode *)table->lookup(tree->name);
            if(temp->isUsed == false)
            {
                //scopeUsed(table);
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

            if(tree->child[0] != NULL)
            {
                //&& (tree->child[0]->nodekind == ExpK) && (tree->child[0]->subkind.exp == IdK) && (table->lookup(tree->name))
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
            if(tree->funcCompound != true)
            {
                table->enter("compound");
            }
            foffset = foffset - 2;
            break;
        case ReturnK:
            break;
        case BreakK:
            break;
        case RangeK:
            if(tree->child[0] != NULL)
            {
                tree->child[0]->isInitialized = true;
            }
            break;
        default:
            break;
    }
}

void stmtend(TreeNode *tree, SymbolTable *table)
{
    char * expected = NULL;
    char * actual = NULL;
    int i = 0;
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
            printifUninitialized(tree, table);
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
            for(i = 0; i < 3; i++)
            {
                if(tree->child[i] != NULL && (tree->child[i]->nodekind == ExpK) && (tree->child[i]->subkind.exp == IdK) && (table->lookup(tree->name)))
                {
                    
                    tree->child[i]->isInitialized = true;
                    setUsed(tree->child[i], table);
                }
            }
            scopeUsed(table);
            table->leave();
            loopdepth--;
            break;
        case CompoundK:
            // look for if the children have been declared.
            //child 0 is the var
            // child 1 is assign
            // child 1 child 0 is where we are looking
            if(tree->funcCompound != true)
            {
                scopeUsed(table);
                table->leave();
            }
            foffset = foffset + 1;
            if(tree->isArray == true)
            {
                tree->memsize = foffset - 1;
                tree->memlocation = goffset;
                goffset = goffset - tree->memsize;
                
            }
            else
            {
                tree->memsize = foffset - 1;
                goffset = goffset - tree->memsize;
            }
            break;
        case ReturnK:
            
            currentfunction->hasReturned = true;
            
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
            
            /*
            if(tree->child[0]->child[0] != NULL && tree->child[0]->child[0]->isArray == true || tree->isArray == true)
            {
                printf("ERROR(%d): Cannot return an array.\n", tree->lineno);
                n_errors++;
            }
            */
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
                   if(tree->child[1] != NULL)
                   {
                       if(tree->child[1]->isArray == true)
                       {
                           printf("ERROR(%d): Cannot use array in position 2 in range of for statement.\n", tree->lineno);
                           n_errors++;
                       }
                   }
                   
                   if(tree->child[2] != NULL)
                   {
                       if(tree->child[2]->isArray == true)
                       {
                           printf("ERROR(%d): Cannot use array in position 3 in range of for statement.\n", tree->lineno);
                           n_errors++;
                       }
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
                    if(tree->tokenclass == GT)
                    {
                        if(tree->child[0] != NULL)
                        {
                            tree->child[0]->aSize = tree->child[0]->aSize + 4;
                        }
                        if(tree->child[1] != NULL)
                        {
                            tree->child[1]->aSize = tree->child[1]->aSize + 4;
                        }
                    }
                    break;
                case ConstantK:
                    tree->isInitialized = true;
                    if(currentfunction == NULL)
                    {
                        tree->inFunction = false;
                    }
                    else
                    {
                        tree->inFunction = true;
                    }
                    
                    //used for memory in ASS 6
                    // memory
                    if(tree->isArray == true)
                    {
                        tree->memlocation = goffset - tree->aSize - 2;
                        goffset = goffset - tree->aSize - 2;
                        tree->memsize = (tree->aSize + 1);
                    }
                    else
                    {
                        tree->memlocation = goffset;
                        goffset--;
                    }
                    break;
                case IdK:
                    
                    // lookup in table, save exptype as that type if expType = undefined
                    temp = (TreeNode *)table->lookup(tree->name);
                    if(temp == NULL)
                    {
                        printf("ERROR(%d): Symbol '%s' is not declared.\n", tree->lineno, tree->name);
                        n_errors++;
                    }
                    else
                    {
                        //used for memory in ASS 6
                        tree->isStatic = temp->isStatic;
                        tree->isGlobal = temp->isGlobal;
                        tree->isArray = temp->isArray;
                        tree->memlocation = temp->memlocation;
                        tree->memsize = temp->memsize;
                        if(tree->expType == UndefinedType)
                        {
                            tree->expType = temp->expType;
                        }
                    }
                    
                    break;
                case AssignK:
                    switch (tree->tokenclass)
                    {
                        case ASS:
                            if(tree->child[0] != NULL)
                            {
                                if(tree->child[0]->tokenclass == LB)
                                {
                                    for(int i = 0; i < 2; i++)
                                    {
                                        if(tree->child[0]->child[i] != NULL && tree->child[0]->child[i]->nodekind == ExpK && tree->child[0]->child[i]->subkind.exp == IdK)
                                        {
                                            temp = ((TreeNode *)table->lookup(tree->child[0]->child[i]->name));
                                            if(temp != NULL)
                                            {
                                                temp->isInitialized = true;
                                            }
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
                    // set that the function is used;
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
                    tree->expType = tree->child[0]->expType;
                    tree->child[0]->isInitialized = false;
                    
                    if(tree->expType == Integer)
                    {
                        printifUninitialized(tree, table);
                    }
                    //printifUninitialized(tree, table);
                    
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
                        setUsed(tree, table);
                        //printifUninitialized(tree, table);
                        break;
                    case NEQ:
                        tree->name = (char *)"!=";
                        typeEqual(tree);
                        typeArray(tree);
                        setUsed(tree, table);
                        //printifUninitialized(tree, table);
                        break;
                    case LT:
                        tree->name = (char *)"<";
                        typeEqual(tree);
                        typeArray(tree);
                        setUsed(tree, table);
                        //printifUninitialized(tree, table);
                        break;
                    case GT:
                        tree->name = (char *)">";
                        typeEqual(tree);
                        typeArray(tree);
                        setUsed(tree, table);
                       // printifUninitialized(tree, table);
                        break;
                    case LEQ:
                        tree->name = (char *)"<=";
                        typeEqual(tree);
                        typeArray(tree);
                        setUsed(tree, table);
                        printifUninitializedRHS(tree, table);
                        break;
                    case GEQ:
                        tree->name = (char *)">=";
                        typeEqual(tree);
                        typeArray(tree);
                        setUsed(tree, table);
                        //printifUninitialized(tree, table);
                        break;
                        
                    case MUL:
                        tree->name = (char *)"*";
                        if(tree->child[1]->isInitialized != true)
                        {
                            // rhs is not initialized
                            if(tree->child[0]->expType != Void && tree->child[1]->expType != Void)
                            {
                                typeInt(tree);
                            }
                        }
                        else
                        {
                            typeInt(tree);
                        }
                        temp = NULL;
                        if(tree->sibling != NULL)
                        {
                            printifUninitializedCall(tree->sibling, table);
                            temp = tree->sibling;
                        }
                        
                        //typeInt(tree);
                        checkArrays(tree);
                        setUsed(tree, table);
                        
                        break;
                    case DIV:
                        tree->name = (char *)"/";
                        typeInt(tree);
                        checkArrays(tree);
                        setUsed(tree, table);
                        break;
                    case MOD:
                        tree->name = (char *)"%";
                        typeInt(tree);
                        checkArrays(tree);
                        setUsed(tree, table);
                        
                        //printifUninitialized(tree, table);
                        break;
                    case ADD:
                        tree->name = (char *)"+";
                        typeInt(tree);
                        checkArrays(tree);
                        setUsed(tree, table);
                        //printifUninitialized(tree, table);
                        break;
                    case SUB:
                        tree->name = (char *)"-";
                        typeInt(tree);
                        checkArrays(tree);
                        setUsed(tree, table);
                        //printifUninitialized(tree, table);
                        break;
                    case MAX:
                        tree->name = (char *)":<:";
                        typeInt(tree);
                        checkArrays(tree);
                        setUsed(tree, table);
                        //printifUninitialized(tree, table);
                        break;
                    case MIN:
                        tree->name = (char *)":>:";
                        typeInt(tree);
                        checkArrays(tree);
                        setUsed(tree, table);
                        //printifUninitialized(tree, table);
                        break;
                        
                    case CHSIGN:
                        tree->name = (char *)"chsign";
                        typeUnary(tree);
                        if(tree->child[0]->isArray == true)
                        {
                            printf("ERROR(%d): The operation 'chsign' does not work with arrays.\n", tree->lineno);
                            n_errors++;
                        }
                        setUsed(tree, table);
                        //printifUninitialized(tree, table);
                        break;

                    case SIZEOF:
                        tree->name = (char *)"sizeof";
                        if(tree->child[0] != NULL)
                        {
                            if(tree->child[0]->isArray != true)
                            {
                                printf("ERROR(%d): The operation 'sizeof' only works with arrays.\n", tree->lineno);
                                n_errors++;
                                return;
                            }
                            
                            tree->child[0]->isInitialized = true;
                        }
                        //typeUnary(tree);
                        setUsed(tree, table);
                        if(tree->child[0]->expType != Boolean)
                        {
                            printifUninitializedCall(tree->child[0], table);
                        }
                        if(tree->sibling != NULL)
                        {
                            printifUninitializedCall(tree->sibling, table);
                        }
                        break;
                        
                    case AND:
                        tree->name = (char *)"and";
                        typeBool(tree);
                        checkArrays(tree);
                        break;
                    case OR:
                        tree->name = (char *)"or";
                        typeBool(tree);
                        setUsed(tree, table);
                        checkArrays(tree);
                        break;

                    case RAND:
                        tree->name = (char *)"?";
                        typeUnary(tree);
                        setUsed(tree, table);
                        checkArrays(tree);
                        break;

                    case NOT:
                        tree->name = (char *)"not";
                        if(lhs_type != (char *)"bool")
                        {
                            printf("ERROR(%d): Unary '%s' requires an operand of type bool but was given type %s.\n", tree->lineno, tree->name, getsType(tree->child[0]));
                            n_errors++;
                        }
                        setUsed(tree, table);
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
                    tree->functionBreak = true;
                    //return;
                }
                 
                temp = (TreeNode *)table->lookup(tree->name);
                if(temp == NULL)
                {
                    //do nothing
                }
                else
                {
                    tree->expType = temp->expType;
                    tree->isArray = temp->isArray;
                }
                 
                break;
                     
            case AssignK:
                // CHECK FUNC AS VAR
                setUsed(tree, table);
                switch(tree->tokenclass)
                {
                    case ASS:
                        tree->name = (char *)"=";
                        
                        if(tree->child[0] == NULL)
                        {
                            return;
                        }
                        else if(tree->child[1] == NULL)
                        {
                            return;
                        }
                        
                        else if(tree->child[0]->functionBreak == true)
                        {
                            return;
                        }
                        
                        
                        if(tree->child[0]!= NULL && tree->child[1] != NULL)
                        {
                            
                            // see if the lhs and rhs are declared. if not dont do anything
                            if(tree->child[0]->nodekind == ExpK && tree->child[0]->subkind.exp == IdK)
                            {
                                if(!table->lookup(tree->child[0]->name))
                                {
                                    //symbol is not declared
                                    return;
                                }
                            }
                            else if(tree->child[1]->nodekind == ExpK && tree->child[1]->subkind.exp == IdK)
                            {
                                if(!table->lookup(tree->child[1]->name))
                                {
                                    //symbol is not declared
                                    return;
                                }
                            }
                            
                            if(tree->child[1]->isInitialized != true)
                            {
                                // rhs is not initialized
                                if(tree->child[0]->expType != Void && tree->child[1]->expType != Void)
                                {
                                    typeEqual(tree);
                                    
                                    /*
                                    if(table->lookup(tree->child[1]->name)) // seeing if it is a parm
                                    {
                                        if(((TreeNode *)table->lookup(tree->child[1]->name))->subkind.decl == ParamK)
                                        {
                                            ((TreeNode *)table->lookup(tree->child[1]->name))->isInitialized = true;
                                        }
                                        if(((TreeNode *)table->lookup(tree->child[1]->name))->isInitialized != true)
                                        {
                                            tree->child[1]->isUsed = true;
                                            if(tree->child[1]->expType == Integer)
                                            {
                                                printifUninitializedCall(tree->child[1], table);
                                            }
                                            
                                            if(tree->child[1]->expType == Boolean)
                                            {
                                                printifUninitializedCall(tree->child[1], table);
                                            }
                                            
                                            if(tree->child[1]->expType == Char)
                                            {
                                                printifUninitializedCall(tree->child[1], table);
                                            }
                                        }
                                    }
                                    else
                                    {
                                        printifUninitializedCall(tree->child[1], table);
                                    }
                                     */
                                }
                            }
                            else
                            {
                                typeEqual(tree);
                            }

                        }
                        
                        if(tree->child[0]!= NULL)
                        {
                            tree->child[0]->isInitialized = true;
                        }
                        // Set if it is initialized
                        if(tree->child[0]->nodekind == ExpK && tree->child[0]->subkind.exp == IdK && table->lookup(tree->child[0]->name))
                        {  // lhs is ID and found in symboltable
                            tree->expType = tree->child[0]->expType;
                            tree->child[0]->isInitialized = true;
                            ((TreeNode *)table->lookup(tree->child[0]->name))->isInitialized = true;
                            
                        }
                        else if(tree->child[0]->child[0] != NULL && tree->child[0]->child[0]->nodekind == ExpK && tree->child[0]->child[0]->subkind.exp == IdK && table->lookup(tree->child[0]->child[0]->name) != NULL){
                            // lhs is an array and an ID and found in the symboltable
                            tree->expType = tree->child[0]->child[0]->expType;
                            tree->child[0]->child[0]->isInitialized = true;
                            ((TreeNode *)table->lookup(tree->child[0]->child[0]->name))->isInitialized = true;
                        }
                        
                        typeArray(tree);
                        setUsed(tree, table);
                        //printifUninitialized(tree, table);
                        //printifUninitializedCall(tree->child[1], table);
                        break;
                        // These all take Integers
                    case ADDASS:
                            tree->name = (char *)"+=";
                            typeInt(tree);
                            checkArrays(tree);
                            setUsed(tree, table);
                            //printifUninitialized(tree, table);
                        break;
                    case SUBASS:
                            tree->name = (char *)"-=";
                            typeInt(tree);
                            checkArrays(tree);
                            setUsed(tree, table);
                            //printifUninitialized(tree, table);
                        break;
                    case MULASS:
                            tree->name = (char *)"*=";
                            typeInt(tree);
                            checkArrays(tree);
                            setUsed(tree, table);
                            //printifUninitialized(tree, table);
                        break;
                    case DIVASS:
                            tree->name = (char *)"/=";
                            typeInt(tree);
                            checkArrays(tree);
                            setUsed(tree, table);
                            //printifUninitialized(tree, table);
                        break;
                                    
                    case INC:
                        tree->name = (char *)"++";
                            typeUnary(tree);
                            printifUninitialized(tree, table);
                            setUsed(tree, table);
                            checkArrays(tree);
                            break;
                        case DEC:
                            tree->name = (char *)"--";
                            typeUnary(tree);
                            //printifUninitialized(tree, table);
                            setUsed(tree, table);
                            checkArrays(tree);
                            break;
                     
                    }
            
                break;
                
                
            case InitK:
                
                break;
                
                
            case CallK:
                
                if( (tree->child[0] != NULL) && (tree->child[0]->nodekind = ExpK) && (tree->child[0]->subkind.exp == IdK) )
                {
                    /*
                    if(table->lookup(tree->child[0]->name) != NULL && ((TreeNode *)table->lookup(tree->child[0]->name))->subkind.decl == FuncK)
                    {
                        printf("ERROR(%d): Cannot use function '%s' as a variable.\n", tree->lineno, tree->child[0]->name);
                        n_errors++;
                    }
                     */
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
                        if(tree != NULL)
                        {
                            //might need to only print rhs
                            //printifUninitialized(tree, table);
                        }
                         
                    }
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

