#ifndef _SCANTYPE_H_
#define _SCANTYPE_H_
//
//  SCANNER TOKENDATA
//  Sydney Petrehn
//  January 22, 2021
//
struct TokenData {
    int  tokenclass;        // token class
    int  linenum;           // line where found
    char *tokenstr;         // what string was actually read
    char cvalue;            // any character value
    int  nvalue;            // any numeric value or Boolean value
    char *svalue;           // any string value e.g. an id
    int  strlen;            // length of the parsed token
    char *idIndex;
};
#endif
