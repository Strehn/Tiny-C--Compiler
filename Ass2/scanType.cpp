//
//  scanType.cpp
//  
//
//  Created by Sydney Petrehn on 2/10/21.
//

#include <stdio.h>
#include "scanType.h"
#include <iostream>
#include "parser.tab.h"

treeNode::treeNode()
{
    sibling = NULL;
    depth = 0;
    index = 1;
    isChild = false;
    isFirst = false;
}

void treeNode::printTree()
{
    for(int i = 0; i < MAX_CHILDREN; i++)
    {
        if(children[i] != NULL)
        {
            children[i]->printTree();
        }
    }
    if(sibling != NULL)
    {
        sibling -> printTree();
    }
}

void treeNode::getData()
{
    for(int i = 0; i < MAX_CHILDREN; i++)
    {
        if(children[i] != NULL)
        {
            children[i]->depth = depth + 1;
            children[i]->getData();
        }
    }
    if(sibling != NULL)
    {
        sibling->depth = depth;
        if(!isChild)
        {
            sibling->index = index + 1;
        }
        sibling->getData();
    }
}

void treeNode::append(treeNode *node)
{
    if(node == NULL)
    {
        return;
    }
    if(sibling == NULL)
    {
        sibling = node;
    }
    else
    {
        treeNode *temp;
        for(temp = sibling; temp -> sibling != NULL; temp = temp -> sibling);
        temp->sibling = node;
    }
}

void treeNode::addChild(treeNode *child, int n)
{
    if(child == NULL)
    {
        return;
    }
    children[n] = child;
    child->index = n;
    child->isChild = true;
}

void treeNode::setFirst()
{
    isFirst = true;
}

void treeNode::printPrefix()
{
    if(isFirst)
    {
        return;
    }
    for(int i = 0; i < depth; i ++)
    {
        printf(".  ");
    }
    if(isChild)
    {
        printf("Child: %d  ", index);
    }
    else
    {
        printf("Sibling: %d  ", index);
    }
}
// ----- End of Tree Functions ------



// ----- VARIABLES -----
Var::Var(TokenData *data)
{
    name = strdup(data->tokenstr);
    line = data->linenum;
    isArray = false;
    isStatic = false;
    type = (char *)"undefined";
}

Var::Var(TokenData *data, TokenData *size)
{
    arrSize = size->nvalue;
    isArray = true;
}

void Var::setTypeAndStatic(char * ttype, bool sstatic)
{
    type = strdup(ttype);
    isStatic = sstatic;
    if(sibling != NULL)
        ((Var *)sibling)->setTypeAndStatic(ttype, sstatic);
}

void Var::print()
{
    printPrefix();
    if(strcmp(type, "undefined") != 0)
    {
        if(isArray)
        {
            printf("Var %s is array of type %s [line: %d]\n", name, type, line);
        }
        else
        {
            printf("Var %s of type %s [line: %d]\n", name, type, line);
        }
    }
    else
    {
        printf("Var %s of undefined type [line: %d]\n", name, line);
    }
    treeNode::printTree();
}


VarAccess::VarAccess(TokenData *data)
{
    name = strdup(data->tokenstr);
    isArray = false;
    line = data->linenum;
}

VarAccess::VarAccess(int linen, treeNode *variable, treeNode *location)
{
    line = linen;
    addChild(variable, 0);
    addChild(location, 1);
    isArray = true;
}
void VarAccess::print()
{
    printPrefix();
    if(children[1] == NULL)
        printf("Id: %s [line: %d]\n", name, line);
    else
        printf("Op: [ [line: %d]\n", line);
    treeNode::printTree();
}

// ----- FUNCTIONS -----
Parm::Parm(TokenData *data, bool isArr)
{
    name = strdup(data->tokenstr);
    line = data->linenum;
    isArray = isArr;
}
void Parm::setType(char * c)
{
    type = strdup(c);
    if(sibling != NULL)
    {
        ((Parm *)sibling)->setType(c);
    }
}
void Parm::print()
{
    printPrefix();
    if(isArray)
        printf("Param %s is array of type %s [line: %d]\n", name, type, line);
    else
        printf("Param %s of type %s [line: %d]\n", name, type, line);
    treeNode::printTree();
}
FunDecl::FunDecl(TokenData *n, treeNode *pars, treeNode *stmt)
{
    name = strdup(n->tokenstr);
    line = n->linenum;
    addChild(pars, 0);
    addChild(stmt, 1);
    type = (char *)"void";
}
FunDecl::FunDecl(TokenData *t, TokenData *n, treeNode *p, treeNode *s)
{
    FunDecl(n, p, s);
    type = strdup(t->tokenstr);
}
void FunDecl::print()
{
    printPrefix();
    printf("Func %s returns type %s [line: %d]\n", name, type, line);
    treeNode::printTree();
}
Call::Call(TokenData *data, treeNode *args)
{
    name = strdup(data->tokenstr);
    line = data->linenum;
    addChild(args, 0);
}
void Call::print()
{
    printPrefix();
    printf("Call: %s [line: %d]\n", name, line);
    treeNode::printTree();
}

