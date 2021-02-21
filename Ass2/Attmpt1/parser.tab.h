/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     BOOLCONST = 258,
     NUMCONST = 259,
     CHARCONST = 260,
     STRINGCONST = 261,
     ID = 262,
     THEN = 263,
     IF = 264,
     WHILE = 265,
     FOR = 266,
     STATIC = 267,
     INT = 268,
     BOOL = 269,
     CHAR = 270,
     IN = 271,
     ELSE = 272,
     RETURN = 273,
     BREAK = 274,
     COMMENT = 275,
     SYMBOL = 276,
     EQ = 277,
     ADDASS = 278,
     SUBASS = 279,
     DIVASS = 280,
     MULASS = 281,
     LEQ = 282,
     GEQ = 283,
     NEQ = 284,
     DEC = 285,
     INC = 286,
     LT = 287,
     GT = 288,
     MUL = 289,
     MAX = 290,
     MIN = 291,
     ADD = 292,
     DIV = 293,
     DO = 294,
     BY = 295,
     TO = 296,
     MOD = 297,
     RAND = 298,
     SUB = 299,
     AND = 300,
     OR = 301,
     NOT = 302,
     ASS = 303,
     SEMICOLON = 304,
     COLON = 305,
     LP = 306,
     RP = 307,
     LB = 308,
     RB = 309,
     COMMA = 310,
     LCB = 311,
     RCB = 312
   };
#endif
/* Tokens.  */
#define BOOLCONST 258
#define NUMCONST 259
#define CHARCONST 260
#define STRINGCONST 261
#define ID 262
#define THEN 263
#define IF 264
#define WHILE 265
#define FOR 266
#define STATIC 267
#define INT 268
#define BOOL 269
#define CHAR 270
#define IN 271
#define ELSE 272
#define RETURN 273
#define BREAK 274
#define COMMENT 275
#define SYMBOL 276
#define EQ 277
#define ADDASS 278
#define SUBASS 279
#define DIVASS 280
#define MULASS 281
#define LEQ 282
#define GEQ 283
#define NEQ 284
#define DEC 285
#define INC 286
#define LT 287
#define GT 288
#define MUL 289
#define MAX 290
#define MIN 291
#define ADD 292
#define DIV 293
#define DO 294
#define BY 295
#define TO 296
#define MOD 297
#define RAND 298
#define SUB 299
#define AND 300
#define OR 301
#define NOT 302
#define ASS 303
#define SEMICOLON 304
#define COLON 305
#define LP 306
#define RP 307
#define LB 308
#define RB 309
#define COMMA 310
#define LCB 311
#define RCB 312




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 29 "parser.y"
{
    TokenData *tokenData;
    class treeNode *treeNode;
    
}
/* Line 1529 of yacc.c.  */
#line 169 "parser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} YYLTYPE;
# define yyltype YYLTYPE /* obsolescent; will be withdrawn */
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif

extern YYLTYPE yylloc;
