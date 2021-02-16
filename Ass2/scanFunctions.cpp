//
//  scanFunctions.cpp
//  
//
//  Created by Sydney Petrehn on 2/10/21.
//

#include <stdio.h>

treeNode::treeNode()
{
    sibling = NULL;
    depth = 0;
    index = 1;
    isChild = false;
    isFirst = false;
}

void treeNode::print()
{
    for(int i = 0; i < MAX_CHILDREN; i++)
    {
        if(children[i] != NULL)
        {
            children[i]->print();
        }
    }
    if(sibling != NULL)
    {
        sibling -> print();
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
variables::variable(tokenData *data)
{
    name = strdup(data->tokenString);
    line = data->line;
    isArray = false;
    isStatic = false;
    type = (char *)"undefined";
}

variables::variable(tokenData *data, tokenData *size)
{
    arraySize = size->nValue;
    isArray = true;
}

variables::variableA(tokenData *data)
{
    name = strdup(data->tokenString);
    isArray = false;
    line = data->line;
}

variables::variableA(int linen, treeNode *variable, treeNode *location)
{
    line = linen;
    addChild(variable, 0);
    addChild(location, 1);
    isArray = true;
}

void variables::setTypeAndStatic(char * ttype, bool sstatic)
{
    type = strdup(ttype);
    isStatic = sstatic;
    if(sibling != NULL)
        ((variables *)sibling)->setTypeAndStatic(ttype, sstatic);
}

virtual void variables::print()
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
    treeNode::print();
}

virtual void variables::printa()
{
    printPrefix();
    if(children[1] == NULL)
        printf("Id: %s [line: %d]\n", name, line);
    else
        printf("Op: [ [line: %d]\n", line);
    treeNode::print();
}

// ----- FUNCTIONS -----
functions::Parm(tokenData *data, bool isArr)
{
    name = strdup(data->tokenString);
    line = data->line;
    isArray = isArr;
}
void functions::setType(char * c)
{
    type = strdup(c);
    if(sibling != NULL)
    {
        ((functions *)sibling)->setType(c);
    }
}
virtual void functions::printParm()
{
    printPrefix();
    if(isArray)
        printf("Param %s is array of type %s [line: %d]\n", name, type, line);
    else
        printf("Param %s of type %s [line: %d]\n", name, type, line);
    treeNode::print();
}
functions::FunDecl(TokenData *n, treeNode *pars, treeNode *stmt)
{
    name = strdup(n->tokenString);
    line = n->line;
    addChild(pars, 0);
    addChild(string, 1);
    type = (char *)"void";
}
functions::FunDecl(TokenData *t, TokenData *n, treeNode *p, treeNode *s): FunDeclaration(n, p, s)
{
    type = strdup(t->tokenString);
}
virtual void functions::printDecl()
{
    printPrefix();
    printf("Func %s returns type %s [line: %d]\n", name, type, line);
    treeNode::print();
}
functions::Call(TokenData *data, treeNode *args)
{
    name = strdup(data->tokenString);
    line = data->line;
    addChild(args, 0);
}
virtual void functions::printCall()
{
    printPrefix();
    printf("Call: %s [line: %d]\n", name, line);
    treeNode::print();
}

// ----- Statements ------
statement::CompoundStatement(int linen, treeNode *vars, treeNode *stmt)
{
    line = linen;
    addChild(vars->sibling, 0);
    addChild(stmt->sibling, 1);
}

virtual void statement::CompoundPrint()
{
    printPrefix();
    printf("Compound [line: %d]\n", line);
    treeNode::print();
}

statement::If(int linen, treeNode *condition, treeNode *stmt)
{
    line = linen;
    addChild(condition, 0);
    addChild(stmt, 1);
}
statement::If(int linen, treeNode *condition, treeNode *stmt, treeNode *elseStmt): If(l, condition, stmt)
{
    addChild(eleStmt, 2);
}
virtual void statement::IfPrint()
{
    printPrefix();
    printf("If [line: %d]\n", line);
    treeNode::print();
}
statement::While(int l, treeNode *cond, treeNode *stmt)
{
    line = l;
    addChild(cond, 0);
    addChild(stmt, 1);
}
virtual void statement::WhilePrint()
{
    printPrefix();
    printf("While [line: %d]\n", line);
    treeNode::print();
}
statement::Return(int l)
{
    line = l;
}
statement::Return(int l, treeNode *stmt)
{
    addChild(stmt, 0);
    line = l;
}
virtual void statement::ReturnPrint()
{
    printPrefix();
    printf("Return [line: %d]\n", line);
    treeNode::print();
}
statement::For(int l, TokenData *itr, TokenData *arr, treeNode *stmt)
{
    line = l;
    addChild(new variables(itr), 0);
    addChild(new variablesA(arr), 1);
    addChild(stmt, 2);
}
virtual void statement::ForPrint()
{
    printPrefix();
    printf("For [line: %d]\n", line);
    treeNode::print();
}
statement::Break(int l)
{
    line = l;
}
virtual void statement::BreakPrint()
{
    printPrefix();
    printf("Break [line: %d]\n", line);
    treeNode::print();
}

// Expressions
expression::Relation(TokenData *data, treeNode *left, treeNode *right)
{
    type = data->tokenClass;
    addChild(left, 0);
    addChild(right, 1);
    str = strdup(data->tokenString);
    line = data->line;
}
virtual void expression::printRelation()
{
    printPrefix();
    printf("Op: %s [line: %d]\n", str, line);
    treeNode::print();
}
expression::LogicExpression(TokenData *data, treeNode *left, treeNode *right): LogicExpression(data, left) {
    addChild(right, 1);
    
}
expression::LogicExpression(TokenData *data, treeNode *left)
{
    addChild(left, 0);
    type = data->tokenClass;
    str = strdup(data->tokenString);
    line = data->line;
}
virtual void expression::printLogic()
{
    printPrefix();
    printf("Op: %s [line: %d]\n", str, line);
    AST::print();
}
expression::Operation((TokenData *data, treeNode *left)
{
    addChild(left, 0);
    type = data->tokenClass;
    str = strdup(data->tokenString);
    line = data->line;
}
expression::Operation(TokenData *data, treeNode *left, treeNode *right): Operation(data, left)
{
    addChild(right, 1);
}
virtual void expression::printOper()
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
        treeNode::print();
}
expression::Constant(TokenData *)
{
    data = td;
}
virtual void expression::printConst()
{
    printPrefix();
    switch(data->tokenClass) {
    case CHARCONST:
        printf("Const: '%c' [line: %d]\n", data->cValue, data->line);
        break;
    case STRINGCONST:
        std::cout << "Const: \"" << data->sValue << "\" [line: " << data->line << "]\n";
        break;
    default:
        printf("Const: %s [line: %d]\n", data->tokenString, data->line);
    }
    treeNode::print();
}




