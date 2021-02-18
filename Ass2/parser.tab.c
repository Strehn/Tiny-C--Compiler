/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 1



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




/* Copy the first part of user declarations.  */
#line 1 "parser.y"

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <iostream>
#include <cstring>
#include <string.h>
#include <string>
#include "scanType.h"
#include "ourgetopt.hpp"
#include "parser.tab.h"


extern int yylex();
extern FILE *yyin;
extern char *yytext;
extern int yylineno;

void yyerror(const char *msg) {
    printf("Error: %s while parsing `%s` on line %d.\n", msg, yytext, yylineno);
}

treeNode *tree;


/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 29 "parser.y"
{
    TokenData *tokenData;
    treeNode *treeNode;
    
}
/* Line 193 of yacc.c.  */
#line 241 "parser.tab.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

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


/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 266 "parser.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL \
	     && defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
    YYLTYPE yyls;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE) + sizeof (YYLTYPE)) \
      + 2 * YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  11
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   225

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  58
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  50
/* YYNRULES -- Number of rules.  */
#define YYNRULES  113
/* YYNRULES -- Number of states.  */
#define YYNSTATES  178

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   312

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     6,     8,    10,    12,    16,    21,    25,
      29,    31,    33,    37,    39,    44,    46,    48,    50,    57,
      63,    65,    66,    70,    72,    75,    79,    81,    83,    87,
      89,    91,    93,    95,    97,    99,   101,   103,   105,   107,
     110,   112,   117,   120,   121,   124,   125,   132,   137,   144,
     149,   156,   161,   168,   172,   178,   181,   185,   188,   192,
     196,   200,   204,   208,   211,   214,   216,   220,   222,   226,
     228,   231,   233,   237,   239,   241,   243,   245,   247,   249,
     251,   255,   257,   259,   261,   265,   267,   269,   271,   275,
     277,   279,   281,   283,   286,   288,   290,   292,   294,   296,
     298,   300,   305,   309,   311,   313,   318,   320,   321,   325,
     327,   329,   331,   333
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      59,     0,    -1,    59,    60,    -1,    60,    -1,    61,    -1,
      67,    -1,    66,    63,    49,    -1,    12,    66,    63,    49,
      -1,    66,    63,    49,    -1,    63,    55,    64,    -1,    64,
      -1,    65,    -1,    65,    50,    88,    -1,     7,    -1,     7,
      53,     4,    54,    -1,    13,    -1,    14,    -1,    15,    -1,
      66,     7,    51,    68,    52,    73,    -1,     7,    51,    68,
      52,    73,    -1,    69,    -1,    -1,    69,    49,    70,    -1,
      70,    -1,    66,    71,    -1,    71,    55,    72,    -1,    72,
      -1,     7,    -1,     7,    53,    54,    -1,    74,    -1,    75,
      -1,    76,    -1,    77,    -1,    80,    -1,    82,    -1,    85,
      -1,    86,    -1,    81,    -1,    83,    -1,    87,    49,    -1,
      49,    -1,    56,    78,    79,    57,    -1,    78,    62,    -1,
      -1,    79,    73,    -1,    -1,     9,    88,     8,    74,    17,
      74,    -1,     9,    88,     8,    73,    -1,     9,    88,     8,
      74,    17,    75,    -1,    10,    88,    39,    74,    -1,    11,
       7,    48,    84,    39,    74,    -1,    10,    88,    39,    75,
      -1,    11,     7,    48,    84,    39,    75,    -1,    88,    41,
      88,    -1,    88,    41,    88,    40,    88,    -1,    18,    49,
      -1,    18,    87,    49,    -1,    19,    49,    -1,   102,    48,
      87,    -1,   102,    23,    87,    -1,   102,    24,    87,    -1,
     102,    26,    87,    -1,   102,    25,    87,    -1,   102,    31,
      -1,   102,    30,    -1,    88,    -1,    88,    46,    89,    -1,
      89,    -1,    89,    45,    90,    -1,    90,    -1,    47,    90,
      -1,    91,    -1,    93,    92,    93,    -1,    93,    -1,    27,
      -1,    32,    -1,    33,    -1,    28,    -1,    22,    -1,    29,
      -1,    93,    94,    95,    -1,    95,    -1,    36,    -1,    35,
      -1,    95,    96,    97,    -1,    97,    -1,    37,    -1,    44,
      -1,    97,    98,    99,    -1,    99,    -1,    34,    -1,    38,
      -1,    42,    -1,   100,    99,    -1,   101,    -1,    44,    -1,
      34,    -1,    43,    -1,   103,    -1,   102,    -1,     7,    -1,
     102,    53,    87,    54,    -1,    51,    87,    52,    -1,   104,
      -1,   107,    -1,     7,    51,   105,    52,    -1,   106,    -1,
      -1,   106,    55,    87,    -1,    87,    -1,     4,    -1,     5,
      -1,     6,    -1,     3,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    53,    53,    57,    64,    68,    76,    83,    88,    95,
      99,   104,   108,   115,   119,   125,   129,   133,   141,   145,
     151,   156,   161,   165,   171,   178,   182,   188,   192,   203,
     207,   213,   217,   221,   225,   229,   233,   239,   243,   249,
     253,   259,   265,   270,   275,   280,   285,   292,   297,   303,
     307,   313,   317,   323,   328,   334,   338,   344,   352,   356,
     360,   364,   368,   372,   376,   380,   386,   390,   396,   400,
     406,   410,   416,   420,   426,   430,   434,   438,   442,   446,
     452,   456,   462,   466,   472,   476,   481,   485,   491,   495,
     501,   505,   509,   515,   519,   524,   528,   532,   538,   542,
     548,   552,   558,   562,   566,   572,   578,   583,   588,   592,
     598,   602,   606,   610
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "BOOLCONST", "NUMCONST", "CHARCONST",
  "STRINGCONST", "ID", "THEN", "IF", "WHILE", "FOR", "STATIC", "INT",
  "BOOL", "CHAR", "IN", "ELSE", "RETURN", "BREAK", "COMMENT", "SYMBOL",
  "EQ", "ADDASS", "SUBASS", "DIVASS", "MULASS", "LEQ", "GEQ", "NEQ", "DEC",
  "INC", "LT", "GT", "MUL", "MAX", "MIN", "ADD", "DIV", "DO", "BY", "TO",
  "MOD", "RAND", "SUB", "AND", "OR", "NOT", "ASS", "SEMICOLON", "COLON",
  "LP", "RP", "LB", "RB", "COMMA", "LCB", "RCB", "$accept", "declList",
  "decl", "varDecl", "scopedVarDecl", "varDeclList", "varDeclInit",
  "varDeclId", "typeSpec", "funDecl", "parms", "parmList", "parmTypeList",
  "parmIdList", "parmId", "stmt", "matched", "unmatched", "expStmt",
  "compoundStmt", "localDecls", "stmtList", "matchedselectStmt",
  "unmatchedselectStmt", "matchediterStmt", "unmatchediterStmt",
  "iterrange", "returnStmt", "breakStmt", "exp", "simpleExp", "andExp",
  "unaryRelExp", "relExp", "relop", "minmaxExp", "minmaxop", "sumExp",
  "sumop", "mulExp", "mulop", "unaryExp", "unaryop", "factor", "mutable",
  "immutable", "call", "args", "argList", "constant", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    58,    59,    59,    60,    60,    61,    62,    62,    63,
      63,    64,    64,    65,    65,    66,    66,    66,    67,    67,
      68,    68,    69,    69,    70,    71,    71,    72,    72,    73,
      73,    74,    74,    74,    74,    74,    74,    75,    75,    76,
      76,    77,    78,    78,    79,    79,    80,    81,    81,    82,
      82,    83,    83,    84,    84,    85,    85,    86,    87,    87,
      87,    87,    87,    87,    87,    87,    88,    88,    89,    89,
      90,    90,    91,    91,    92,    92,    92,    92,    92,    92,
      93,    93,    94,    94,    95,    95,    96,    96,    97,    97,
      98,    98,    98,    99,    99,   100,   100,   100,   101,   101,
     102,   102,   103,   103,   103,   104,   105,   105,   106,   106,
     107,   107,   107,   107
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     1,     1,     1,     3,     4,     3,     3,
       1,     1,     3,     1,     4,     1,     1,     1,     6,     5,
       1,     0,     3,     1,     2,     3,     1,     1,     3,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     2,
       1,     4,     2,     0,     2,     0,     6,     4,     6,     4,
       6,     4,     6,     3,     5,     2,     3,     2,     3,     3,
       3,     3,     3,     2,     2,     1,     3,     1,     3,     1,
       2,     1,     3,     1,     1,     1,     1,     1,     1,     1,
       3,     1,     1,     1,     3,     1,     1,     1,     3,     1,
       1,     1,     1,     2,     1,     1,     1,     1,     1,     1,
       1,     4,     3,     1,     1,     4,     1,     0,     3,     1,
       1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,    15,    16,    17,     0,     3,     4,     0,     5,
      21,     1,     2,    13,     0,    10,    11,     0,     0,    20,
      23,    21,     0,     6,     0,     0,    27,    24,    26,     0,
       0,     0,     0,    13,     9,   113,   110,   111,   112,   100,
      96,    97,    95,     0,     0,    12,    67,    69,    71,    73,
      81,    85,    89,     0,    94,    99,    98,   103,   104,     0,
       0,     0,     0,     0,     0,     0,    40,    43,    19,    29,
      30,    31,    32,    33,    37,    34,    38,    35,    36,     0,
      65,    99,    22,     0,    14,   107,    70,     0,     0,     0,
      78,    74,    77,    79,    75,    76,    83,    82,     0,     0,
      86,    87,     0,    90,    91,    92,     0,    93,     0,    28,
      25,     0,     0,     0,    55,     0,    57,    45,    39,     0,
       0,     0,     0,    64,    63,     0,    18,   109,     0,   106,
     102,    66,    68,    72,    80,    84,    88,     0,     0,     0,
       0,    56,     0,    42,     0,     0,    59,    60,    62,    61,
      58,   105,     0,   101,    47,    29,    49,    51,     0,     0,
       0,     0,    41,    44,   108,     0,     0,     0,     0,     8,
      46,    48,    50,    52,    53,     7,     0,    54
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     5,     6,     7,   143,    14,    15,    16,    17,     9,
      18,    19,    20,    27,    28,    68,    69,    70,    71,    72,
     117,   145,    73,    74,    75,    76,   158,    77,    78,    79,
      80,    46,    47,    48,    98,    49,    99,    50,   102,    51,
     106,    52,    53,    54,    81,    56,    57,   128,   129,    58
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -132
static const yytype_int16 yypact[] =
{
      65,   -18,  -132,  -132,  -132,    10,  -132,  -132,    40,  -132,
     157,  -132,  -132,   -38,    -7,  -132,    17,    63,   -40,    33,
    -132,   157,    42,  -132,    93,   153,    57,    58,  -132,   118,
     157,    62,    66,    78,  -132,  -132,  -132,  -132,  -132,    81,
    -132,  -132,  -132,   153,   153,    70,    88,  -132,  -132,    76,
      39,    92,  -132,   174,  -132,    82,  -132,  -132,  -132,    96,
      63,   153,   153,   147,   142,   106,  -132,  -132,  -132,  -132,
    -132,  -132,  -132,  -132,  -132,  -132,  -132,  -132,  -132,   114,
      70,    -4,  -132,   118,  -132,   153,  -132,   112,   153,   153,
    -132,  -132,  -132,  -132,  -132,  -132,  -132,  -132,   174,   174,
    -132,  -132,   174,  -132,  -132,  -132,   174,  -132,   153,  -132,
    -132,    -3,    56,   120,  -132,   117,  -132,   126,  -132,   153,
     153,   153,   153,  -132,  -132,   153,  -132,  -132,   121,   127,
    -132,    88,  -132,    -6,    39,    92,  -132,   129,   118,   118,
     153,  -132,   157,  -132,    93,    50,  -132,  -132,  -132,  -132,
    -132,  -132,   153,  -132,  -132,   158,  -132,  -132,   145,    25,
      93,    36,  -132,  -132,  -132,   118,   118,   153,    41,  -132,
    -132,  -132,  -132,  -132,     5,  -132,   153,    70
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -132,  -132,   183,  -132,  -132,  -128,   166,  -132,     1,  -132,
     171,  -132,   164,  -132,   135,   -80,  -131,  -125,  -132,  -132,
    -132,  -132,  -132,  -132,  -132,  -132,  -132,  -132,  -132,   -33,
     -23,   110,   -39,  -132,  -132,   101,  -132,   102,  -132,   100,
    -132,   -44,  -132,  -132,   -25,  -132,  -132,  -132,  -132,  -132
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
      55,     8,    45,   126,    86,   138,     8,   155,   156,   107,
      11,    87,    29,    21,   157,    22,   161,     1,    55,   119,
     120,   121,   122,     2,     3,     4,   123,   124,    55,    96,
      97,   115,   168,    10,   170,   172,    55,    55,   111,   112,
     171,   173,    23,    88,   125,   176,    32,    13,    24,   108,
     132,    88,   127,    35,    36,    37,    38,    39,   154,    61,
      62,    63,   136,    55,    55,   163,   167,    25,    64,    65,
      26,    88,     1,    55,    55,   137,   100,    55,     2,     3,
       4,    55,    30,   101,    40,   169,   146,   147,   148,   149,
     175,    24,   150,    41,    42,   139,    24,    43,    90,    66,
      33,    44,    88,    91,    92,    93,    67,   162,    94,    95,
      59,    96,    97,    60,    83,    55,    88,   159,   144,   164,
      84,    35,    36,    37,    38,    39,   103,    61,    62,    63,
     104,    22,    85,    89,   105,   108,    64,    65,   142,     2,
       3,     4,    55,   160,   174,    35,    36,    37,    38,    39,
     109,    55,    40,   177,   113,   116,    35,    36,    37,    38,
      39,    41,    42,   118,   130,    43,   141,    66,   140,    44,
       2,     3,     4,   151,    67,   165,    40,    35,    36,    37,
      38,    39,   152,   153,   166,    41,    42,    40,    12,    43,
      34,   114,    31,    44,    82,   110,    41,    42,   131,   133,
      43,   134,   135,     0,    44,     0,     0,     0,    40,     0,
       0,     0,     0,     0,     0,     0,     0,    41,    42,     0,
       0,     0,     0,     0,     0,    44
};