// ----- Statements ------
CompoundStatement::CompoundStatement(int linen, treeNode *vars, treeNode *stmt)
{
    line = linen;
    addChild(vars->sibling, 0);
    addChild(stmt->sibling, 1);
}

void CompoundStatement::Print()
{
    printPrefix();
    printf("Compound [line: %d]\n", line);
    treeNode::printTree();
}

If::If(int linen, treeNode *condition, treeNode *stmt)
{
    line = linen;
    addChild(condition, 0);
    addChild(stmt, 1);
}
If::If(int linen, treeNode *condition, treeNode *stmt, treeNode *elseStmt)
{
    If(linen, condition, stmt);
    addChild(elseStmt, 2);
}
void If::Print()
{
    printPrefix();
    printf("If [line: %d]\n", line);
    treeNode::printTree();
}
WHILe::WHILe(int l, treeNode *cond, treeNode *stmt)
{
    line = l;
    addChild(cond, 0);
    addChild(stmt, 1);
}
void WHILe::Print()
{
    printPrefix();
    printf("To [line: %d]\n", line);
    treeNode::printTree();
}
Return::Return(int l)
{
    line = l;
}
Return::Return(int l, treeNode *stmt)
{
    addChild(stmt, 0);
    line = l;
}
void Return::Print()
{
    printPrefix();
    printf("Return [line: %d]\n", line);
    treeNode::printTree();
}
For::For(int l, TokenData *itr, TokenData *arr, treeNode *stmt)
{
    line = l;
    addChild(new Var(itr), 0);
    addChild(new VarAccess(arr), 1);
    addChild(stmt, 2);
}
void For::Print()
{
    printPrefix();
    printf("For [line: %d]\n", line);
    treeNode::printTree();
}
Break::Break(int l)
{
    line = l;
}
void Break::Print()
{
    printPrefix();
    printf("Break [line: %d]\n", line);
    treeNode::printTree();
}

// Expressions
Relation::Relation(TokenData *data, treeNode *left, treeNode *right)
{
    type = data->tokenclass;
    addChild(left, 0);
    addChild(right, 1);
    str = strdup(data->tokenstr);
    line = data->linenum;
}
void Relation::print()
{
    printPrefix();
    printf("Op: %s [line: %d]\n", str, line);
    treeNode::printTree();
}
LogicExpression::LogicExpression(TokenData *data, treeNode *left, treeNode *right)
{
    LogicExpression(data, left);
    addChild(right, 1);
    
}
LogicExpression::LogicExpression(TokenData *data, treeNode *left)
{
    addChild(left, 0);
    type = data->tokenclass;
    str = strdup(data->tokenstr);
    line = data->linenum;
}
void LogicExpression::print()
{
    printPrefix();
    printf("Op: %s [line: %d]\n", str, line);
    treeNode::printTree();
}
Operation::Operation(TokenData *data, treeNode *left)
{
    addChild(left, 0);
    type = data->tokenclass;
    str = strdup(data->tokenstr);
    line = data->linenum;
}

Operation::Operation(TokenData *data, treeNode *left, treeNode *right)
{
    Operation(data, left);
    addChild(right, 1);
}
void Operation::print()
{
    printPrefix();
        if(strcmp(str, "=") == 0 || strcmp(str, "++") == 0 || strcmp(str, "--") == 0 || strcmp(str, "+=") == 0 || strcmp(str, "-=") == 0
    || strcmp(str, "*=") == 0 || strcmp(str, "/=") == 0)
        {
            printf("Assign: %s [line: %d]\n", str, line);
        }
        else if(strcmp(str, "-") == 0 && children[1] == NULL) // if there is no right child then it's unary minus
        {
            printf("Op: chsign [line: %d]\n", line);
        }
        else
        {
            printf("Op: %s [line: %d]\n", str, line);
        }
        treeNode::printTree();
}
Constant::Constant(TokenData *temp)
{
    data = temp;
}
void Constant::print()
{
    printPrefix();
    switch(data->tokenclass) {
    case CHARCONST:
        printf("Const: '%c' [line: %d]\n", data->cvalue, data->linenum);
        break;
    case STRINGCONST:
        std::cout << "Const: \"" << data->svalue << "\" [line: " << data->linenum << "]\n";
        break;
    default:
        printf("Const: %s [line: %d]\n", data->tokenstr, data->linenum);
    }
    treeNode::printTree();
}




