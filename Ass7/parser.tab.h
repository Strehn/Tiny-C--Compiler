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
     ELSE = 271,
     RETURN = 272,
     BREAK = 273,
     COMMENT = 274,
     EQ = 275,
     ADDASS = 276,
     SUBASS = 277,
     DIVASS = 278,
     MULASS = 279,
     LEQ = 280,
     GEQ = 281,
     NEQ = 282,
     DEC = 283,
     INC = 284,
     LT = 285,
     GT = 286,
     MAX = 287,
     MIN = 288,
     ADD = 289,
     DIV = 290,
     DO = 291,
     BY = 292,
     TO = 293,
     MOD = 294,
     RAND = 295,
     SUB = 296,
     MUL = 297,
     CHSIGN = 298,
     SIZEOF = 299,
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
#define ELSE 271
#define RETURN 272
#define BREAK 273
#define COMMENT 274
#define EQ 275
#define ADDASS 276
#define SUBASS 277
#define DIVASS 278
#define MULASS 279
#define LEQ 280
#define GEQ 281
#define NEQ 282
#define DEC 283
#define INC 284
#define LT 285
#define GT 286
#define MAX 287
#define MIN 288
#define ADD 289
#define DIV 290
#define DO 291
#define BY 292
#define TO 293
#define MOD 294
#define RAND 295
#define SUB 296
#define MUL 297
#define CHSIGN 298
#define SIZEOF 299
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
#line 48 "parser.y"
{
    ExpType type;            // for passing types.  typespec to pass up a type in decl like int or bool
    TokenData *tokenData;    // for terminals.  token data comes from yylex() in the $ variables
    TreeNode *tree;          // for nonterminals.   these tree nodes as you build the tree
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
