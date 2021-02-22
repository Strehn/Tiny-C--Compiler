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




/* Copy the first part of user declarations.  */
#line 1 "parser.y"


    
#include <string.h>
#include <string>
#include <iostream>


#include "ourgetopt.h"
#include "scanType.h"
#include "TreeUtils.hpp"
#include "parser.tab.h"


extern int yylex();
extern FILE *yyin;
extern int yydebug;
extern int line;

void yyerror(const char *msg) {
    printf("Error(%d) while parsing: %s\n", line, msg);
}

//
// DATA
//
// ----- Global Tree -----
static TreeNode *syntaxTree;



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
#line 34 "parser.y"
{
    ExpType type;            // for passing types.  typespec to pass up a type in decl like int or bool
    TokenData *tokenData;    // for terminals.  token data comes from yylex() in the $ variables
    TreeNode *tree;          // for nonterminals.   these tree nodes as you build the tree
}
/* Line 193 of yacc.c.  */
#line 247 "parser.tab.c"
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
#line 272 "parser.tab.c"

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
#define YYLAST   206

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  58
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  51
/* YYNRULES -- Number of rules.  */
#define YYNRULES  114
/* YYNRULES -- Number of states.  */
#define YYNSTATES  179

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
       0,     0,     3,     5,     8,    10,    12,    14,    18,    23,
      27,    31,    33,    35,    39,    41,    46,    48,    50,    52,
      59,    65,    67,    68,    72,    74,    77,    81,    83,    85,
      89,    91,    93,    95,    97,    99,   101,   103,   105,   107,
     109,   112,   114,   119,   122,   123,   126,   127,   134,   139,
     146,   151,   158,   163,   170,   174,   180,   183,   187,   190,
     194,   198,   202,   206,   210,   213,   216,   218,   222,   224,
     228,   230,   233,   235,   239,   241,   243,   245,   247,   249,
     251,   253,   257,   259,   261,   263,   267,   269,   271,   273,
     277,   279,   281,   283,   285,   288,   290,   292,   294,   296,
     298,   300,   302,   307,   311,   313,   315,   320,   322,   323,
     327,   329,   331,   333,   335
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      59,     0,    -1,    60,    -1,    60,    61,    -1,    61,    -1,
      62,    -1,    68,    -1,    67,    64,    49,    -1,    12,    67,
      64,    49,    -1,    67,    64,    49,    -1,    64,    55,    65,
      -1,    65,    -1,    66,    -1,    66,    50,    89,    -1,     7,
      -1,     7,    53,     4,    54,    -1,    13,    -1,    14,    -1,
      15,    -1,    67,     7,    51,    69,    52,    74,    -1,     7,
      51,    69,    52,    74,    -1,    70,    -1,    -1,    70,    49,
      71,    -1,    71,    -1,    67,    72,    -1,    72,    55,    73,
      -1,    73,    -1,     7,    -1,     7,    53,    54,    -1,    75,
      -1,    76,    -1,    77,    -1,    78,    -1,    86,    -1,    87,
      -1,    81,    -1,    83,    -1,    82,    -1,    84,    -1,    88,
      49,    -1,    49,    -1,    56,    79,    80,    57,    -1,    79,
      63,    -1,    -1,    80,    74,    -1,    -1,     9,    89,     8,
      75,    16,    75,    -1,     9,    89,     8,    74,    -1,     9,
      89,     8,    75,    16,    76,    -1,    10,    89,    36,    75,
      -1,    11,     7,    48,    85,    36,    75,    -1,    10,    89,
      36,    76,    -1,    11,     7,    48,    85,    36,    76,    -1,
      89,    38,    89,    -1,    89,    38,    89,    37,    89,    -1,
      17,    49,    -1,    17,    88,    49,    -1,    18,    49,    -1,
     103,    48,    88,    -1,   103,    21,    88,    -1,   103,    22,
      88,    -1,   103,    24,    88,    -1,   103,    23,    88,    -1,
     103,    29,    -1,   103,    28,    -1,    89,    -1,    89,    46,
      90,    -1,    90,    -1,    90,    45,    91,    -1,    91,    -1,
      47,    91,    -1,    92,    -1,    94,    93,    94,    -1,    94,
      -1,    25,    -1,    30,    -1,    31,    -1,    26,    -1,    20,
      -1,    27,    -1,    94,    95,    96,    -1,    96,    -1,    32,
      -1,    33,    -1,    96,    97,    98,    -1,    98,    -1,    34,
      -1,    41,    -1,    98,    99,   100,    -1,   100,    -1,    42,
      -1,    35,    -1,    39,    -1,   101,   100,    -1,   102,    -1,
      41,    -1,    42,    -1,    40,    -1,   104,    -1,   103,    -1,
       7,    -1,     7,    53,    88,    54,    -1,    51,    88,    52,
      -1,   105,    -1,   108,    -1,     7,    51,   106,    52,    -1,
     107,    -1,    -1,   107,    55,    88,    -1,    88,    -1,     4,
      -1,     5,    -1,     6,    -1,     3,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    60,    60,    66,    70,    76,    80,    88,    95,   100,
     107,   111,   116,   120,   127,   132,   141,   145,   149,   157,
     163,   170,   175,   180,   184,   190,   197,   201,   207,   212,
     222,   226,   232,   236,   240,   244,   248,   252,   258,   262,
     268,   272,   278,   284,   289,   294,   299,   304,   311,   316,
     322,   326,   333,   337,   344,   349,   356,   360,   366,   374,
     378,   382,   386,   390,   394,   398,   402,   408,   412,   418,
     422,   428,   432,   438,   444,   450,   454,   458,   462,   466,
     470,   476,   482,   488,   492,   498,   504,   509,   513,   519,
     525,   531,   535,   539,   545,   550,   555,   560,   565,   571,
     575,   581,   586,   593,   597,   601,   607,   614,   619,   624,
     629,   635,   641,   647,   653
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "BOOLCONST", "NUMCONST", "CHARCONST",
  "STRINGCONST", "ID", "THEN", "IF", "WHILE", "FOR", "STATIC", "INT",
  "BOOL", "CHAR", "ELSE", "RETURN", "BREAK", "COMMENT", "EQ", "ADDASS",
  "SUBASS", "DIVASS", "MULASS", "LEQ", "GEQ", "NEQ", "DEC", "INC", "LT",
  "GT", "MAX", "MIN", "ADD", "DIV", "DO", "BY", "TO", "MOD", "RAND", "SUB",
  "MUL", "CHSIGN", "SIZEOF", "AND", "OR", "NOT", "ASS", "SEMICOLON",
  "COLON", "LP", "RP", "LB", "RB", "COMMA", "LCB", "RCB", "$accept",
  "program", "declList", "decl", "varDecl", "scopedVarDecl", "varDeclList",
  "varDeclInit", "varDeclId", "typeSpec", "funDecl", "parms", "parmList",
  "parmTypeList", "parmIdList", "parmId", "stmt", "matched", "unmatched",
  "expStmt", "compoundStmt", "localDecls", "stmtList", "matchedselectStmt",
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
       0,    58,    59,    60,    60,    61,    61,    62,    63,    63,
      64,    64,    65,    65,    66,    66,    67,    67,    67,    68,
      68,    69,    69,    70,    70,    71,    72,    72,    73,    73,
      74,    74,    75,    75,    75,    75,    75,    75,    76,    76,
      77,    77,    78,    79,    79,    80,    80,    81,    82,    82,
      83,    83,    84,    84,    85,    85,    86,    86,    87,    88,
      88,    88,    88,    88,    88,    88,    88,    89,    89,    90,
      90,    91,    91,    92,    92,    93,    93,    93,    93,    93,
      93,    94,    94,    95,    95,    96,    96,    97,    97,    98,
      98,    99,    99,    99,   100,   100,   101,   101,   101,   102,
     102,   103,   103,   104,   104,   104,   105,   106,   106,   107,
     107,   108,   108,   108,   108
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     3,     4,     3,
       3,     1,     1,     3,     1,     4,     1,     1,     1,     6,
       5,     1,     0,     3,     1,     2,     3,     1,     1,     3,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       2,     1,     4,     2,     0,     2,     0,     6,     4,     6,
       4,     6,     4,     6,     3,     5,     2,     3,     2,     3,
       3,     3,     3,     3,     2,     2,     1,     3,     1,     3,
       1,     2,     1,     3,     1,     1,     1,     1,     1,     1,
       1,     3,     1,     1,     1,     3,     1,     1,     1,     3,
       1,     1,     1,     1,     2,     1,     1,     1,     1,     1,
       1,     1,     4,     3,     1,     1,     4,     1,     0,     3,
       1,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,    16,    17,    18,     0,     2,     4,     5,     0,
       6,    22,     1,     3,    14,     0,    11,    12,     0,     0,
      21,    24,    22,     0,     7,     0,     0,    28,    25,    27,
       0,     0,     0,     0,    14,    10,   114,   111,   112,   113,
     101,    98,    96,    97,     0,     0,    13,    68,    70,    72,
      74,    82,    86,    90,     0,    95,   100,    99,   104,   105,
       0,     0,     0,     0,     0,     0,     0,    41,    44,    20,
      30,    31,    32,    33,    36,    38,    37,    39,    34,    35,
       0,    66,   100,    23,     0,    15,   108,     0,    71,     0,
       0,     0,    79,    75,    78,    80,    76,    77,    83,    84,
       0,     0,    87,    88,     0,    92,    93,    91,     0,    94,
      29,    26,     0,     0,     0,    56,     0,    58,    46,    40,
       0,     0,     0,     0,    65,    64,     0,    19,   110,     0,
     107,     0,   103,    67,    69,    73,    81,    85,    89,     0,
       0,     0,    57,     0,    43,     0,     0,    60,    61,    63,
      62,    59,   106,     0,   102,    48,    30,    50,    52,     0,
       0,     0,     0,    42,    45,   109,     0,     0,     0,     0,
       9,    47,    49,    51,    53,    54,     8,     0,    55
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     5,     6,     7,     8,   144,    15,    16,    17,    18,
      10,    19,    20,    21,    28,    29,    69,    70,    71,    72,
      73,   118,   146,    74,    75,    76,    77,   159,    78,    79,
      80,    81,    47,    48,    49,   100,    50,   101,    51,   104,
      52,   108,    53,    54,    55,    82,    57,    58,   129,   130,
      59
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -121
static const yytype_int16 yypact[] =
{
     143,    -7,  -121,  -121,  -121,    72,   143,  -121,  -121,    69,
    -121,    27,  -121,  -121,    87,    35,  -121,    39,    70,    41,
      64,  -121,    27,   112,  -121,   113,    20,    66,    80,  -121,
     119,    27,    75,    98,   101,  -121,  -121,  -121,  -121,  -121,
      94,  -121,  -121,  -121,    20,    20,   109,   124,  -121,  -121,
     147,    32,   146,  -121,    28,  -121,  -121,  -121,  -121,  -121,
     117,    70,    20,    20,   169,     8,   133,  -121,  -121,  -121,
    -121,  -121,  -121,  -121,  -121,  -121,  -121,  -121,  -121,  -121,
     134,   109,    83,  -121,   119,  -121,    20,    20,  -121,   132,
      20,    20,  -121,  -121,  -121,  -121,  -121,  -121,  -121,  -121,
      28,    28,  -121,  -121,    28,  -121,  -121,  -121,    28,  -121,
    -121,  -121,    -3,   -29,   138,  -121,   140,  -121,   150,  -121,
      20,    20,    20,    20,  -121,  -121,    20,  -121,  -121,   135,
     136,   139,  -121,   124,  -121,   -11,    32,   146,  -121,   119,
     119,    20,  -121,    27,  -121,   113,    92,  -121,  -121,  -121,
    -121,  -121,  -121,    20,  -121,  -121,   174,  -121,  -121,   156,
     -30,   113,    45,  -121,  -121,  -121,   119,   119,    20,    59,
    -121,  -121,  -121,  -121,  -121,    46,  -121,    20,   109
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -121,  -121,  -121,   188,  -121,  -121,  -116,   170,  -121,     3,
    -121,   175,  -121,   165,  -121,   137,   -83,  -120,   -86,  -121,
    -121,  -121,  -121,  -121,  -121,  -121,  -121,  -121,  -121,  -121,
     -35,   -24,   110,   -38,  -121,  -121,    99,  -121,   100,  -121,
     102,  -121,   -50,  -121,  -121,   -26,  -121,  -121,  -121,  -121,
    -121
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
      56,   127,    46,     9,   109,   139,    88,   140,   168,     9,
      89,    36,    37,    38,    39,    40,    90,    90,    56,   156,
     157,    98,    99,    36,    37,    38,    39,    40,    56,   162,
     116,    36,    37,    38,    39,    40,    56,    56,   112,   113,
       2,     3,     4,    90,    11,   169,   171,   173,    41,    42,
      43,   128,   131,   134,   158,    44,   155,   115,   138,    45,
      41,    42,    43,   164,    56,    56,   102,    44,    41,    42,
      43,    45,    12,   103,    56,    56,    14,    27,    56,    45,
     172,   174,    56,   177,    24,   147,   148,   149,   150,    26,
      25,   151,    90,    30,   170,    36,    37,    38,    39,    40,
      25,    62,    63,    64,   120,   121,   122,   123,   176,    65,
      66,   124,   125,    31,    25,    56,    33,   160,   165,    60,
      34,   145,    36,    37,    38,    39,    40,    84,    62,    63,
      64,   126,    41,    42,    43,    61,    65,    66,    22,    44,
      23,    67,    56,    45,   175,    86,   161,    87,    68,   163,
       1,    56,    85,   178,    23,    90,     2,     3,     4,    41,
      42,    43,   143,     2,     3,     4,    44,    92,    67,    91,
      45,   110,    93,    94,    95,    68,   114,    96,    97,    98,
      99,   105,   117,   119,   132,   106,   141,   152,   107,   142,
     166,   153,   167,   154,    13,    35,    83,    32,   111,   135,
     133,   136,     0,     0,     0,     0,   137
};