static const yytype_int16 yycheck[] =
{
      25,     0,    25,    83,    43,     8,     5,   138,   139,    53,
       0,    44,    52,    51,   139,    53,   144,     7,    43,    23,
      24,    25,    26,    13,    14,    15,    30,    31,    53,    35,
      36,    64,   160,    51,   165,   166,    61,    62,    61,    62,
     165,   166,    49,    46,    48,    40,     4,     7,    55,    53,
      89,    46,    85,     3,     4,     5,     6,     7,   138,     9,
      10,    11,   106,    88,    89,   145,    41,    50,    18,    19,
       7,    46,     7,    98,    99,   108,    37,   102,    13,    14,
      15,   106,    49,    44,    34,    49,   119,   120,   121,   122,
      49,    55,   125,    43,    44,    39,    55,    47,    22,    49,
       7,    51,    46,    27,    28,    29,    56,    57,    32,    33,
      53,    35,    36,    55,    52,   140,    46,   140,   117,   152,
      54,     3,     4,     5,     6,     7,    34,     9,    10,    11,
      38,    53,    51,    45,    42,    53,    18,    19,    12,    13,
      14,    15,   167,   142,   167,     3,     4,     5,     6,     7,
      54,   176,    34,   176,     7,    49,     3,     4,     5,     6,
       7,    43,    44,    49,    52,    47,    49,    49,    48,    51,
      13,    14,    15,    52,    56,    17,    34,     3,     4,     5,
       6,     7,    55,    54,    39,    43,    44,    34,     5,    47,
      24,    49,    21,    51,    30,    60,    43,    44,    88,    98,
      47,    99,   102,    -1,    51,    -1,    -1,    -1,    34,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    43,    44,    -1,
      -1,    -1,    -1,    -1,    -1,    51
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     7,    13,    14,    15,    59,    60,    61,    66,    67,
      51,     0,    60,     7,    63,    64,    65,    66,    68,    69,
      70,    51,    53,    49,    55,    50,     7,    71,    72,    52,
      49,    68,     4,     7,    64,     3,     4,     5,     6,     7,
      34,    43,    44,    47,    51,    88,    89,    90,    91,    93,
      95,    97,    99,   100,   101,   102,   103,   104,   107,    53,
      55,     9,    10,    11,    18,    19,    49,    56,    73,    74,
      75,    76,    77,    80,    81,    82,    83,    85,    86,    87,
      88,   102,    70,    52,    54,    51,    90,    87,    46,    45,
      22,    27,    28,    29,    32,    33,    35,    36,    92,    94,
      37,    44,    96,    34,    38,    42,    98,    99,    53,    54,
      72,    88,    88,     7,    49,    87,    49,    78,    49,    23,
      24,    25,    26,    30,    31,    48,    73,    87,   105,   106,
      52,    89,    90,    93,    95,    97,    99,    87,     8,    39,
      48,    49,    12,    62,    66,    79,    87,    87,    87,    87,
      87,    52,    55,    54,    73,    74,    74,    75,    84,    88,
      66,    63,    57,    73,    87,    17,    39,    41,    63,    49,
      74,    75,    74,    75,    88,    49,    40,    88
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value, Location); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
#endif
{
  if (!yyvaluep)
    return;
  YYUSE (yylocationp);
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, yylocationp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  YY_LOCATION_PRINT (yyoutput, *yylocationp);
  YYFPRINTF (yyoutput, ": ");
  yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yylsp, yyrule)
    YYSTYPE *yyvsp;
    YYLTYPE *yylsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       , &(yylsp[(yyi + 1) - (yynrhs)])		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, yylsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocationp)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, yylocationp)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    YYLTYPE *yylocationp;
