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
     AND = 299,
     OR = 300,
     NOT = 301,
     ASS = 302
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
#define AND 299
#define OR 300
#define NOT 301
#define ASS 302




/* Copy the first part of user declarations.  */
#line 1 "parser.y"

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <cstring>
#include <string.h>
#include <string>
#include "scanType.h"
#include "ourgetopt.hpp"


extern int yylex();
extern FILE *yyin;
extern int yydebug;
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
#line 28 "parser.y"
{
    TokenData *tokenData;
    treeNode *treeNode;
    
}
/* Line 193 of yacc.c.  */
#line 220 "parser.tab.c"
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
#line 245 "parser.tab.c"

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
#define YYFINAL  12
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   260

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  57
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  47
/* YYNRULES -- Number of rules.  */
#define YYNRULES  107
/* YYNRULES -- Number of states.  */
#define YYNSTATES  179

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   302

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      53,    54,     2,     2,    49,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    50,    48,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    51,     2,    52,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    55,     2,    56,     2,     2,     2,     2,
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
      45,    46,    47
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     8,    10,    12,    14,    18,    23,
      27,    31,    33,    35,    39,    41,    46,    48,    50,    52,
      59,    65,    67,    68,    72,    74,    77,    81,    83,    85,
      89,    91,    93,    95,    97,    99,   101,   104,   106,   111,
     114,   115,   118,   119,   125,   134,   141,   151,   155,   161,
     164,   168,   171,   175,   179,   183,   187,   191,   194,   197,
     199,   203,   205,   209,   211,   214,   216,   220,   222,   224,
     226,   228,   230,   232,   234,   238,   240,   242,   244,   248,
     250,   252,   254,   258,   260,   262,   264,   266,   269,   271,
     273,   275,   277,   279,   281,   283,   288,   292,   294,   296,
     301,   303,   304,   308,   310,   312,   314,   316
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      58,     0,    -1,    59,    -1,    59,    60,    -1,    60,    -1,
      61,    -1,    67,    -1,    66,    63,    48,    -1,    12,    66,
      63,    48,    -1,    66,    63,    48,    -1,    63,    49,    64,
      -1,    64,    -1,    65,    -1,    65,    50,    84,    -1,     7,
      -1,     7,    51,     4,    52,    -1,    13,    -1,    14,    -1,
      15,    -1,    66,     7,    53,    68,    54,    73,    -1,     7,
      53,    68,    54,    73,    -1,    69,    -1,    -1,    69,    48,
      70,    -1,    70,    -1,    66,    71,    -1,    71,    49,    72,
      -1,    72,    -1,     7,    -1,     7,    51,    52,    -1,    74,
      -1,    75,    -1,    78,    -1,    79,    -1,    81,    -1,    82,
      -1,    83,    48,    -1,    48,    -1,    55,    76,    77,    56,
      -1,    76,    62,    -1,    -1,    77,    73,    -1,    -1,     9,
      53,    84,    54,    73,    -1,     9,    53,    84,    54,     8,
      73,    17,    73,    -1,    10,    53,    84,    54,    39,    73,
      -1,    11,    53,     7,    16,     7,    54,    80,    39,    73,
      -1,    84,    41,    84,    -1,    84,    41,    84,    40,    84,
      -1,    18,    48,    -1,    18,    83,    48,    -1,    19,    48,
      -1,    98,    47,    83,    -1,    98,    23,    83,    -1,    98,
      24,    83,    -1,    98,    26,    83,    -1,    98,    25,    83,
      -1,    98,    31,    -1,    98,    30,    -1,    84,    -1,    84,
      45,    85,    -1,    85,    -1,    85,    44,    86,    -1,    86,
      -1,    46,    86,    -1,    87,    -1,    89,    88,    89,    -1,
      89,    -1,    27,    -1,    32,    -1,    33,    -1,    28,    -1,
      22,    -1,    29,    -1,    89,    90,    91,    -1,    91,    -1,
      36,    -1,    35,    -1,    91,    92,    93,    -1,    93,    -1,
      23,    -1,    24,    -1,    93,    94,    95,    -1,    95,    -1,
      26,    -1,    25,    -1,    42,    -1,    96,    95,    -1,    97,
      -1,    24,    -1,    26,    -1,    43,    -1,    99,    -1,    98,
      -1,     7,    -1,    98,    51,    83,    52,    -1,    53,    83,
      54,    -1,   100,    -1,   103,    -1,     7,    53,   101,    54,
      -1,   102,    -1,    -1,   102,    49,    83,    -1,    83,    -1,
       4,    -1,     5,    -1,     6,    -1,     3,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    51,    51,    56,    60,    67,    71,    79,    86,    91,
      98,   102,   107,   111,   118,   122,   128,   132,   136,   144,
     148,   154,   159,   164,   168,   174,   181,   185,   191,   195,
     203,   207,   211,   215,   219,   223,   229,   233,   239,   245,
     250,   255,   260,   265,   270,   276,   280,   286,   290,   296,
     300,   306,   314,   318,   322,   326,   330,   334,   338,   342,
     348,   352,   358,   362,   368,   372,   378,   382,   388,   392,
     396,   400,   404,   408,   414,   418,   424,   428,   434,   438,
     443,   447,   453,   457,   463,   467,   471,   477,   481,   486,
     490,   494,   500,   504,   510,   514,   520,   524,   528,   534,
     540,   545,   550,   554,   560,   564,   568,   572
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
  "MOD", "RAND", "AND", "OR", "NOT", "ASS", "';'", "','", "':'", "'['",
  "']'", "'('", "')'", "'{'", "'}'", "$accept", "program", "declList",
  "decl", "varDecl", "scopedVarDecl", "varDeclList", "varDeclInit",
  "varDeclId", "typeSpec", "funDecl", "parms", "parmList", "parmTypeList",
  "parmIdList", "parmId", "stmt", "expStmt", "compoundStmt", "localDecls",
  "stmtList", "selectStmt", "iterStmt", "iterRange", "returnStmt",
  "breakStmt", "exp", "simpleExp", "andExp", "unaryRelExp", "relExp",
  "relop", "minmaxExp", "minmaxop", "sumExp", "sumop", "mulExp", "mulop",
  "unaryExp", "unaryop", "factor", "mutable", "immutable", "call", "args",
  "argList", "constant", 0
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
     295,   296,   297,   298,   299,   300,   301,   302,    59,    44,
      58,    91,    93,    40,    41,   123,   125
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    57,    58,    59,    59,    60,    60,    61,    62,    62,
      63,    63,    64,    64,    65,    65,    66,    66,    66,    67,
      67,    68,    68,    69,    69,    70,    71,    71,    72,    72,
      73,    73,    73,    73,    73,    73,    74,    74,    75,    76,
      76,    77,    77,    78,    78,    79,    79,    80,    80,    81,
      81,    82,    83,    83,    83,    83,    83,    83,    83,    83,
      84,    84,    85,    85,    86,    86,    87,    87,    88,    88,
      88,    88,    88,    88,    89,    89,    90,    90,    91,    91,
      92,    92,    93,    93,    94,    94,    94,    95,    95,    96,
      96,    96,    97,    97,    98,    98,    99,    99,    99,   100,
     101,   101,   102,   102,   103,   103,   103,   103
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     3,     4,     3,
       3,     1,     1,     3,     1,     4,     1,     1,     1,     6,
       5,     1,     0,     3,     1,     2,     3,     1,     1,     3,
       1,     1,     1,     1,     1,     1,     2,     1,     4,     2,
       0,     2,     0,     5,     8,     6,     9,     3,     5,     2,
       3,     2,     3,     3,     3,     3,     3,     2,     2,     1,
       3,     1,     3,     1,     2,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     3,     1,     1,     1,     3,     1,
       1,     1,     3,     1,     1,     1,     1,     2,     1,     1,
       1,     1,     1,     1,     1,     4,     3,     1,     1,     4,
       1,     0,     3,     1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,    16,    17,    18,     0,     2,     4,     5,     0,
       6,    22,     1,     3,    14,     0,    11,    12,     0,     0,
      21,    24,     0,    22,     7,     0,     0,    28,    25,    27,
       0,     0,     0,     0,    14,    10,   107,   104,   105,   106,
      94,    89,    90,    91,     0,     0,    13,    61,    63,    65,
      67,    75,    79,    83,     0,    88,    93,    92,    97,    98,
       0,     0,     0,     0,     0,     0,     0,    37,    40,    20,
      30,    31,    32,    33,    34,    35,     0,    59,    93,    23,
      15,     0,   101,    64,     0,     0,     0,    72,    68,    71,
      73,    69,    70,    77,    76,     0,     0,    80,    81,     0,
      85,    84,    86,     0,    87,     0,    29,    26,     0,     0,
       0,    49,     0,    51,    42,    36,     0,     0,     0,     0,
      58,    57,     0,    19,   103,     0,   100,    96,    60,    62,
      66,    74,    78,    82,     0,     0,     0,     0,    50,     0,
      39,     0,     0,    53,    54,    56,    55,    52,    99,     0,
      95,     0,     0,     0,     0,     0,    38,    41,   102,     0,
      43,     0,     0,     0,     9,     0,    45,     0,     8,     0,
       0,     0,    44,     0,     0,    46,    47,     0,    48
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     5,     6,     7,     8,   140,    15,    16,    17,    18,
      10,    19,    20,    21,    28,    29,    69,    70,    71,   114,
     142,    72,    73,   170,    74,    75,    76,    77,    47,    48,
      49,    95,    50,    96,    51,    99,    52,   103,    53,    54,
      55,    78,    57,    58,   125,   126,    59
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -138
static const yytype_int16 yypact[] =
{
      42,   -47,  -138,  -138,  -138,    16,    42,  -138,  -138,    12,
    -138,    65,  -138,  -138,    21,    14,  -138,   -16,    19,   -17,
      -8,  -138,    46,    65,  -138,    69,    18,    40,    48,  -138,
     198,    65,    49,    45,    55,  -138,  -138,  -138,  -138,  -138,
      54,  -138,  -138,  -138,    18,    18,    66,    70,  -138,  -138,
     127,    23,   -12,  -138,   207,  -138,    62,  -138,  -138,  -138,
      80,    19,    67,    78,    81,     5,    85,  -138,  -138,  -138,
    -138,  -138,  -138,  -138,  -138,  -138,    87,    66,    79,  -138,
    -138,   198,    18,  -138,    64,    18,    18,  -138,  -138,  -138,
    -138,  -138,  -138,  -138,  -138,   207,   207,  -138,  -138,   207,
    -138,  -138,  -138,   207,  -138,    18,  -138,  -138,    18,    18,
     131,  -138,    91,  -138,    53,  -138,    18,    18,    18,    18,
    -138,  -138,    18,  -138,  -138,    92,    96,  -138,    70,  -138,
      58,    23,   -12,  -138,    95,   -18,   -13,   136,  -138,    65,
    -138,    69,   118,  -138,  -138,  -138,  -138,  -138,  -138,    18,
    -138,   172,   119,   150,    69,    47,  -138,  -138,  -138,   198,
    -138,   198,   111,    68,  -138,   151,  -138,    18,  -138,   198,
     128,    -2,  -138,   198,    18,  -138,    -7,    18,    66
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -138,  -138,  -138,   163,  -138,  -138,  -137,   145,  -138,     1,
    -138,   149,  -138,   153,  -138,   124,   -61,  -138,  -138,  -138,
    -138,  -138,  -138,  -138,  -138,  -138,   -30,   -24,   101,   -41,
    -138,  -138,    93,  -138,    97,  -138,    88,  -138,   -49,  -138,
    -138,   -26,  -138,  -138,  -138,  -138,  -138
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
      56,     9,    46,    83,   155,   104,    11,     9,    36,    37,
      38,    39,    40,   100,   101,    84,    12,   163,    56,    14,
     123,    36,    37,    38,    39,    40,    27,    85,    56,    41,
     102,    42,    85,   177,    26,   112,   151,    30,    85,   174,
      31,   152,    41,    85,    42,   129,    97,    98,    43,     1,
      32,    44,   124,   111,   133,     2,     3,     4,    45,    56,
      56,    43,    24,    25,    44,   139,     2,     3,     4,    56,
      56,    45,    22,    56,    23,   134,    34,    56,     2,     3,
       4,   157,    56,    56,   135,   136,   143,   144,   145,   146,
     160,    60,   147,    93,    94,   164,    25,    61,   165,    81,
     166,    80,   116,   117,   118,   119,    22,    82,   172,   120,
     121,    85,   175,   105,    86,   141,   168,    25,   127,   158,
     108,    36,    37,    38,    39,    40,   122,    62,    63,    64,
     105,   109,   106,   113,   110,   115,    65,    66,   137,   138,
     154,    56,    41,   171,    42,   149,   148,   150,    56,    87,
     176,    56,   153,   178,    88,    89,    90,   162,   161,    91,
      92,    43,    93,    94,    44,   167,    67,   173,   169,    13,
      35,    45,    33,    68,   156,    36,    37,    38,    39,    40,
     159,    62,    63,    64,    79,   107,   128,   132,   130,     0,
      65,    66,     0,   131,     0,     0,    41,     0,    42,     0,
       0,    36,    37,    38,    39,    40,     0,    62,    63,    64,
      36,    37,    38,    39,    40,    43,    65,    66,    44,     0,
      67,     0,    41,     0,    42,    45,     0,    68,     0,     0,
       0,    41,     0,    42,     0,     0,     0,     0,     0,     0,
       0,    43,     0,     0,    44,     0,    67,     0,     0,     0,
      43,    45,     0,    68,     0,     0,     0,     0,     0,     0,
      45
};