static const yytype_int16 yycheck[] =
{
      26,    84,    26,     0,    54,     8,    44,    36,    38,     6,
      45,     3,     4,     5,     6,     7,    46,    46,    44,   139,
     140,    32,    33,     3,     4,     5,     6,     7,    54,   145,
      65,     3,     4,     5,     6,     7,    62,    63,    62,    63,
      13,    14,    15,    46,    51,   161,   166,   167,    40,    41,
      42,    86,    87,    91,   140,    47,   139,    49,   108,    51,
      40,    41,    42,   146,    90,    91,    34,    47,    40,    41,
      42,    51,     0,    41,   100,   101,     7,     7,   104,    51,
     166,   167,   108,    37,    49,   120,   121,   122,   123,    50,
      55,   126,    46,    52,    49,     3,     4,     5,     6,     7,
      55,     9,    10,    11,    21,    22,    23,    24,    49,    17,
      18,    28,    29,    49,    55,   141,     4,   141,   153,    53,
       7,   118,     3,     4,     5,     6,     7,    52,     9,    10,
      11,    48,    40,    41,    42,    55,    17,    18,    51,    47,
      53,    49,   168,    51,   168,    51,   143,    53,    56,    57,
       7,   177,    54,   177,    53,    46,    13,    14,    15,    40,
      41,    42,    12,    13,    14,    15,    47,    20,    49,    45,
      51,    54,    25,    26,    27,    56,     7,    30,    31,    32,
      33,    35,    49,    49,    52,    39,    48,    52,    42,    49,
      16,    55,    36,    54,     6,    25,    31,    22,    61,   100,
      90,   101,    -1,    -1,    -1,    -1,   104
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     7,    13,    14,    15,    59,    60,    61,    62,    67,
      68,    51,     0,    61,     7,    64,    65,    66,    67,    69,
      70,    71,    51,    53,    49,    55,    50,     7,    72,    73,
      52,    49,    69,     4,     7,    65,     3,     4,     5,     6,
       7,    40,    41,    42,    47,    51,    89,    90,    91,    92,
      94,    96,    98,   100,   101,   102,   103,   104,   105,   108,
      53,    55,     9,    10,    11,    17,    18,    49,    56,    74,
      75,    76,    77,    78,    81,    82,    83,    84,    86,    87,
      88,    89,   103,    71,    52,    54,    51,    53,    91,    88,
      46,    45,    20,    25,    26,    27,    30,    31,    32,    33,
      93,    95,    34,    41,    97,    35,    39,    42,    99,   100,
      54,    73,    89,    89,     7,    49,    88,    49,    79,    49,
      21,    22,    23,    24,    28,    29,    48,    74,    88,   106,
     107,    88,    52,    90,    91,    94,    96,    98,   100,     8,
      36,    48,    49,    12,    63,    67,    80,    88,    88,    88,
      88,    88,    52,    55,    54,    74,    75,    75,    76,    85,
      89,    67,    64,    57,    74,    88,    16,    36,    38,    64,
      49,    75,    76,    75,    76,    89,    49,    37,    89
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
#line 61 "parser.y"
    {
        syntaxTree = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 3:
#line 67 "parser.y"
    {
        (yyval.tree) = addSibling((yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree));
    ;}
    break;

  case 4:
#line 71 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 5:
#line 77 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 6:
#line 81 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 7:
#line 89 "parser.y"
    {
        (yyval.tree) = (yyvsp[(2) - (3)].tree);
        setType((yyvsp[(2) - (3)].tree), (yyvsp[(1) - (3)].type), false);
    ;}
    break;

  case 8:
#line 96 "parser.y"
    {
        (yyval.tree) = (yyvsp[(3) - (4)].tree);
        setType((yyvsp[(3) - (4)].tree), (yyvsp[(2) - (4)].type), true);
    ;}
    break;

  case 9:
#line 101 "parser.y"
    {
        (yyval.tree) = (yyvsp[(2) - (3)].tree);
        setType((yyvsp[(2) - (3)].tree), (yyvsp[(1) - (3)].type), false);
    ;}
    break;

  case 10:
#line 108 "parser.y"
    {
        (yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 11:
#line 112 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 12:
#line 117 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 13:
#line 121 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (3)].tree);
        addChild((yyval.tree), (yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 14:
#line 128 "parser.y"
    {
        (yyval.tree) = newDeclNode(VarK, UndefinedType, (yyvsp[(1) - (1)].tokenData));
        (yyval.tree)->tmp = (yyvsp[(1) - (1)].tokenData)->idIndex;
    ;}
    break;

  case 15:
#line 133 "parser.y"
    {
        (yyval.tree) = newDeclNode(VarK, UndefinedType, (yyvsp[(1) - (4)].tokenData));
        (yyval.tree)->isArray = true;
        (yyval.tree)->aSize = (yyvsp[(3) - (4)].tokenData)->nvalue;
        (yyval.tree)->tmp = (yyvsp[(1) - (4)].tokenData)->idIndex;
    ;}
    break;

  case 16:
#line 142 "parser.y"
    {
        (yyval.type) = Integer;
    ;}
    break;

  case 17:
#line 146 "parser.y"
    {
        (yyval.type) = Boolean;
    ;}
    break;

  case 18:
#line 150 "parser.y"
    {
        (yyval.type) = Char;
    ;}
    break;

  case 19:
#line 158 "parser.y"
    {
        (yyval.tree) = newDeclNode(FuncK, (yyvsp[(1) - (6)].type), (yyvsp[(2) - (6)].tokenData), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree));
        (yyval.tree)->tmp = (yyvsp[(2) - (6)].tokenData)->idIndex;
        setType((yyval.tree), (yyvsp[(1) - (6)].type), true);
    ;}
    break;

  case 20:
#line 164 "parser.y"
    {
        (yyval.tree) = newDeclNode(FuncK, Void, (yyvsp[(1) - (5)].tokenData), (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree));
        (yyval.tree)->tmp = (yyvsp[(1) - (5)].tokenData)->idIndex;
    ;}
    break;

  case 21:
#line 171 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 22:
#line 175 "parser.y"
    {
        (yyval.tree) = NULL;
    ;}
    break;

  case 23:
#line 181 "parser.y"
    {
        (yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 24:
#line 185 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 25:
#line 191 "parser.y"
    {
        (yyval.tree) = (yyvsp[(2) - (2)].tree);
        setType((yyvsp[(2) - (2)].tree), (yyvsp[(1) - (2)].type), false);
    ;}
    break;

  case 26:
#line 198 "parser.y"
    {
        (yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 27:
#line 202 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 28:
#line 208 "parser.y"
    {
        (yyval.tree) = newDeclNode(ParamK, Void, (yyvsp[(1) - (1)].tokenData));
        (yyval.tree)->tmp = (yyvsp[(1) - (1)].tokenData)->svalue;
    ;}
    break;

  case 29:
#line 213 "parser.y"
    {
        (yyval.tree) = newDeclNode(ParamK, Void, (yyvsp[(1) - (3)].tokenData));
        (yyval.tree)->isArray = true;
        (yyval.tree)->tmp = (yyvsp[(1) - (3)].tokenData)->svalue;
    ;}
    break;

  case 30:
#line 223 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 31:
#line 227 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 32:
#line 233 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 33:
#line 237 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 34:
#line 241 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 35:
#line 245 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 36:
#line 249 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 37:
#line 253 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 38:
#line 259 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 39:
#line 263 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 40:
#line 269 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (2)].tree);
    ;}
    break;

  case 41:
#line 273 "parser.y"
    {
        (yyval.tree) = NULL;
    ;}
    break;

  case 42:
#line 279 "parser.y"
    {
        (yyval.tree) = newStmtNode(CompoundK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(3) - (4)].tree));
    ;}
    break;

  case 43:
#line 285 "parser.y"
    {
        (yyval.tree) = addSibling((yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree));
    ;}
    break;

  case 44:
#line 289 "parser.y"
    {
        (yyval.tree) = NULL;
    ;}
    break;

  case 45:
#line 295 "parser.y"
    {
        (yyval.tree) = addSibling((yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree));
    ;}
    break;

  case 46:
#line 299 "parser.y"
    {
        (yyval.tree) = NULL;
    ;}
    break;

  case 47:
#line 305 "parser.y"
    {
        (yyval.tree) = newStmtNode(IfK, (yyvsp[(1) - (6)].tokenData), (yyvsp[(2) - (6)].tree), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree));
        
    ;}
    break;

  case 48:
#line 312 "parser.y"
    {
        (yyval.tree) = newStmtNode(IfK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree));
    
    ;}
    break;

  case 49:
#line 317 "parser.y"
    {
        (yyval.tree) = newStmtNode(IfK, (yyvsp[(1) - (6)].tokenData), (yyvsp[(2) - (6)].tree), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree));
    ;}
    break;

  case 50:
#line 323 "parser.y"
    {
        (yyval.tree) = newStmtNode(WhileK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree));
    ;}
    break;

  case 51:
#line 327 "parser.y"
    {
        (yyval.tree) = newStmtNode(ForK, (yyvsp[(1) - (6)].tokenData), newDeclNode(VarK, Integer, (yyvsp[(2) - (6)].tokenData)), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree));
        (yyval.tree)->tmp = (yyvsp[(2) - (6)].tokenData)->idIndex;
    ;}
    break;

  case 52:
#line 334 "parser.y"
    {
        (yyval.tree) = newStmtNode(WhileK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree));
    ;}
    break;

  case 53:
#line 338 "parser.y"
    {
        (yyval.tree) = newStmtNode(ForK, (yyvsp[(1) - (6)].tokenData), newDeclNode(VarK, Integer, (yyvsp[(2) - (6)].tokenData)), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree));
        (yyval.tree)->tmp = (yyvsp[(2) - (6)].tokenData)->idIndex;
    ;}
    break;

  case 54:
#line 345 "parser.y"
    {
        (yyval.tree) = newStmtNode(RangeK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 55:
#line 350 "parser.y"
    {
        (yyval.tree) = newStmtNode(RangeK, (yyvsp[(2) - (5)].tokenData), (yyvsp[(1) - (5)].tree), (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree));
        (yyval.tree)->tmp = (yyvsp[(2) - (5)].tokenData)->idIndex;
    ;}
    break;

  case 56:
#line 357 "parser.y"
    {
        (yyval.tree) = newStmtNode(ReturnK, (yyvsp[(1) - (2)].tokenData));
    ;}
    break;

  case 57:
#line 361 "parser.y"
    {
        (yyval.tree) = newStmtNode(ReturnK, (yyvsp[(1) - (3)].tokenData), (yyvsp[(2) - (3)].tree));
    ;}
    break;

  case 58:
#line 367 "parser.y"
    {
        (yyval.tree) = newStmtNode(BreakK, (yyvsp[(1) - (2)].tokenData));
    ;}
    break;

  case 59:
#line 375 "parser.y"
    {
        (yyval.tree) = newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 60:
#line 379 "parser.y"
    {
        (yyval.tree) = newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 61:
#line 383 "parser.y"
    {
        (yyval.tree) = newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 62:
#line 387 "parser.y"
    {
        (yyval.tree) = newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 63:
#line 391 "parser.y"
    {
        (yyval.tree) = newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 64:
#line 395 "parser.y"
    {
        (yyval.tree) = newExpNode(AssignK, (yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].tree));
    ;}
    break;

  case 65:
#line 399 "parser.y"
    {
        (yyval.tree) = newExpNode(AssignK, (yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].tree));
    ;}
    break;

  case 66:
#line 403 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 67:
#line 409 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 68:
#line 413 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 69:
#line 419 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 70:
#line 423 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 71:
#line 429 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (2)].tokenData), (yyvsp[(2) - (2)].tree));
    ;}
    break;

  case 72:
#line 433 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 73:
#line 439 "parser.y"
    {
        (yyval.tree) = (yyvsp[(2) - (3)].tree);
        addChild((yyval.tree), (yyvsp[(1) - (3)].tree));
        addChild((yyval.tree), (yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 74:
#line 445 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 75:
#line 451 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 76:
#line 455 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 77:
#line 459 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 78:
#line 463 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 79:
#line 467 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 80:
#line 471 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 81:
#line 477 "parser.y"
    {
        (yyval.tree) = (yyvsp[(2) - (3)].tree);
        addChild((yyval.tree),(yyvsp[(1) - (3)].tree));
        addChild((yyval.tree),(yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 82:
#line 483 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 83:
#line 489 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 84:
#line 493 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 85:
#line 499 "parser.y"
    {
        (yyval.tree) = (yyvsp[(2) - (3)].tree);
        addChild((yyval.tree),(yyvsp[(1) - (3)].tree));
        addChild((yyval.tree),(yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 86:
#line 505 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 87:
#line 510 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 88:
#line 514 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 89:
#line 520 "parser.y"
    {
        (yyval.tree) = (yyvsp[(2) - (3)].tree);
        addChild((yyval.tree), (yyvsp[(1) - (3)].tree));
        addChild((yyval.tree), (yyvsp[(3) - (3)].tree));
    ;}
    break;

  case 90:
#line 526 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 91:
#line 532 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 92:
#line 536 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 93:
#line 540 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 94:
#line 546 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (2)].tree);
        addChild((yyval.tree), (yyvsp[(2) - (2)].tree));
    ;}
    break;

  case 95:
#line 551 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 96:
#line 556 "parser.y"
    {
        (yyvsp[(1) - (1)].tokenData)->tokenclass=CHSIGN;
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 97:
#line 561 "parser.y"
    {
        (yyvsp[(1) - (1)].tokenData)->tokenclass=SIZEOF;
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 98:
#line 566 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(1) - (1)].tokenData));
    ;}
    break;

  case 99:
#line 572 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 100:
#line 576 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 101:
#line 582 "parser.y"
    {
        (yyval.tree) = newExpNode(IdK, (yyvsp[(1) - (1)].tokenData));
        (yyval.tree)->name = (yyvsp[(1) - (1)].tokenData)->idIndex;
    ;}
    break;

  case 102:
#line 587 "parser.y"
    {
        (yyval.tree) = newExpNode(OpK, (yyvsp[(2) - (4)].tokenData), newExpNode(IdK, (yyvsp[(1) - (4)].tokenData)), (yyvsp[(3) - (4)].tree));
        (yyval.tree)->child[0]->name = (yyvsp[(1) - (4)].tokenData)->idIndex;
    ;}
    break;

  case 103:
#line 594 "parser.y"
    {
        (yyval.tree) = (yyvsp[(2) - (3)].tree);
    ;}
    break;

  case 104:
#line 598 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 105:
#line 602 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 106:
#line 608 "parser.y"
    {
        (yyval.tree) = newExpNode(CallK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(3) - (4)].tree));
        (yyval.tree)->name = (yyvsp[(1) - (4)].tokenData)->idIndex;
    ;}
    break;

  case 107:
#line 615 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 108:
#line 619 "parser.y"
    {
        (yyval.tree) = NULL;
    ;}
    break;

  case 109:
#line 625 "parser.y"
    {
        (yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));
        (yyval.tree)->name = (yyvsp[(2) - (3)].tokenData)->svalue;
    ;}
    break;

  case 110:
#line 630 "parser.y"
    {
        (yyval.tree) = (yyvsp[(1) - (1)].tree);
    ;}
    break;

  case 111:
#line 636 "parser.y"
    {
        (yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));
        (yyval.tree)->expType = Integer;
        (yyval.tree)->value = (yyvsp[(1) - (1)].tokenData)->nvalue;
    ;}
    break;

  case 112:
#line 642 "parser.y"
    {
        (yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));
        (yyval.tree)->expType = Char;
        (yyval.tree)->cvalue = (yyvsp[(1) - (1)].tokenData)->cvalue;
    ;}
    break;

  case 113:
#line 648 "parser.y"
    {
        (yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));
        (yyval.tree)->expType = String;
        (yyval.tree)->string = (yyvsp[(1) - (1)].tokenData)->svalue;
    ;}
    break;

  case 114:
#line 654 "parser.y"
    {
        (yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));
        (yyval.tree)->expType = Boolean;
        (yyval.tree)->value = (yyvsp[(1) - (1)].tokenData)->nvalue;
    ;}
    break;


/* Line 1267 of yacc.c.  */
#line 2512 "parser.tab.c"
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


#line 661 "parser.y"


//
// Utility
//
TreeNode * parse(void)
{
    yyparse();
    return syntaxTree;
}

int main(int argc, char *argv[])
{
    // expected format -c [option] [filename]
    //               arg0    arg1    arg2
    // in case no filename listed
    
    // ----- VARIABLES -----
    extern int   opterr;
    extern int   optind;
    extern char *optarg;
    int c, dset = 0,  pset = 0;
    
    if(argc < 3)
    {
        return -1;
    }
    
    while((c = ourGetopt(argc, argv, (char *)"dp?")) != EOF)
    {
        switch(c)
        {
            case 'd':
                dset = 1;
                break;
            case 'p':
                pset = 1;
                break;
            case '?':
                fprintf(stderr, "usage: c- [-d] [-p] file\n");
                return -1;
        }
    }
    
    if(dset == 1)
    {
        yydebug = 1;
    }
    
    if(optind < argc)
    {
        if ((yyin = fopen(argv[optind], "r")))
        {
            // file open successful
        }
        else
        {
            // failed to open file
            printf("ERROR: failed to open '%s'\n", argv[1]);
            exit(1);
        }
        yyparse();
        fclose(yyin);
    }
    else
    {
        syntaxTree = parse();
    }
    
    if(pset == 1)
    {
        printTree(syntaxTree);
    }
    
    return 0;
}