#endif
{
  YYUSE (yyvaluep);
  YYUSE (yylocationp);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;
/* Location data for the look-ahead symbol.  */
YYLTYPE yylloc;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;

  /* The location stack.  */
  YYLTYPE yylsa[YYINITDEPTH];
  YYLTYPE *yyls = yylsa;
  YYLTYPE *yylsp;
  /* The locations where the error started and ended.  */
  YYLTYPE yyerror_range[2];

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;
  yylsp = yyls;
#if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
  /* Initialize the default location before parsing starts.  */
  yylloc.first_line   = yylloc.last_line   = 1;
  yylloc.first_column = yylloc.last_column = 0;
#endif

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;
	YYLTYPE *yyls1 = yyls;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yyls1, yysize * sizeof (*yylsp),
		    &yystacksize);
	yyls = yyls1;
	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);
	YYSTACK_RELOCATE (yyls);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
      yylsp = yyls + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;
  *++yylsp = yylloc;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

  /* Default location.  */
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 54 "parser.y"
    {
        tree->append((yyvsp[(2) - (2)].treeNode));
    ;}
    break;

  case 3:
#line 58 "parser.y"
    {
        tree->append((yyvsp[(1) - (1)].treeNode));
        (yyvsp[(1) - (1)].treeNode)->setFirst();
    ;}
    break;

  case 4:
#line 65 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 5:
#line 69 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 6:
#line 77 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(2) - (3)].treeNode);
        ((Var *)(yyval.treeNode))->setTypeAndStatic((yyvsp[(1) - (3)].tokenData)->tokenstr, false);
    ;}
    break;

  case 7:
#line 84 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(3) - (4)].treeNode);
        ((Var *)(yyval.treeNode))->setTypeAndStatic((yyvsp[(2) - (4)].tokenData)->tokenstr, true);
    ;}
    break;

  case 8:
#line 89 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(2) - (3)].treeNode);
        ((Var *)(yyval.treeNode))->setTypeAndStatic((yyvsp[(1) - (3)].tokenData)->tokenstr, false);
    ;}
    break;

  case 9:
#line 96 "parser.y"
    {
        (yyval.treeNode)->append((yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 10:
#line 100 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 11:
#line 105 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 12:
#line 109 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (3)].treeNode);
        (yyval.treeNode)->addChild((yyvsp[(3) - (3)].treeNode), 0);
    ;}
    break;

  case 13:
#line 116 "parser.y"
    {
        (yyval.treeNode) = new Var((yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 14:
#line 120 "parser.y"
    {
        (yyval.treeNode) = new Var((yyvsp[(1) - (4)].tokenData), (yyvsp[(3) - (4)].tokenData));
    ;}
    break;

  case 15:
#line 126 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 16:
#line 130 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 17:
#line 134 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 18:
#line 142 "parser.y"
    {
        (yyval.treeNode) = new FunDecl((yyvsp[(1) - (6)].tokenData), (yyvsp[(2) - (6)].tokenData), (yyvsp[(4) - (6)].treeNode), (yyvsp[(6) - (6)].treeNode));
    ;}
    break;

  case 19:
#line 146 "parser.y"
    {
        (yyval.treeNode) = new FunDecl((yyvsp[(1) - (5)].tokenData), (yyvsp[(3) - (5)].treeNode), (yyvsp[(5) - (5)].treeNode));
    ;}
    break;

  case 20:
#line 152 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 21:
#line 156 "parser.y"
    {
        (yyval.treeNode) = NULL;
    ;}
    break;

  case 22:
#line 162 "parser.y"
    {
        (yyval.treeNode)->append((yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 23:
#line 166 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 24:
#line 172 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(2) - (2)].treeNode);
        ((Parm *)(yyval.treeNode))->setType((yyvsp[(1) - (2)].tokenData)->tokenstr);
    ;}
    break;

  case 25:
#line 179 "parser.y"
    {
        (yyval.treeNode)->append((yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 26:
#line 183 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 27:
#line 189 "parser.y"
    {
        (yyval.treeNode) = new Parm((yyvsp[(1) - (1)].tokenData), false);
    ;}
    break;

  case 28:
#line 193 "parser.y"
    {
        (yyval.treeNode) = new Parm((yyvsp[(1) - (3)].tokenData), true);
    ;}
    break;

  case 29:
#line 204 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 30:
#line 208 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 31:
#line 214 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 32:
#line 218 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 33:
#line 222 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 34:
#line 226 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 35:
#line 230 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 36:
#line 234 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 37:
#line 240 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 38:
#line 244 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 39:
#line 250 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (2)].treeNode);
    ;}
    break;

  case 40:
#line 254 "parser.y"
    {
        (yyval.treeNode) = NULL;
    ;}
    break;

  case 41:
#line 260 "parser.y"
    {
        (yyval.treeNode) = new CompoundStatement(yylineno, (yyvsp[(2) - (4)].treeNode), (yyvsp[(3) - (4)].treeNode));
    ;}
    break;

  case 42:
#line 266 "parser.y"
    {
        (yyval.treeNode)->append((yyvsp[(2) - (2)].treeNode));
    ;}
    break;

  case 43:
#line 270 "parser.y"
    {
        (yyval.treeNode) = new treeNode();
    ;}
    break;

  case 44:
#line 276 "parser.y"
    {
        (yyval.treeNode)->append((yyvsp[(2) - (2)].treeNode));
    ;}
    break;

  case 45:
#line 280 "parser.y"
    {
        (yyval.treeNode) = new treeNode();
    ;}
    break;

  case 46:
#line 286 "parser.y"
    {
        (yyval.treeNode) = new If(yylineno, (yyvsp[(2) - (6)].treeNode), (yyvsp[(4) - (6)].treeNode), (yyvsp[(6) - (6)].treeNode));
        
    ;}
    break;

  case 47:
#line 293 "parser.y"
    {
        (yyval.treeNode) = new If(yylineno, (yyvsp[(2) - (4)].treeNode), (yyvsp[(4) - (4)].treeNode));
    
    ;}
    break;

  case 48:
#line 298 "parser.y"
    {
        (yyval.treeNode) = new If(yylineno, (yyvsp[(2) - (6)].treeNode), (yyvsp[(4) - (6)].treeNode), (yyvsp[(6) - (6)].treeNode));
    ;}
    break;

  case 49:
#line 304 "parser.y"
    {
        (yyval.treeNode) = new WHILe(yylineno, (yyvsp[(2) - (4)].treeNode), (yyvsp[(4) - (4)].treeNode));
    ;}
    break;

  case 50:
#line 308 "parser.y"
    {
        (yyval.treeNode) = new For(yylineno, (yyvsp[(2) - (6)].tokenData), (yyvsp[(4) - (6)].treeNode), (yyvsp[(6) - (6)].treeNode));
    ;}
    break;

  case 51:
#line 314 "parser.y"
    {
        (yyval.treeNode) = new WHILe(yylineno, (yyvsp[(2) - (4)].treeNode), (yyvsp[(4) - (4)].treeNode));
    ;}
    break;

  case 52:
#line 318 "parser.y"
    {
        (yyval.treeNode) = new For(yylineno, (yyvsp[(2) - (6)].tokenData), (yyvsp[(4) - (6)].treeNode), (yyvsp[(6) - (6)].treeNode));
    ;}
    break;

  case 53:
#line 324 "parser.y"
    {
        (yyval.treeNode) = new Range(yylineno, (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 54:
#line 329 "parser.y"
    {
        (yyval.treeNode) = new Range(yylineno, (yyvsp[(1) - (5)].treeNode), (yyvsp[(3) - (5)].treeNode), (yyvsp[(5) - (5)].treeNode));
    ;}
    break;

  case 55:
#line 335 "parser.y"
    {
        (yyval.treeNode) = new Return(yylineno);
    ;}
    break;

  case 56:
#line 339 "parser.y"
    {
        (yyval.treeNode) = new Return(yylineno, (yyvsp[(2) - (3)].treeNode));
    ;}
    break;

  case 57:
#line 345 "parser.y"
    {
        (yyval.treeNode) = new Break(yylineno);
    ;}
    break;

  case 58:
#line 353 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 59:
#line 357 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 60:
#line 361 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 61:
#line 365 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 62:
#line 369 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 63:
#line 373 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].treeNode));
    ;}
    break;

  case 64:
#line 377 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].treeNode));
    ;}
    break;

  case 65:
#line 381 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 66:
#line 387 "parser.y"
    {
        (yyval.treeNode) = new LogicExpression((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 67:
#line 391 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 68:
#line 397 "parser.y"
    {
        (yyval.treeNode) = new LogicExpression((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 69:
#line 401 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 70:
#line 407 "parser.y"
    {
        (yyval.treeNode) = new LogicExpression((yyvsp[(1) - (2)].tokenData), (yyvsp[(2) - (2)].treeNode));
    ;}
    break;

  case 71:
#line 411 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 72:
#line 417 "parser.y"
    {
        (yyval.treeNode) = new Relation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 73:
#line 421 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode)
    ;}
    break;

  case 74:
#line 427 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 75:
#line 431 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 76:
#line 435 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 77:
#line 439 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 78:
#line 443 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 79:
#line 447 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 80:
#line 453 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 81:
#line 457 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 82:
#line 463 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 83:
#line 467 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 84:
#line 473 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 85:
#line 477 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 86:
#line 482 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 87:
#line 486 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 88:
#line 492 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 89:
#line 496 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 90:
#line 502 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 91:
#line 506 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 92:
#line 510 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 93:
#line 516 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(1) - (2)].tokenData), (yyvsp[(2) - (2)].treeNode));
    ;}
    break;

  case 94:
#line 520 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 95:
#line 525 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 96:
#line 529 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 97:
#line 533 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 98:
#line 539 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 99:
#line 543 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 100:
#line 549 "parser.y"
    {
        (yyval.treeNode) = new VarAccess((yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 101:
#line 553 "parser.y"
    {
        (yyval.treeNode) = new VarAccess(yylineno, (yyvsp[(1) - (4)].treeNode), (yyvsp[(3) - (4)].treeNode));
    ;}
    break;

  case 102:
#line 559 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(2) - (3)].treeNode);
    ;}
    break;

  case 103:
#line 563 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 104:
#line 567 "parser.y"
    {
        (yyval.treeNode) = new Constant((yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 105:
#line 573 "parser.y"
    {
        (yyval.treeNode) = new Call((yyvsp[(1) - (4)].tokenData), (yyvsp[(3) - (4)].treeNode));
    ;}
    break;

  case 106:
#line 579 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 107:
#line 583 "parser.y"
    {
        (yyval.treeNode) = NULL;
    ;}
    break;

  case 108:
#line 589 "parser.y"
    {
        (yyval.treeNode)->append((yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 109:
#line 593 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 110:
#line 599 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 111:
#line 603 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 112:
#line 607 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 113:
#line 611 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2466 "parser.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }

  yyerror_range[0] = yylloc;

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval, &yylloc);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  yyerror_range[0] = yylsp[1-yylen];
  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;

      yyerror_range[0] = *yylsp;
      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp, yylsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;

  yyerror_range[1] = yylloc;
  /* Using YYLLOC is tempting, but would change the location of
     the look-ahead.  YYLOC is available though.  */
  YYLLOC_DEFAULT (yyloc, (yyerror_range - 1), 2);
  *++yylsp = yyloc;

  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval, &yylloc);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp, yylsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 616 "parser.y"



int main(int argc, char *argv[])
{
    tree = new treeNode();
    tree->index = -1;
    
    int d = 0, p = 0;
    int c;
    
    while((c = ourGetopt(argc, argv, (char *)"dp")) != -1)
    {
        switch(c)
        {
            case 'd':
                d = 1;
                break;
            case 'p':
                p = 1;
                break;
            case '?':
                fprintf(stderr, "usage: c- [-d] [-p] file\n");
                return -1;
        }
    }
    
    if(d == 1)
    {
        yydebug = 1;
    }
    
    if(optind < argc)
    {
        yyin = fopen(argv[optind], "r");
        yyparse();
        fclose(yyin);
    }
    else
    {
        yyparse();
    }
    
    tree->getData();
    
    if(p == 1)
    {
        tree->printTree();
    }
    
    return 0;
        
}