static const yytype_int16 yycheck[] =
{
      26,     0,    26,    44,   141,    54,    53,     6,     3,     4,
       5,     6,     7,    25,    26,    45,     0,   154,    44,     7,
      81,     3,     4,     5,     6,     7,     7,    45,    54,    24,
      42,    26,    45,    40,    50,    65,    54,    54,    45,    41,
      48,    54,    24,    45,    26,    86,    23,    24,    43,     7,
       4,    46,    82,    48,   103,    13,    14,    15,    53,    85,
      86,    43,    48,    49,    46,    12,    13,    14,    15,    95,
      96,    53,    51,    99,    53,   105,     7,   103,    13,    14,
      15,   142,   108,   109,   108,   109,   116,   117,   118,   119,
     151,    51,   122,    35,    36,    48,    49,    49,   159,    54,
     161,    52,    23,    24,    25,    26,    51,    53,   169,    30,
      31,    45,   173,    51,    44,   114,    48,    49,    54,   149,
      53,     3,     4,     5,     6,     7,    47,     9,    10,    11,
      51,    53,    52,    48,    53,    48,    18,    19,     7,    48,
     139,   167,    24,   167,    26,    49,    54,    52,   174,    22,
     174,   177,    16,   177,    27,    28,    29,     7,    39,    32,
      33,    43,    35,    36,    46,    54,    48,    39,    17,     6,
      25,    53,    23,    55,    56,     3,     4,     5,     6,     7,
       8,     9,    10,    11,    31,    61,    85,    99,    95,    -1,
      18,    19,    -1,    96,    -1,    -1,    24,    -1,    26,    -1,
      -1,     3,     4,     5,     6,     7,    -1,     9,    10,    11,
       3,     4,     5,     6,     7,    43,    18,    19,    46,    -1,
      48,    -1,    24,    -1,    26,    53,    -1,    55,    -1,    -1,
      -1,    24,    -1,    26,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    43,    -1,    -1,    46,    -1,    48,    -1,    -1,    -1,
      43,    53,    -1,    55,    -1,    -1,    -1,    -1,    -1,    -1,
      53
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     7,    13,    14,    15,    58,    59,    60,    61,    66,
      67,    53,     0,    60,     7,    63,    64,    65,    66,    68,
      69,    70,    51,    53,    48,    49,    50,     7,    71,    72,
      54,    48,     4,    68,     7,    64,     3,     4,     5,     6,
       7,    24,    26,    43,    46,    53,    84,    85,    86,    87,
      89,    91,    93,    95,    96,    97,    98,    99,   100,   103,
      51,    49,     9,    10,    11,    18,    19,    48,    55,    73,
      74,    75,    78,    79,    81,    82,    83,    84,    98,    70,
      52,    54,    53,    86,    83,    45,    44,    22,    27,    28,
      29,    32,    33,    35,    36,    88,    90,    23,    24,    92,
      25,    26,    42,    94,    95,    51,    52,    72,    53,    53,
      53,    48,    83,    48,    76,    48,    23,    24,    25,    26,
      30,    31,    47,    73,    83,   101,   102,    54,    85,    86,
      89,    91,    93,    95,    83,    84,    84,     7,    48,    12,
      62,    66,    77,    83,    83,    83,    83,    83,    54,    49,
      52,    54,    54,    16,    66,    63,    56,    73,    83,     8,
      73,    39,     7,    63,    48,    73,    73,    54,    48,    17,
      80,    84,    73,    39,    41,    73,    84,    40,    84
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
#line 52 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 3:
#line 57 "parser.y"
    {
        tree->append((yyvsp[(2) - (2)].treeNode));
    ;}
    break;

  case 4:
#line 61 "parser.y"
    {
        tree->append((yyvsp[(1) - (1)].treeNode));
        (yyvsp[(1) - (1)].treeNode)->setFirst();
    ;}
    break;

  case 5:
#line 68 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 6:
#line 72 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 7:
#line 80 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(2) - (3)].treeNode);
        ((Var *)(yyval.treeNode))->setTypeAndStatic((yyvsp[(1) - (3)].tokenData)->tokenstr, false);
    ;}
    break;

  case 8:
#line 87 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(3) - (4)].treeNode);
        ((Var *)(yyval.treeNode))->setTypeAndStatic((yyvsp[(2) - (4)].tokenData)->tokenstr, true);
    ;}
    break;

  case 9:
#line 92 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(2) - (3)].treeNode);
        ((Var *)(yyval.treeNode))->setTypeAndStatic((yyvsp[(1) - (3)].tokenData)->tokenstr, false);
    ;}
    break;

  case 10:
#line 99 "parser.y"
    {
        (yyval.treeNode)->append((yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 11:
#line 103 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 12:
#line 108 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 13:
#line 112 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (3)].treeNode);
        (yyval.treeNode)->addChild((yyvsp[(3) - (3)].treeNode), 0);
    ;}
    break;

  case 14:
#line 119 "parser.y"
    {
        (yyval.treeNode) = new Var((yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 15:
#line 123 "parser.y"
    {
        (yyval.treeNode) = new Var((yyvsp[(1) - (4)].tokenData), (yyvsp[(3) - (4)].tokenData));
    ;}
    break;

  case 16:
#line 129 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 17:
#line 133 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 18:
#line 137 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 19:
#line 145 "parser.y"
    {
        (yyval.treeNode) = new FunDecl((yyvsp[(1) - (6)].tokenData), (yyvsp[(2) - (6)].tokenData), (yyvsp[(4) - (6)].treeNode), (yyvsp[(6) - (6)].treeNode));
    ;}
    break;

  case 20:
#line 149 "parser.y"
    {
        (yyval.treeNode) = new FunDecl((yyvsp[(1) - (5)].tokenData), (yyvsp[(3) - (5)].treeNode), (yyvsp[(5) - (5)].treeNode));
    ;}
    break;

  case 21:
#line 155 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 22:
#line 159 "parser.y"
    {
        (yyval.treeNode) = NULL;
    ;}
    break;

  case 23:
#line 165 "parser.y"
    {
        (yyval.treeNode)->append((yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 24:
#line 169 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 25:
#line 175 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(2) - (2)].treeNode);
        ((Parm *)(yyval.treeNode))->setType((yyvsp[(1) - (2)].tokenData)->tokenstr);
    ;}
    break;

  case 26:
#line 182 "parser.y"
    {
        (yyval.treeNode)->append((yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 27:
#line 186 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 28:
#line 192 "parser.y"
    {
        (yyval.treeNode) = new Parm((yyvsp[(1) - (1)].tokenData), false);
    ;}
    break;

  case 29:
#line 196 "parser.y"
    {
        (yyval.treeNode) = new Parm((yyvsp[(1) - (3)].tokenData), true);
    ;}
    break;

  case 30:
#line 204 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 31:
#line 208 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 32:
#line 212 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 33:
#line 216 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 34:
#line 220 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 35:
#line 224 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 36:
#line 230 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (2)].treeNode);
    ;}
    break;

  case 37:
#line 234 "parser.y"
    {
        (yyval.treeNode) = NULL;
    ;}
    break;

  case 38:
#line 240 "parser.y"
    {
        (yyval.treeNode) = new CompoundStatement((yylsp[(1) - (4)]).first_line, (yyvsp[(2) - (4)].treeNode), (yyvsp[(3) - (4)].treeNode));
    ;}
    break;

  case 39:
#line 246 "parser.y"
    {
        (yyval.treeNode)->append((yyvsp[(2) - (2)].treeNode));
    ;}
    break;

  case 40:
#line 250 "parser.y"
    {
        (yyval.treeNode) = new treeNode();
    ;}
    break;

  case 41:
#line 256 "parser.y"
    {
        (yyval.treeNode)->append((yyvsp[(2) - (2)].treeNode));
    ;}
    break;

  case 42:
#line 260 "parser.y"
    {
        (yyval.treeNode) = new treeNode();
    ;}
    break;

  case 43:
#line 266 "parser.y"
    {
        (yyval.treeNode) = new IFS((yylsp[(1) - (5)]).first_line, (yyvsp[(3) - (5)].treeNode), (yyvsp[(5) - (5)].treeNode));
        
    ;}
    break;

  case 44:
#line 271 "parser.y"
    {
        (yyval.treeNode) = new IFS((yylsp[(1) - (8)]).first_line, (yyvsp[(3) - (8)].treeNode), (yyvsp[(5) - (8)].tokenData), (yyvsp[(7) - (8)].tokenData));
    ;}
    break;

  case 45:
#line 277 "parser.y"
    {
        (yyval.treeNode) = new While((yylsp[(1) - (6)]).first_line, (yyvsp[(3) - (6)].treeNode), (yyvsp[(5) - (6)].tokenData));
    ;}
    break;

  case 46:
#line 281 "parser.y"
    {
        (yyval.treeNode) = new For((yylsp[(1) - (9)]).first_line, (yyvsp[(3) - (9)].tokenData), (yyvsp[(5) - (9)].tokenData), (yyvsp[(7) - (9)].treeNode));
    ;}
    break;

  case 47:
#line 287 "parser.y"
    {
        (yyval.treeNode) = new Iter((yylsp[(1) - (3)]).first_line, (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 48:
#line 291 "parser.y"
    {
        (yyval.treeNode) = new Iter((yylsp[(1) - (5)]).first_line, , (yyvsp[(1) - (5)].treeNode), (yyvsp[(3) - (5)].treeNode), (yyvsp[(5) - (5)].treeNode));
    ;}
    break;

  case 49:
#line 297 "parser.y"
    {
        (yyval.treeNode) = new Return((yylsp[(1) - (2)]).first_line);
    ;}
    break;

  case 50:
#line 301 "parser.y"
    {
        (yyval.treeNode) = new Return((yylsp[(1) - (3)]).first_line, (yyvsp[(2) - (3)].treeNode));
    ;}
    break;

  case 51:
#line 307 "parser.y"
    {
        (yyval.treeNode) = new Break((yylsp[(1) - (2)]).first_line);
    ;}
    break;

  case 52:
#line 315 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 53:
#line 319 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 54:
#line 323 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 55:
#line 327 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 56:
#line 331 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 57:
#line 335 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].treeNode));
    ;}
    break;

  case 58:
#line 339 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].treeNode));
    ;}
    break;

  case 59:
#line 343 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 60:
#line 349 "parser.y"
    {
        (yyval.treeNode) = new LogicExpression((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 61:
#line 353 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 62:
#line 359 "parser.y"
    {
        (yyval.treeNode) = new LogicExpression((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 63:
#line 363 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 64:
#line 369 "parser.y"
    {
        (yyval.treeNode) = new LogicExpression((yyvsp[(1) - (2)].tokenData), (yyvsp[(2) - (2)].treeNode));
    ;}
    break;

  case 65:
#line 373 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 66:
#line 379 "parser.y"
    {
        (yyval.treeNode) = new Relation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 67:
#line 383 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode)
    ;}
    break;

  case 68:
#line 389 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 69:
#line 393 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 70:
#line 397 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 71:
#line 401 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 72:
#line 405 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 73:
#line 409 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 74:
#line 415 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].treeNode), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 75:
#line 419 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 76:
#line 425 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 77:
#line 429 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 78:
#line 435 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 79:
#line 439 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 80:
#line 444 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 81:
#line 448 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 82:
#line 454 "parser.y"
    {
        (yyval.treeNode) = new Operation((yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].treeNode), (yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 83:
#line 458 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 84:
#line 464 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 85:
#line 468 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 86:
#line 472 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 87:
#line 478 "parser.y"
    {
        (yyval.treeNode) = Operation((yyvsp[(1) - (2)].tokenData), (yyvsp[(2) - (2)].treeNode));
    ;}
    break;

  case 88:
#line 482 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 89:
#line 487 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 90:
#line 491 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 91:
#line 495 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 92:
#line 501 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 93:
#line 505 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 94:
#line 511 "parser.y"
    {
        (yyval.treeNode) = VarAccess((yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 95:
#line 515 "parser.y"
    {
        (yyval.treeNode) = VarAccess((yylsp[(2) - (4)]).first_line, (yyvsp[(1) - (4)].treeNode), (yyvsp[(3) - (4)].treeNode));
    ;}
    break;

  case 96:
#line 521 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(2) - (3)].treeNode);
    ;}
    break;

  case 97:
#line 525 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 98:
#line 529 "parser.y"
    {
        (yyval.treeNode) = Constant((yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 99:
#line 535 "parser.y"
    {
        (yyval.treeNode) = new Call((yyvsp[(1) - (4)].tokenData), (yyvsp[(3) - (4)].treeNode));
    ;}
    break;

  case 100:
#line 541 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 101:
#line 545 "parser.y"
    {
        (yyval.treeNode) = NULL;
    ;}
    break;

  case 102:
#line 551 "parser.y"
    {
        (yyval.treeNode) = append((yyvsp[(3) - (3)].treeNode));
    ;}
    break;

  case 103:
#line 555 "parser.y"
    {
        (yyval.treeNode) = (yyvsp[(1) - (1)].treeNode);
    ;}
    break;

  case 104:
#line 561 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 105:
#line 565 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 106:
#line 569 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;

  case 107:
#line 573 "parser.y"
    {
        (yyval.tokenData) = (yyvsp[(1) - (1)].tokenData);
    ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2402 "parser.tab.c"
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


#line 578 "parser.y"



int main(int argc, char *argv[])
{
    tree = new treeNode();
    tree -> index = -1;
    
    int debugger = 0, printTree = 0;
    int c;
    
    while((c = Operation(argc, argv, (char *)"dp")) != -1)
    {
        switch(c)
        {
            case 'd':
                debugger = 1;
                break;
            case 'p':
                printTree = 1;
                break;
            case '?':
                fprintf(stderr, "usage: c- [-d] [-p] file\n");
                return -1;
        }
    }
    
    if(debugger)
    {
        yydebug = 1;
    }
    
    if(optionid < argc)
    {
        yyin = fopen(argv[optionid], "r");
        yyparse();
        fclose(yyin);
    }
    else
    {
        yyparse();
    }
    
    tree->getData();
    
    if(printTree)
    {
        tree->printTree();
    }
    
    return 0;
        
}

