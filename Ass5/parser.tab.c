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
#include "Semantic.hpp"
#include "yyerror.hpp"


extern int yylex();
extern FILE *yyin;
extern int yydebug;
extern int line;

void yyerror(const char *);

//
// DATA
//
// ----- Global Tree -----
static TreeNode *syntaxTree;

bool checkInitialization = true;



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
#line 36 "parser.y"
{
    ExpType type;            // for passing types.  typespec to pass up a type in decl like int or bool
    TokenData *tokenData;    // for terminals.  token data comes from yylex() in the $ variables
    TreeNode *tree;          // for nonterminals.   these tree nodes as you build the tree
}
/* Line 193 of yacc.c.  */
#line 249 "parser.tab.c"
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
#line 274 "parser.tab.c"

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
#define YYFINAL  18
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   840

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  58
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  52
/* YYNRULES -- Number of rules.  */
#define YYNRULES  172
/* YYNRULES -- Number of states.  */
#define YYNSTATES  282

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
       0,     0,     3,     5,     8,    10,    12,    14,    16,    20,
      24,    28,    33,    37,    41,    45,    47,    49,    53,    55,
      59,    63,    67,    69,    74,    78,    81,    83,    85,    87,
      94,   100,   103,   108,   115,   119,   125,   127,   128,   132,
     134,   138,   140,   143,   146,   150,   152,   156,   158,   160,
     164,   167,   169,   171,   173,   175,   177,   179,   181,   183,
     185,   187,   190,   192,   195,   200,   205,   210,   214,   218,
     221,   224,   227,   228,   231,   232,   239,   242,   247,   254,
     259,   266,   269,   274,   281,   286,   293,   298,   301,   308,
     311,   316,   323,   330,   333,   337,   343,   346,   350,   354,
     357,   361,   365,   369,   373,   377,   380,   383,   387,   391,
     395,   399,   403,   406,   409,   411,   415,   417,   421,   425,
     427,   431,   434,   436,   439,   443,   445,   447,   449,   451,
     453,   455,   457,   461,   463,   467,   469,   471,   475,   477,
     481,   483,   485,   489,   491,   495,   497,   499,   501,   504,
     506,   509,   511,   513,   515,   517,   519,   521,   526,   530,
     532,   534,   537,   540,   545,   547,   548,   552,   554,   558,
     560,   562,   564
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      59,     0,    -1,    60,    -1,    60,    61,    -1,    61,    -1,
      62,    -1,    68,    -1,     1,    -1,    67,    64,    49,    -1,
       1,    64,    49,    -1,    67,     1,    49,    -1,    12,    67,
      64,    49,    -1,    67,    64,    49,    -1,     1,    64,    49,
      -1,    64,    55,    65,    -1,    65,    -1,     1,    -1,    64,
      55,     1,    -1,    66,    -1,    66,    50,    90,    -1,     1,
      50,    90,    -1,    66,    50,     1,    -1,     7,    -1,     7,
      53,     4,    54,    -1,     7,    53,     1,    -1,     1,    54,
      -1,    13,    -1,    14,    -1,    15,    -1,    67,     7,    51,
      69,    52,    74,    -1,     7,    51,    69,    52,    74,    -1,
      67,     1,    -1,    67,     7,    51,     1,    -1,    67,     7,
      51,    69,    52,     1,    -1,     7,    51,     1,    -1,     7,
      51,    69,    52,     1,    -1,    70,    -1,    -1,    70,    49,
      71,    -1,    71,    -1,    70,    49,     1,    -1,     1,    -1,
      67,    72,    -1,    67,     1,    -1,    72,    55,    73,    -1,
      73,    -1,    72,    55,     1,    -1,     1,    -1,     7,    -1,
       7,    53,    54,    -1,     1,    54,    -1,    75,    -1,    76,
      -1,    77,    -1,    78,    -1,    86,    -1,    87,    -1,    81,
      -1,    83,    -1,    82,    -1,    84,    -1,    89,    49,    -1,
      49,    -1,     1,    49,    -1,    56,    79,    80,    57,    -1,
      56,    79,     1,    57,    -1,    56,     1,    80,    57,    -1,
       1,    88,    89,    -1,   104,    88,     1,    -1,     1,    29,
      -1,     1,    28,    -1,    79,    63,    -1,    -1,    80,    74,
      -1,    -1,     9,    90,     8,    75,    16,    75,    -1,     9,
       1,    -1,     9,     1,    16,    75,    -1,     9,     1,     8,
      75,    16,    75,    -1,     9,    90,     8,    74,    -1,     9,
      90,     8,    75,    16,    76,    -1,     9,     1,    -1,     9,
       1,    16,    76,    -1,     9,     1,     8,    75,    16,    76,
      -1,    10,    90,    36,    75,    -1,    11,     7,    48,    85,
      36,    75,    -1,    10,     1,    36,    75,    -1,    10,     1,
      -1,    11,     7,    48,     1,    36,    75,    -1,    11,     1,
      -1,    10,    90,    36,    76,    -1,    11,     7,    48,    85,
      36,    76,    -1,    11,     7,    48,     1,    36,    76,    -1,
      11,     1,    -1,    90,    38,    90,    -1,    90,    38,    90,
      37,    90,    -1,    17,    49,    -1,    17,    89,    49,    -1,
      17,     1,    49,    -1,    18,    49,    -1,   104,    48,    89,
      -1,   104,    21,    89,    -1,   104,    22,    89,    -1,   104,
      24,    89,    -1,   104,    23,    89,    -1,   104,    29,    -1,
     104,    28,    -1,   104,    48,    89,    -1,   104,    21,    89,
      -1,   104,    22,    89,    -1,   104,    24,    89,    -1,   104,
      23,    89,    -1,   104,    29,    -1,   104,    28,    -1,    90,
      -1,    90,    46,    91,    -1,    91,    -1,    90,    46,     1,
      -1,    91,    45,    92,    -1,    92,    -1,    91,    45,     1,
      -1,    47,    92,    -1,    93,    -1,    47,     1,    -1,    95,
      94,    95,    -1,    95,    -1,    25,    -1,    30,    -1,    31,
      -1,    26,    -1,    20,    -1,    27,    -1,    95,    96,    97,
      -1,    97,    -1,    95,    94,     1,    -1,    32,    -1,    33,
      -1,    97,    98,    99,    -1,    99,    -1,    97,    98,     1,
      -1,    34,    -1,    41,    -1,    99,   100,   101,    -1,   101,
      -1,    99,   100,     1,    -1,    42,    -1,    35,    -1,    39,
      -1,   102,   101,    -1,   103,    -1,   102,     1,    -1,    41,
      -1,    42,    -1,    40,    -1,   105,    -1,   104,    -1,     7,
      -1,     7,    53,    89,    54,    -1,    51,    89,    52,    -1,
     106,    -1,   109,    -1,    51,     1,    -1,     1,    51,    -1,
       7,    51,   107,    52,    -1,   108,    -1,    -1,   108,    55,
      89,    -1,    89,    -1,   108,    55,     1,    -1,     4,    -1,
       5,    -1,     6,    -1,     3,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    62,    62,    65,    66,    69,    70,    71,    76,    78,
      79,    83,    84,    85,    88,    89,    90,    91,    94,    95,
      96,    97,   100,   101,   102,   103,   106,   107,   108,   113,
     114,   115,   116,   117,   118,   119,   122,   123,   126,   127,
     128,   129,   132,   133,   136,   137,   138,   139,   142,   143,
     144,   149,   150,   153,   154,   155,   156,   157,   158,   161,
     162,   165,   166,   167,   170,   171,   172,   173,   174,   175,
     176,   179,   180,   183,   184,   187,   188,   189,   190,   193,
     194,   195,   196,   197,   200,   201,   202,   203,   204,   205,
     208,   209,   210,   211,   214,   216,   219,   220,   221,   224,
     229,   230,   231,   232,   233,   234,   235,   238,   239,   240,
     241,   242,   243,   244,   245,   248,   249,   250,   253,   254,
     255,   258,   259,   260,   263,   264,   267,   268,   269,   270,
     271,   272,   275,   276,   277,   280,   281,   284,   285,   286,
     289,   290,   293,   294,   295,   298,   299,   300,   303,   304,
     305,   308,   309,   310,   313,   314,   317,   318,   321,   322,
     323,   324,   325,   328,   331,   332,   335,   336,   337,   340,
     341,   342,   343
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
  "iterrange", "returnStmt", "breakStmt", "assignop", "exp", "simpleExp",
  "andExp", "unaryRelExp", "relExp", "relop", "minmaxExp", "minmaxop",
  "sumExp", "sumop", "mulExp", "mulop", "unaryExp", "unaryop", "factor",
  "mutable", "immutable", "call", "args", "argList", "constant", 0
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
       0,    58,    59,    60,    60,    61,    61,    61,    62,    62,
      62,    63,    63,    63,    64,    64,    64,    64,    65,    65,
      65,    65,    66,    66,    66,    66,    67,    67,    67,    68,
      68,    68,    68,    68,    68,    68,    69,    69,    70,    70,
      70,    70,    71,    71,    72,    72,    72,    72,    73,    73,
      73,    74,    74,    75,    75,    75,    75,    75,    75,    76,
      76,    77,    77,    77,    78,    78,    78,    78,    78,    78,
      78,    79,    79,    80,    80,    81,    81,    81,    81,    82,
      82,    82,    82,    82,    83,    83,    83,    83,    83,    83,
      84,    84,    84,    84,    85,    85,    86,    86,    86,    87,
      88,    88,    88,    88,    88,    88,    88,    89,    89,    89,
      89,    89,    89,    89,    89,    90,    90,    90,    91,    91,
      91,    92,    92,    92,    93,    93,    94,    94,    94,    94,
      94,    94,    95,    95,    95,    96,    96,    97,    97,    97,
      98,    98,    99,    99,    99,   100,   100,   100,   101,   101,
     101,   102,   102,   102,   103,   103,   104,   104,   105,   105,
     105,   105,   105,   106,   107,   107,   108,   108,   108,   109,
     109,   109,   109
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     1,     3,     3,
       3,     4,     3,     3,     3,     1,     1,     3,     1,     3,
       3,     3,     1,     4,     3,     2,     1,     1,     1,     6,
       5,     2,     4,     6,     3,     5,     1,     0,     3,     1,
       3,     1,     2,     2,     3,     1,     3,     1,     1,     3,
       2,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     2,     1,     2,     4,     4,     4,     3,     3,     2,
       2,     2,     0,     2,     0,     6,     2,     4,     6,     4,
       6,     2,     4,     6,     4,     6,     4,     2,     6,     2,
       4,     6,     6,     2,     3,     5,     2,     3,     3,     2,
       3,     3,     3,     3,     3,     2,     2,     3,     3,     3,
       3,     3,     2,     2,     1,     3,     1,     3,     3,     1,
       3,     2,     1,     2,     3,     1,     1,     1,     1,     1,
       1,     1,     3,     1,     3,     1,     1,     3,     1,     3,
       1,     1,     3,     1,     3,     1,     1,     1,     2,     1,
       2,     1,     1,     1,     1,     1,     1,     4,     3,     1,
       1,     2,     2,     4,     1,     0,     3,     1,     3,     1,
       1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,    26,    27,    28,     0,     0,     4,     5,
       0,     6,    16,    22,     0,    15,    18,     0,     1,     3,
      31,    22,     0,     0,    25,     0,     9,     0,     0,    34,
       0,     0,    36,    39,    10,     0,     8,     0,   172,   169,
     170,   171,   156,   153,   151,   152,     0,     0,    20,   116,
     119,   122,   125,   133,   138,   143,     0,   149,   155,   154,
     159,   160,    24,     0,    17,    14,    21,    19,    43,    48,
      42,    45,     0,     0,    32,     0,   162,     0,     0,   123,
     121,   161,     0,   114,   155,     0,     0,   130,   126,   129,
     131,   127,   128,   135,   136,     0,     0,   140,   141,     0,
     146,   147,   145,     0,   150,   148,    23,    50,     0,     0,
      35,     0,     0,     0,     0,     0,    62,     0,    30,    51,
      52,    53,    54,    57,    59,    58,    60,    55,    56,     0,
     155,    40,    38,     0,   167,     0,   164,     0,   158,     0,
       0,     0,     0,   113,   112,     0,   117,   115,   120,   118,
     134,   124,   132,   139,   137,   144,   142,    49,    46,    44,
     156,    70,    69,    63,     0,     0,    76,     0,    87,     0,
      89,     0,     0,    96,     0,    99,    74,     0,    61,     0,
      33,    29,   163,     0,   157,   108,   109,   111,   110,   107,
       0,    67,     0,     0,     0,     0,   106,   105,     0,     0,
       0,     0,     0,     0,     0,    98,    97,     0,     0,     0,
      71,     0,     0,    68,   168,   166,   134,   101,   102,   104,
     103,   100,     0,     0,     0,     0,     0,    77,    82,    79,
      51,    86,    84,    90,     0,     0,     0,    66,    73,    65,
       0,     0,     0,    64,    76,     0,     0,    89,     0,     0,
       0,     0,     0,     0,    13,     0,    12,     0,     0,     0,
       0,     0,    78,    83,    75,    80,    88,    92,    85,    91,
      94,    11,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    95
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     6,     7,     8,     9,   210,    14,    15,    16,    30,
      11,    31,    32,    33,    70,    71,   238,   119,   120,   121,
     122,   177,   207,   123,   124,   125,   126,   235,   127,   128,
     164,   129,    83,    49,    50,    51,    95,    52,    96,    53,
      99,    54,   103,    55,    56,    57,   130,    59,    60,   135,
     136,    61
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -169
static const yytype_int16 yypact[] =
{
     331,   149,    -9,  -169,  -169,  -169,   111,   218,  -169,  -169,
     105,  -169,    21,    62,    79,  -169,    70,    33,  -169,  -169,
     186,    91,    96,   507,  -169,    52,  -169,   158,   556,    46,
     175,    71,   112,  -169,  -169,    95,  -169,   123,  -169,  -169,
    -169,  -169,   160,  -169,  -169,  -169,   564,   572,   137,   153,
    -169,  -169,   777,    80,    55,  -169,   726,  -169,  -169,  -169,
    -169,  -169,  -169,   156,    21,  -169,   123,   137,   195,   150,
     172,  -169,    10,   178,    46,   202,  -169,   126,   507,   123,
    -169,   123,   203,   137,   223,   580,   588,  -169,  -169,  -169,
    -169,  -169,  -169,  -169,  -169,   733,   740,  -169,  -169,   747,
    -169,  -169,  -169,   789,   123,  -169,  -169,  -169,   209,   183,
      97,   637,   645,   201,   495,   240,  -169,   255,  -169,  -169,
    -169,  -169,  -169,  -169,  -169,  -169,  -169,  -169,  -169,   245,
     200,  -169,  -169,   405,  -169,   248,   250,   256,  -169,   507,
     507,   507,   507,  -169,  -169,   507,   123,   153,   123,  -169,
     123,   777,    80,   123,    55,   123,  -169,  -169,   262,  -169,
     264,  -169,  -169,  -169,   507,   414,    14,    18,   -11,    -7,
    -169,   270,   252,  -169,   272,  -169,  -169,   273,  -169,   318,
      97,  -169,  -169,   653,  -169,  -169,  -169,  -169,  -169,  -169,
     322,  -169,   507,   507,   507,   507,  -169,  -169,   507,   423,
     477,   477,   423,   477,   661,  -169,  -169,   330,    11,   294,
    -169,   219,   348,  -169,   123,  -169,  -169,  -169,  -169,  -169,
    -169,  -169,    97,   669,   645,   236,   309,  -169,  -169,  -169,
     310,  -169,  -169,  -169,     7,   291,    32,  -169,  -169,  -169,
     226,   219,   243,  -169,    28,    23,    67,  -169,   280,   477,
     477,   477,   477,   507,  -169,   244,  -169,   423,   423,   423,
     423,   718,  -169,  -169,  -169,  -169,  -169,  -169,  -169,  -169,
      40,  -169,   326,   327,     9,   314,   507,   423,   423,   423,
     423,   137
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -169,  -169,  -169,   349,  -169,  -169,    -2,   333,  -169,     3,
    -169,   328,  -169,   288,  -169,   253,   -66,   -63,  -168,  -169,
    -169,  -169,   187,  -169,  -169,  -169,  -169,   106,  -169,  -169,
     238,   -40,   -19,   284,   -45,  -169,   222,   279,  -169,   282,
    -169,   276,  -169,   -54,  -169,  -169,   -23,  -169,  -169,  -169,
    -169,  -169
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -166
static const yytype_int16 yytable[] =
{
      58,    80,   105,    10,    48,    58,   118,    82,    22,    67,
      10,   110,    12,    38,    39,    40,    41,    42,    13,   111,
     112,   113,   199,    58,    84,   202,   201,   114,   115,   203,
     200,   259,   228,    58,    29,   233,   257,   134,   137,    85,
      76,   149,    17,   251,   258,   279,     3,     4,     5,   156,
      43,    44,    45,    62,    84,    84,    63,    46,    76,   116,
      76,    47,    58,    58,    85,    76,   117,   181,   239,    85,
     253,    23,    58,    58,   174,    24,    58,   276,    85,    76,
      58,   263,   265,   267,   269,   -37,    85,   165,    58,    58,
     100,    84,   167,   169,   101,   -41,    74,   102,   -41,   185,
     186,   187,   188,   260,   160,   189,    20,   165,     3,     4,
       5,    18,    21,    85,    97,    25,    84,    84,    84,    84,
      28,    98,    84,    72,   191,   161,   162,    37,    26,    38,
      39,    40,    41,    42,    27,   229,   226,   227,   230,   231,
     232,    84,    35,   215,    25,    36,   163,   -37,    76,    -7,
      12,    27,   217,   218,   219,   220,    13,   165,   221,    64,
      84,    73,    -7,    -7,    -7,    13,    43,    44,    45,    84,
      84,    84,    84,    46,    76,    84,    68,    47,  -165,   131,
     211,    58,    69,    85,   158,   236,   262,   264,   266,   268,
      69,     3,     4,     5,   272,   227,   273,   232,    86,   165,
      58,    58,   170,   108,   245,   246,   240,   160,   171,   242,
     106,    77,   241,    78,   262,   264,   266,   268,    -2,     1,
      12,   139,   140,   141,   142,     2,    13,   109,   143,   144,
      58,     3,     4,     5,   270,    34,    23,   247,    58,   255,
      24,   -16,   236,   248,   139,   140,   141,   142,   145,   107,
     -47,   143,   144,    58,   133,   138,   176,   281,   -72,   -72,
     -72,   -72,   -72,   157,   -72,   -72,   -72,   -72,   -72,   -72,
     -72,   145,   -72,   -72,   208,   254,   -74,   -74,   -74,   -74,
     -74,    27,   -74,   -74,   -74,   209,     3,     4,     5,   175,
     -74,   -74,   256,   271,   178,   -72,   -72,   -72,    27,    27,
     182,   205,   -72,    76,   -72,   183,   -72,     3,     4,     5,
     184,   -72,   -72,   -74,   -74,   -74,   107,    78,   204,   213,
     -74,   206,   -74,   216,   -74,   249,   250,   252,   261,   -74,
     -74,   222,     1,    38,    39,    40,    41,    42,     2,   111,
     112,   113,   277,   278,     3,     4,     5,   114,   115,   222,
     280,    38,    39,    40,    41,    42,    19,   111,   112,   113,
      65,   132,   159,    75,   212,   114,   115,   275,   179,   147,
      43,    44,    45,   190,   151,   154,     0,    46,   152,   116,
       0,    47,     0,     0,     0,     0,   117,   237,    43,    44,
      45,     0,     0,     0,     0,    46,     0,   116,     0,    47,
       0,     0,     0,     0,   117,   243,   180,     0,    38,    39,
      40,    41,    42,     0,   111,   112,   113,     0,     0,     0,
       0,     0,   114,   115,   222,     0,    38,    39,    40,    41,
      42,     0,   223,   224,   225,   192,   193,   194,   195,     0,
     114,   115,   196,   197,     0,    43,    44,    45,     0,     0,
       0,     0,    46,     0,   116,     0,    47,     0,     0,     0,
       0,   117,   198,    43,    44,    45,     0,     0,     0,     0,
      46,     0,   116,     0,    47,     0,     0,     0,   222,   117,
      38,    39,    40,    41,    42,     0,   111,   112,   113,     0,
       0,     0,     0,     0,   114,   115,   172,     0,    38,    39,
      40,    41,    42,     0,     0,     0,     0,     0,    37,     0,
      38,    39,    40,    41,    42,     0,     0,    43,    44,    45,
       0,     0,     0,     0,    46,     0,   116,     0,    47,     0,
       0,     0,     0,   117,     0,    43,    44,    45,     0,     0,
       0,     0,    46,     0,   173,     0,    47,    43,    44,    45,
       0,     0,     0,     0,    46,     0,     0,    66,    47,    38,
      39,    40,    41,    42,     0,    79,     0,    38,    39,    40,
      41,    42,     0,    81,     0,    38,    39,    40,    41,    42,
       0,   146,     0,    38,    39,    40,    41,    42,     0,   148,
       0,    38,    39,    40,    41,    42,    43,    44,    45,     0,
       0,     0,     0,    46,    43,    44,    45,    47,     0,     0,
       0,    46,    43,    44,    45,    47,     0,     0,     0,    46,
      43,    44,    45,    47,     0,     0,     0,    46,    43,    44,
      45,    47,     0,     0,     0,    46,     0,     0,   166,    47,
      38,    39,    40,    41,    42,     0,   168,     0,    38,    39,
      40,    41,    42,     0,   214,     0,    38,    39,    40,    41,
      42,     0,   234,     0,    38,    39,    40,    41,    42,     0,
     244,     0,    38,    39,    40,    41,    42,    43,    44,    45,
       0,     0,     0,     0,    46,    43,    44,    45,    47,     0,
       0,     0,    46,    43,    44,    45,    47,     0,     0,     0,
      46,    43,    44,    45,    47,     0,     0,     0,    46,    43,
      44,    45,    47,     0,     0,     0,    46,     0,     0,   274,
      47,    38,    39,    40,    41,    42,     0,   104,     0,    38,
      39,    40,    41,    42,   150,     0,    38,    39,    40,    41,
      42,    37,     0,    38,    39,    40,    41,    42,   153,     0,
      38,    39,    40,    41,    42,     0,     0,     0,    43,    44,
      45,     0,     0,     0,     0,    46,    43,    44,    45,    47,
       0,     0,     0,    43,    44,    45,     0,    47,     0,     0,
      43,    44,    45,     0,    47,     0,     0,    43,    44,    45,
     155,    47,    38,    39,    40,    41,    42,    87,    47,     0,
       0,     0,    88,    89,    90,     0,     0,    91,    92,    93,
      94,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    43,
      44,    45,     0,     0,     0,     0,     0,     0,     0,     0,
      47
};

static const yytype_int16 yycheck[] =
{
      23,    46,    56,     0,    23,    28,    72,    47,    10,    28,
       7,     1,     1,     3,     4,     5,     6,     7,     7,     9,
      10,    11,     8,    46,    47,    36,     8,    17,    18,    36,
      16,     8,   200,    56,     1,   203,     8,    77,    78,    46,
      51,    86,    51,    36,    16,    36,    13,    14,    15,   103,
      40,    41,    42,     1,    77,    78,     4,    47,    51,    49,
      51,    51,    85,    86,    46,    51,    56,   133,    57,    46,
      38,    50,    95,    96,   114,    54,    99,    37,    46,    51,
     103,   249,   250,   251,   252,    52,    46,   110,   111,   112,
      35,   114,   111,   112,    39,    49,     1,    42,    52,   139,
     140,   141,   142,    36,     7,   145,     1,   130,    13,    14,
      15,     0,     7,    46,    34,    53,   139,   140,   141,   142,
      50,    41,   145,    52,   164,    28,    29,     1,    49,     3,
       4,     5,     6,     7,    55,   201,   199,   200,   201,   202,
     203,   164,    51,   183,    53,    49,    49,    52,    51,     0,
       1,    55,   192,   193,   194,   195,     7,   180,   198,     1,
     183,    49,    13,    14,    15,     7,    40,    41,    42,   192,
     193,   194,   195,    47,    51,   198,     1,    51,    52,     1,
     177,   204,     7,    46,     1,   204,   249,   250,   251,   252,
       7,    13,    14,    15,   257,   258,   259,   260,    45,   222,
     223,   224,     1,    53,   223,   224,   208,     7,     7,   211,
      54,    51,   209,    53,   277,   278,   279,   280,     0,     1,
       1,    21,    22,    23,    24,     7,     7,    55,    28,    29,
     253,    13,    14,    15,   253,    49,    50,     1,   261,   241,
      54,    55,   261,     7,    21,    22,    23,    24,    48,    54,
      55,    28,    29,   276,    52,    52,     1,   276,     3,     4,
       5,     6,     7,    54,     9,    10,    11,    12,    13,    14,
      15,    48,    17,    18,     1,    49,     3,     4,     5,     6,
       7,    55,     9,    10,    11,    12,    13,    14,    15,    49,
      17,    18,    49,    49,    49,    40,    41,    42,    55,    55,
      52,    49,    47,    51,    49,    55,    51,    13,    14,    15,
      54,    56,    57,    40,    41,    42,    54,    53,    48,     1,
      47,    49,    49,     1,    51,    16,    16,    36,    48,    56,
      57,     1,     1,     3,     4,     5,     6,     7,     7,     9,
      10,    11,    16,    16,    13,    14,    15,    17,    18,     1,
      36,     3,     4,     5,     6,     7,     7,     9,    10,    11,
      27,    73,   109,    35,   177,    17,    18,   261,   130,    85,
      40,    41,    42,   151,    95,    99,    -1,    47,    96,    49,
      -1,    51,    -1,    -1,    -1,    -1,    56,    57,    40,    41,
      42,    -1,    -1,    -1,    -1,    47,    -1,    49,    -1,    51,
      -1,    -1,    -1,    -1,    56,    57,     1,    -1,     3,     4,
       5,     6,     7,    -1,     9,    10,    11,    -1,    -1,    -1,
      -1,    -1,    17,    18,     1,    -1,     3,     4,     5,     6,
       7,    -1,     9,    10,    11,    21,    22,    23,    24,    -1,
      17,    18,    28,    29,    -1,    40,    41,    42,    -1,    -1,
      -1,    -1,    47,    -1,    49,    -1,    51,    -1,    -1,    -1,
      -1,    56,    48,    40,    41,    42,    -1,    -1,    -1,    -1,
      47,    -1,    49,    -1,    51,    -1,    -1,    -1,     1,    56,
       3,     4,     5,     6,     7,    -1,     9,    10,    11,    -1,
      -1,    -1,    -1,    -1,    17,    18,     1,    -1,     3,     4,
       5,     6,     7,    -1,    -1,    -1,    -1,    -1,     1,    -1,
       3,     4,     5,     6,     7,    -1,    -1,    40,    41,    42,
      -1,    -1,    -1,    -1,    47,    -1,    49,    -1,    51,    -1,
      -1,    -1,    -1,    56,    -1,    40,    41,    42,    -1,    -1,
      -1,    -1,    47,    -1,    49,    -1,    51,    40,    41,    42,
      -1,    -1,    -1,    -1,    47,    -1,    -1,     1,    51,     3,
       4,     5,     6,     7,    -1,     1,    -1,     3,     4,     5,
       6,     7,    -1,     1,    -1,     3,     4,     5,     6,     7,
      -1,     1,    -1,     3,     4,     5,     6,     7,    -1,     1,
      -1,     3,     4,     5,     6,     7,    40,    41,    42,    -1,
      -1,    -1,    -1,    47,    40,    41,    42,    51,    -1,    -1,
      -1,    47,    40,    41,    42,    51,    -1,    -1,    -1,    47,
      40,    41,    42,    51,    -1,    -1,    -1,    47,    40,    41,
      42,    51,    -1,    -1,    -1,    47,    -1,    -1,     1,    51,
       3,     4,     5,     6,     7,    -1,     1,    -1,     3,     4,
       5,     6,     7,    -1,     1,    -1,     3,     4,     5,     6,
       7,    -1,     1,    -1,     3,     4,     5,     6,     7,    -1,
       1,    -1,     3,     4,     5,     6,     7,    40,    41,    42,
      -1,    -1,    -1,    -1,    47,    40,    41,    42,    51,    -1,
      -1,    -1,    47,    40,    41,    42,    51,    -1,    -1,    -1,
      47,    40,    41,    42,    51,    -1,    -1,    -1,    47,    40,
      41,    42,    51,    -1,    -1,    -1,    47,    -1,    -1,     1,
      51,     3,     4,     5,     6,     7,    -1,     1,    -1,     3,
       4,     5,     6,     7,     1,    -1,     3,     4,     5,     6,
       7,     1,    -1,     3,     4,     5,     6,     7,     1,    -1,
       3,     4,     5,     6,     7,    -1,    -1,    -1,    40,    41,
      42,    -1,    -1,    -1,    -1,    47,    40,    41,    42,    51,
      -1,    -1,    -1,    40,    41,    42,    -1,    51,    -1,    -1,
      40,    41,    42,    -1,    51,    -1,    -1,    40,    41,    42,
       1,    51,     3,     4,     5,     6,     7,    20,    51,    -1,
      -1,    -1,    25,    26,    27,    -1,    -1,    30,    31,    32,
      33,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    40,
      41,    42,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      51
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     7,    13,    14,    15,    59,    60,    61,    62,
      67,    68,     1,     7,    64,    65,    66,    51,     0,    61,
       1,     7,    64,    50,    54,    53,    49,    55,    50,     1,
      67,    69,    70,    71,    49,    51,    49,     1,     3,     4,
       5,     6,     7,    40,    41,    42,    47,    51,    90,    91,
      92,    93,    95,    97,    99,   101,   102,   103,   104,   105,
     106,   109,     1,     4,     1,    65,     1,    90,     1,     7,
      72,    73,    52,    49,     1,    69,    51,    51,    53,     1,
      92,     1,    89,    90,   104,    46,    45,    20,    25,    26,
      27,    30,    31,    32,    33,    94,    96,    34,    41,    98,
      35,    39,    42,   100,     1,   101,    54,    54,    53,    55,
       1,     9,    10,    11,    17,    18,    49,    56,    74,    75,
      76,    77,    78,    81,    82,    83,    84,    86,    87,    89,
     104,     1,    71,    52,    89,   107,   108,    89,    52,    21,
      22,    23,    24,    28,    29,    48,     1,    91,     1,    92,
       1,    95,    97,     1,    99,     1,   101,    54,     1,    73,
       7,    28,    29,    49,    88,   104,     1,    90,     1,    90,
       1,     7,     1,    49,    89,    49,     1,    79,    49,    88,
       1,    74,    52,    55,    54,    89,    89,    89,    89,    89,
      94,    89,    21,    22,    23,    24,    28,    29,    48,     8,
      16,     8,    36,    36,    48,    49,    49,    80,     1,    12,
      63,    67,    80,     1,     1,    89,     1,    89,    89,    89,
      89,    89,     1,     9,    10,    11,    75,    75,    76,    74,
      75,    75,    75,    76,     1,    85,    90,    57,    74,    57,
      64,    67,    64,    57,     1,    90,    90,     1,     7,    16,
      16,    36,    36,    38,    49,    64,    49,     8,    16,     8,
      36,    48,    75,    76,    75,    76,    75,    76,    75,    76,
      90,    49,    75,    75,     1,    85,    37,    16,    16,    36,
      36,    90
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
#line 62 "parser.y"
    {syntaxTree = (yyvsp[(1) - (1)].tree);;}
    break;

  case 3:
#line 65 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree));;}
    break;

  case 4:
#line 66 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 5:
#line 69 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 6:
#line 70 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 7:
#line 71 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 8:
#line 76 "parser.y"
    {(yyval.tree) = setType((yyvsp[(2) - (3)].tree), (yyvsp[(1) - (3)].type), false); yyerror;;}
    break;

  case 9:
#line 78 "parser.y"
    {(yyval.tree) = NULL; yyerror;;}
    break;

  case 10:
#line 79 "parser.y"
    {(yyval.tree) = NULL; yyerror; yyerror;;}
    break;

  case 11:
#line 83 "parser.y"
    {(yyval.tree) = setType((yyvsp[(3) - (4)].tree), (yyvsp[(2) - (4)].type), true); yyerror;;}
    break;

  case 12:
#line 84 "parser.y"
    {(yyval.tree) = setType((yyvsp[(2) - (3)].tree), (yyvsp[(1) - (3)].type), false); yyerror;;}
    break;

  case 13:
#line 85 "parser.y"
    {(yyval.tree) = NULL; yyerror;;}
    break;

  case 14:
#line 88 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); yyerror;;}
    break;

  case 15:
#line 89 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 16:
#line 90 "parser.y"
    {(yyval.tree) = NULL;;}
    break;

  case 17:
#line 91 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 18:
#line 94 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 19:
#line 95 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (3)].tree); addChild((yyval.tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 20:
#line 96 "parser.y"
    { (yyval.tree) = NULL; yyerror; ;}
    break;

  case 21:
#line 97 "parser.y"
    { (yyval.tree) = NULL; yyerror; ;}
    break;

  case 22:
#line 100 "parser.y"
    { (yyval.tree) = newDeclNode(VarK, UndefinedType, (yyvsp[(1) - (1)].tokenData)); (yyval.tree)->tmp = (yyvsp[(1) - (1)].tokenData)->idIndex;;}
    break;

  case 23:
#line 101 "parser.y"
    {(yyval.tree) = newDeclNode(VarK, UndefinedType, (yyvsp[(1) - (4)].tokenData)); (yyval.tree)->isArray = true; (yyval.tree)->aSize = (yyvsp[(3) - (4)].tokenData)->nvalue; (yyval.tree)->tmp = (yyvsp[(1) - (4)].tokenData)->idIndex;;}
    break;

  case 24:
#line 102 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 25:
#line 103 "parser.y"
    { (yyval.tree) = NULL; yyerror; ;}
    break;

  case 26:
#line 106 "parser.y"
    {(yyval.type) = Integer;;}
    break;

  case 27:
#line 107 "parser.y"
    {(yyval.type) = Boolean;;}
    break;

  case 28:
#line 108 "parser.y"
    {(yyval.type) = Char;;}
    break;

  case 29:
#line 113 "parser.y"
    {(yyval.tree) = newDeclNode(FuncK, (yyvsp[(1) - (6)].type), (yyvsp[(2) - (6)].tokenData), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); (yyval.tree)->tmp = (yyvsp[(2) - (6)].tokenData)->idIndex;;}
    break;

  case 30:
#line 114 "parser.y"
    {(yyval.tree) = newDeclNode(FuncK, Void, (yyvsp[(1) - (5)].tokenData), (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree)); (yyval.tree)->tmp = (yyvsp[(1) - (5)].tokenData)->idIndex;;}
    break;

  case 31:
#line 115 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 32:
#line 116 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 33:
#line 117 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 34:
#line 118 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 35:
#line 119 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 36:
#line 122 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 37:
#line 123 "parser.y"
    {(yyval.tree) = NULL;;}
    break;

  case 38:
#line 126 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 39:
#line 127 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 40:
#line 128 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 41:
#line 129 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 42:
#line 132 "parser.y"
    {(yyval.tree) = setType((yyvsp[(2) - (2)].tree), (yyvsp[(1) - (2)].type), false);;}
    break;

  case 43:
#line 133 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 44:
#line 136 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); yyerror;;}
    break;

  case 45:
#line 137 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 46:
#line 138 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 47:
#line 139 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 48:
#line 142 "parser.y"
    {(yyval.tree) = newDeclNode(ParamK, UndefinedType, (yyvsp[(1) - (1)].tokenData));(yyval.tree)->tmp = (yyvsp[(1) - (1)].tokenData)->svalue;;}
    break;

  case 49:
#line 143 "parser.y"
    {(yyval.tree) = newDeclNode(ParamK, UndefinedType, (yyvsp[(1) - (3)].tokenData));(yyval.tree)->isArray = true;(yyval.tree)->tmp = (yyvsp[(1) - (3)].tokenData)->svalue;;}
    break;

  case 50:
#line 144 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 51:
#line 149 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 52:
#line 150 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 53:
#line 153 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 54:
#line 154 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 55:
#line 155 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 56:
#line 156 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 57:
#line 157 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 58:
#line 158 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 59:
#line 161 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 60:
#line 162 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 61:
#line 165 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (2)].tree);;}
    break;

  case 62:
#line 166 "parser.y"
    {(yyval.tree) = NULL; yyerror;;}
    break;

  case 63:
#line 167 "parser.y"
    { (yyval.tree) = NULL; yyerror; ;}
    break;

  case 64:
#line 170 "parser.y"
    {(yyval.tree) = newStmtNode(CompoundK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(3) - (4)].tree)); yyerror;;}
    break;

  case 65:
#line 171 "parser.y"
    {(yyval.tree)=NULL; yyerror; ;}
    break;

  case 66:
#line 172 "parser.y"
    {(yyval.tree)=NULL; yyerror; ;}
    break;

  case 67:
#line 173 "parser.y"
    { (yyval.tree) = NULL; yyerror; ;}
    break;

  case 68:
#line 174 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 69:
#line 175 "parser.y"
    { (yyval.tree)=NULL; yyerror; ;}
    break;

  case 70:
#line 176 "parser.y"
    { (yyval.tree)=NULL; yyerror; ;}
    break;

  case 71:
#line 179 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree));;}
    break;

  case 72:
#line 180 "parser.y"
    {(yyval.tree) = NULL;;}
    break;

  case 73:
#line 183 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree));;}
    break;

  case 74:
#line 184 "parser.y"
    {(yyval.tree) = NULL;;}
    break;

  case 75:
#line 187 "parser.y"
    {(yyval.tree) = newStmtNode(IfK, (yyvsp[(1) - (6)].tokenData), (yyvsp[(2) - (6)].tree), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); ;}
    break;

  case 76:
#line 188 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 77:
#line 189 "parser.y"
    { (yyval.tree) = NULL; yyerror; ;}
    break;

  case 78:
#line 190 "parser.y"
    { (yyval.tree) = NULL; yyerror; ;}
    break;

  case 79:
#line 193 "parser.y"
    {(yyval.tree) = newStmtNode(IfK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree));;}
    break;

  case 80:
#line 194 "parser.y"
    {(yyval.tree) = newStmtNode(IfK, (yyvsp[(1) - (6)].tokenData), (yyvsp[(2) - (6)].tree), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree));;}
    break;

  case 81:
#line 195 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 82:
#line 196 "parser.y"
    { (yyval.tree) = NULL; yyerror; ;}
    break;

  case 83:
#line 197 "parser.y"
    { (yyval.tree) = NULL; yyerror; ;}
    break;

  case 84:
#line 200 "parser.y"
    {(yyval.tree) = newStmtNode(WhileK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree));;}
    break;

  case 85:
#line 201 "parser.y"
    {(yyval.tree) = newStmtNode(ForK, (yyvsp[(1) - (6)].tokenData), newDeclNode(VarK, Integer, (yyvsp[(2) - (6)].tokenData)), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); (yyval.tree)->tmp = (yyvsp[(2) - (6)].tokenData)->idIndex;;}
    break;

  case 86:
#line 202 "parser.y"
    { (yyval.tree) = NULL; yyerror; ;}
    break;

  case 87:
#line 203 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 88:
#line 204 "parser.y"
    { (yyval.tree) = NULL; yyerror; ;}
    break;

  case 89:
#line 205 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 90:
#line 208 "parser.y"
    {(yyval.tree) = newStmtNode(WhileK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree));;}
    break;

  case 91:
#line 209 "parser.y"
    {(yyval.tree) = newStmtNode(ForK, (yyvsp[(1) - (6)].tokenData), newDeclNode(VarK, Integer, (yyvsp[(2) - (6)].tokenData)), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); (yyval.tree)->tmp = (yyvsp[(2) - (6)].tokenData)->idIndex;;}
    break;

  case 92:
#line 210 "parser.y"
    { (yyval.tree) = NULL; yyerror; ;}
    break;

  case 93:
#line 211 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 94:
#line 214 "parser.y"
    {(yyval.tree) = newStmtNode(RangeK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 95:
#line 216 "parser.y"
    {(yyval.tree) = newStmtNode(RangeK, (yyvsp[(2) - (5)].tokenData), (yyvsp[(1) - (5)].tree), (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree)); (yyval.tree)->tmp = (yyvsp[(2) - (5)].tokenData)->idIndex;;}
    break;

  case 96:
#line 219 "parser.y"
    {(yyval.tree) = newStmtNode(ReturnK, (yyvsp[(1) - (2)].tokenData));;}
    break;

  case 97:
#line 220 "parser.y"
    {(yyval.tree) = newStmtNode(ReturnK, (yyvsp[(1) - (3)].tokenData), (yyvsp[(2) - (3)].tree));;}
    break;

  case 98:
#line 221 "parser.y"
    { (yyval.tree) = NULL; yyerror; ;}
    break;

  case 99:
#line 224 "parser.y"
    {(yyval.tree) = newStmtNode(BreakK, (yyvsp[(1) - (2)].tokenData));;}
    break;

  case 100:
#line 229 "parser.y"
    {(yyval.type) = newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); (yyval.type)->expType = (yyvsp[(1) - (3)].tree)->expType;;}
    break;

  case 101:
#line 230 "parser.y"
    {(yyval.type) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 102:
#line 231 "parser.y"
    {(yyval.type) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 103:
#line 232 "parser.y"
    {(yyval.type) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 104:
#line 233 "parser.y"
    {(yyval.type) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 105:
#line 234 "parser.y"
    {(yyval.type) = setType(newExpNode(AssignK, (yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].tree)), Integer, false);;}
    break;

  case 106:
#line 235 "parser.y"
    {(yyval.type) = setType(newExpNode(AssignK, (yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].tree)), Integer, false);;}
    break;

  case 107:
#line 238 "parser.y"
    {(yyval.tree) = newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); (yyval.tree)->expType = (yyvsp[(1) - (3)].tree)->expType;;}
    break;

  case 108:
#line 239 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 109:
#line 240 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 110:
#line 241 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 111:
#line 242 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 112:
#line 243 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].tree)), Integer, false);;}
    break;

  case 113:
#line 244 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].tree)), Integer, false);;}
    break;

  case 114:
#line 245 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 115:
#line 248 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Boolean, false);;}
    break;

  case 116:
#line 249 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 117:
#line 250 "parser.y"
    { (yyval.tree)=NULL; ;}
    break;

  case 118:
#line 253 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Boolean, false);;}
    break;

  case 119:
#line 254 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 120:
#line 255 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 121:
#line 258 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (2)].tokenData), (yyvsp[(2) - (2)].tree)), Boolean, false);;}
    break;

  case 122:
#line 259 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 123:
#line 260 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 124:
#line 263 "parser.y"
    {(yyval.tree) = (yyvsp[(2) - (3)].tree); addChild((yyval.tree), (yyvsp[(1) - (3)].tree)); addChild((yyval.tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 125:
#line 264 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 126:
#line 267 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 127:
#line 268 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 128:
#line 269 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 129:
#line 270 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 130:
#line 271 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 131:
#line 272 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 132:
#line 275 "parser.y"
    {(yyval.tree) = (yyvsp[(2) - (3)].tree);addChild((yyval.tree), (yyvsp[(1) - (3)].tree));addChild((yyval.tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 133:
#line 276 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 134:
#line 277 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 135:
#line 280 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 136:
#line 281 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 137:
#line 284 "parser.y"
    {(yyval.tree) = (yyvsp[(2) - (3)].tree); addChild((yyval.tree), (yyvsp[(1) - (3)].tree)); addChild((yyval.tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 138:
#line 285 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 139:
#line 286 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 140:
#line 289 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 141:
#line 290 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 142:
#line 293 "parser.y"
    {(yyval.tree) = (yyvsp[(2) - (3)].tree); addChild((yyval.tree), (yyvsp[(1) - (3)].tree)); addChild((yyval.tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 143:
#line 294 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 144:
#line 295 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 145:
#line 298 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 146:
#line 299 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 147:
#line 300 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 148:
#line 303 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (2)].tree); addChild((yyval.tree), (yyvsp[(2) - (2)].tree));;}
    break;

  case 149:
#line 304 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 150:
#line 305 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 151:
#line 308 "parser.y"
    {(yyvsp[(1) - (1)].tokenData)->tokenclass=CHSIGN; (yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 152:
#line 309 "parser.y"
    {(yyvsp[(1) - (1)].tokenData)->tokenclass=SIZEOF; (yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 153:
#line 310 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 154:
#line 313 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 155:
#line 314 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 156:
#line 317 "parser.y"
    {(yyval.tree) = newExpNode(IdK, (yyvsp[(1) - (1)].tokenData)); (yyval.tree)->name = (yyvsp[(1) - (1)].tokenData)->idIndex;;}
    break;

  case 157:
#line 318 "parser.y"
    {(yyval.tree) = newExpNode(OpK, (yyvsp[(2) - (4)].tokenData), newExpNode(IdK, (yyvsp[(1) - (4)].tokenData)), (yyvsp[(3) - (4)].tree)); (yyval.tree)->child[0]->name = (yyvsp[(1) - (4)].tokenData)->idIndex;;}
    break;

  case 158:
#line 321 "parser.y"
    {(yyval.tree) = (yyvsp[(2) - (3)].tree); yyerrok;;}
    break;

  case 159:
#line 322 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 160:
#line 323 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 161:
#line 324 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 162:
#line 325 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 163:
#line 328 "parser.y"
    {(yyval.tree) = newExpNode(CallK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(3) - (4)].tree));(yyval.tree)->name = (yyvsp[(1) - (4)].tokenData)->idIndex;;}
    break;

  case 164:
#line 331 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 165:
#line 332 "parser.y"
    {(yyval.tree) = NULL;;}
    break;

  case 166:
#line 335 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); yyerror;;}
    break;

  case 167:
#line 336 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 168:
#line 337 "parser.y"
    { (yyval.tree)=NULL; ;}
    break;

  case 169:
#line 340 "parser.y"
    {(yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));(yyval.tree)->expType = Integer; (yyval.tree)->value = (yyvsp[(1) - (1)].tokenData)->nvalue; ;}
    break;

  case 170:
#line 341 "parser.y"
    {(yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));(yyval.tree)->expType = Char;(yyval.tree)->cvalue = (yyvsp[(1) - (1)].tokenData)->cvalue;;}
    break;

  case 171:
#line 342 "parser.y"
    {(yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));(yyval.tree)->expType = Char;(yyval.tree)->string = (yyvsp[(1) - (1)].tokenData)->svalue;(yyval.tree)->isArray = true;;}
    break;

  case 172:
#line 343 "parser.y"
    {(yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));(yyval.tree)->expType = Boolean;(yyval.tree)->value = (yyvsp[(1) - (1)].tokenData)->nvalue;;}
    break;


/* Line 1267 of yacc.c.  */
#line 2743 "parser.tab.c"
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


#line 346 "parser.y"


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
    extern int  opterr;
    extern int  optind;
    extern char *optarg;
    extern int n_errors;
    extern int n_warnings;
    int c, dset = 0,  pset = 0, bDset = 0, bPset = 0, hset = 0;
    // semantic analysis
    SymbolTable *table = new SymbolTable();
    
    if(argc < 3)
    {
        //printf("ERROR(ARGLIST): source file \"%s\" could not be opened.\n", argv[1]);
        //n_errors++;
        printf("Number of warnings: %d\n", n_warnings);
        printf("Number of errors: %d\n", n_errors);
        return 1;
    }
    
    while((c = ourGetopt(argc, argv, (char *)"dDpPh")) != EOF)
    {
        switch(c)
        {
            case 'd':
                dset = 1;
                break;
            case 'p':
                pset = 1;
                break;
            case 'h':
                hset = 1;
                break;
            case 'P':
                bPset = 1;
                break;
            case 'D':
                bDset = 1;
                break;
        }
    }
    
    if(dset == 1)
    {
        yydebug = 1;
    }
    
    if(hset == 1)
    {
        fprintf(stderr, "Usage: c- [options] [sourceFile] \n");
        printf("options: \n");
        printf("-d      - turn on parser debugging \n");
        printf("-D      - turn on symbol table debugging \n");
        printf("-h      - this usage message ");
        printf("-p      - print the abstract syntax tree");
        printf("-P      - print the abstract syntax tree plus type information");
    }
    
    // create map
    initErrorProcessing();
    
    if(optind < argc)
    {
        yyin = fopen(argv[optind], "r");
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
    
    if(bPset == 1)
    {
        table->debug(bDset);
        
        symanticA(syntaxTree, table);
        
        if(n_errors == 0)
        {
            printTree(syntaxTree);
        }
    }
    
    printf("Number of warnings: %d\n", n_warnings);
    printf("Number of errors: %d\n", n_errors);
    
    return 0;
}

