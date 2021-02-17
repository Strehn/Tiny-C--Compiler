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
Var::Var(tokenData *data)
{
    name = strdup(data->tokenString);
    line = data->line;
    isArray = false;
    isStatic = false;
    type = (char *)"undefined";
}

Var::Var(tokenData *data, tokenData *size)
{
    arraySize = size->nValue;
    isArray = true;
}

void Var::setTypeAndStatic(char * ttype, bool sstatic)
{
    type = strdup(ttype);
    isStatic = sstatic;
    if(sibling != NULL)
        ((variables *)sibling)->setTypeAndStatic(ttype, sstatic);
}

virtual void Var::print()
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


VarAccess::VarAccess(tokenData *data)
{
    name = strdup(data->tokenString);
    isArray = false;
    line = data->line;
}

VarAccess::VarAccess(int linen, treeNode *variable, treeNode *location)
{
    line = linen;
    addChild(variable, 0);
    addChild(location, 1);
    isArray = true;
}
virtual void VarAccess::printa()
{
    printPrefix();
    if(children[1] == NULL)
        printf("Id: %s [line: %d]\n", name, line);
    else
        printf("Op: [ [line: %d]\n", line);
    treeNode::print();
}

// ----- FUNCTIONS -----
Parm::Parm(tokenData *data, bool isArr)
{
    name = strdup(data->tokenString);
    line = data->line;
    isArray = isArr;
}
void Parm::setType(char * c)
{
    type = strdup(c);
    if(sibling != NULL)
    {
        ((functions *)sibling)->setType(c);
    }
}
virtual void Parm::print()
{
    printPrefix();
    if(isArray)
        printf("Param %s is array of type %s [line: %d]\n", name, type, line);
    else
        printf("Param %s of type %s [line: %d]\n", name, type, line);
    treeNode::print();
}
FunDecl::FunDecl(TokenData *n, treeNode *pars, treeNode *stmt)
{
    name = strdup(n->tokenString);
    line = n->line;
    addChild(pars, 0);
    addChild(string, 1);
    type = (char *)"void";
}
FunDecl::FunDecl(TokenData *t, TokenData *n, treeNode *p, treeNode *s): FunDeclaration(n, p, s)
{
    type = strdup(t->tokenString);
}
virtual void Decl::print()
{
    printPrefix();
    printf("Func %s returns type %s [line: %d]\n", name, type, line);
    treeNode::print();
}
Call::Call(TokenData *data, treeNode *args)
{
    name = strdup(data->tokenString);
    line = data->line;
    addChild(args, 0);
}
virtual void Call::print()
{
    printPrefix();
    printf("Call: %s [line: %d]\n", name, line);
    treeNode::print();
}

// ----- Statements ------
CompoundStatement::CompoundStatement(int linen, treeNode *vars, treeNode *stmt)
{
    line = linen;
    addChild(vars->sibling, 0);
    addChild(stmt->sibling, 1);
}

virtual void CompoundStatement::Print()
{
    printPrefix();
    printf("Compound [line: %d]\n", line);
    treeNode::print();
}

IFS::IFS(int linen, treeNode *condition, treeNode *stmt)
{
    line = linen;
    addChild(condition, 0);
    addChild(stmt, 1);
}
IFS::IFS(int linen, treeNode *condition, treeNode *stmt, treeNode *elseStmt): If(l, condition, stmt)
{
    addChild(eleStmt, 2);
}
virtual void IFS::Print()
{
    printPrefix();
    printf("If [line: %d]\n", line);
    treeNode::print();
}
While::While(int l, treeNode *cond, treeNode *stmt)
{
    line = l;
    addChild(cond, 0);
    addChild(stmt, 1);
}
virtual void While::Print()
{
    printPrefix();
    printf("While [line: %d]\n", line);
    treeNode::print();
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
virtual void Return::Print()
{
    printPrefix();
    printf("Return [line: %d]\n", line);
    treeNode::print();
}
For::For(int l, TokenData *itr, TokenData *arr, treeNode *stmt)
{
    line = l;
    addChild(new Var(itr), 0);
    addChild(new VarAccess(arr), 1);
    addChild(stmt, 2);
}
virtual void For::Print()
{
    printPrefix();
    printf("For [line: %d]\n", line);
    treeNode::print();
}
Iter::Iter(int l, TokenData * starti, TokenData * endi)
{
    line = l;
}
Iter::Iter(int l, TokenData * starti, TokenData * endi, TokenData * byi)
{
    line = l;
    addChild(starti, 0);
    addChild(endi, 1);
    addChild(byi, 2);
}
virtual void Iter::Print()
{
    printPrefix();
    printf("To [line: %d]\n", line);
    treeNode::print();
}
Break::Break(int l)
{
    line = l;
}
virtual void Break::Print()
{
    printPrefix();
    printf("Break [line: %d]\n", line);
    treeNode::print();
}

// Expressions
Relation::Relation(TokenData *data, treeNode *left, treeNode *right)
{
    type = data->tokenClass;
    addChild(left, 0);
    addChild(right, 1);
    str = strdup(data->tokenString);
    line = data->line;
}
virtual void Relation::print()
{
    printPrefix();
    printf("Op: %s [line: %d]\n", str, line);
    treeNode::print();
}
LogicExpression::LogicExpression(TokenData *data, treeNode *left, treeNode *right): LogicExpression(data, left) {
    addChild(right, 1);
    
}
LogicExpression::LogicExpression(TokenData *data, treeNode *left)
{
    addChild(left, 0);
    type = data->tokenClass;
    str = strdup(data->tokenString);
    line = data->line;
}
virtual void LogicExpression::print()
{
    printPrefix();
    printf("Op: %s [line: %d]\n", str, line);
    AST::print();
}
Operation::Operation((TokenData *data, treeNode *left)
{
    addChild(left, 0);
    type = data->tokenClass;
    str = strdup(data->tokenString);
    line = data->line;
}

Operation::Operation(TokenData *data, treeNode *left, treeNode *right): Operation(data, left)
{
    addChild(right, 1);
}
virtual void Operation::print()
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
Constant::Constant(TokenData *)
{
    data = td;
}
virtual void Constant::print()
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




