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
#define YYLAST   784

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  58
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  51
/* YYNRULES -- Number of rules.  */
#define YYNRULES  167
/* YYNRULES -- Number of states.  */
#define YYNSTATES  266

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
      24,    28,    33,    37,    41,    43,    45,    49,    51,    55,
      59,    61,    66,    70,    73,    75,    77,    79,    86,    92,
      95,   100,   107,   111,   117,   119,   120,   124,   126,   130,
     132,   135,   138,   142,   144,   148,   150,   152,   156,   158,
     160,   162,   164,   166,   168,   170,   172,   175,   180,   187,
     192,   195,   202,   205,   207,   209,   214,   221,   224,   227,
     232,   235,   236,   239,   240,   247,   252,   259,   264,   271,
     276,   283,   287,   293,   297,   301,   307,   311,   314,   318,
     321,   325,   329,   333,   337,   341,   345,   349,   353,   357,
     361,   365,   369,   373,   377,   381,   384,   387,   390,   393,
     395,   399,   401,   405,   409,   411,   415,   418,   420,   423,
     427,   429,   433,   435,   437,   439,   441,   443,   445,   449,
     451,   453,   455,   459,   461,   465,   467,   469,   473,   475,
     479,   481,   483,   485,   488,   490,   493,   495,   497,   499,
     501,   503,   505,   510,   514,   516,   518,   521,   526,   529,
     531,   532,   536,   538,   542,   544,   546,   548
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      59,     0,    -1,    60,    -1,    60,    61,    -1,    61,    -1,
      62,    -1,    68,    -1,     1,    -1,    67,    64,    49,    -1,
       1,    64,    49,    -1,    67,     1,    49,    -1,    12,    67,
      64,    49,    -1,    67,    64,    49,    -1,    64,    55,    65,
      -1,    65,    -1,     1,    -1,    64,    55,     1,    -1,    66,
      -1,    66,    50,    89,    -1,     1,    50,    89,    -1,     7,
      -1,     7,    53,     4,    54,    -1,     7,    53,     1,    -1,
       1,    54,    -1,    13,    -1,    14,    -1,    15,    -1,    67,
       7,    51,    69,    52,    74,    -1,     7,    51,    69,    52,
      74,    -1,    67,     1,    -1,    67,     7,    51,     1,    -1,
      67,     7,    51,    69,    52,     1,    -1,     7,    51,     1,
      -1,     7,    51,    69,    52,     1,    -1,    70,    -1,    -1,
      70,    49,    71,    -1,    71,    -1,    70,    49,     1,    -1,
       1,    -1,    67,    72,    -1,    67,     1,    -1,    72,    55,
      73,    -1,    73,    -1,    72,    55,     1,    -1,     1,    -1,
       7,    -1,     7,    53,    54,    -1,    75,    -1,    76,    -1,
      77,    -1,    78,    -1,    86,    -1,    87,    -1,    81,    -1,
      83,    -1,     9,     1,    -1,     9,     1,    16,    75,    -1,
       9,     1,     8,    75,    16,    75,    -1,    10,     1,    36,
      75,    -1,    10,     1,    -1,    11,     7,    48,     1,    36,
      75,    -1,    11,     1,    -1,    82,    -1,    84,    -1,     9,
       1,     8,    74,    -1,     9,     1,     8,    75,    16,    76,
      -1,    88,    49,    -1,     1,    49,    -1,    56,    79,    80,
      57,    -1,    79,    63,    -1,    -1,    80,    74,    -1,    -1,
       9,    89,     8,    75,    16,    75,    -1,     9,    89,     8,
      74,    -1,     9,    89,     8,    75,    16,    76,    -1,    10,
      89,    36,    75,    -1,    11,     7,    48,    85,    36,    75,
      -1,    10,    89,    36,    76,    -1,    11,     7,    48,    85,
      36,    76,    -1,    89,    38,    89,    -1,    89,    38,    89,
      37,    89,    -1,    89,    38,     1,    -1,     1,    37,     1,
      -1,    89,    38,    89,    37,     1,    -1,    17,    88,    49,
      -1,    17,    49,    -1,    17,     1,    49,    -1,    18,    49,
      -1,   103,    48,    88,    -1,   103,    21,    88,    -1,   103,
      22,    88,    -1,   103,    24,    88,    -1,   103,    23,    88,
      -1,     1,    48,    88,    -1,     1,    21,    88,    -1,     1,
      22,    88,    -1,     1,    24,    88,    -1,     1,    23,    88,
      -1,   103,    48,     1,    -1,   103,    21,     1,    -1,   103,
      22,     1,    -1,   103,    24,     1,    -1,   103,    23,     1,
      -1,   103,    29,    -1,   103,    28,    -1,     1,    29,    -1,
       1,    28,    -1,    89,    -1,    89,    46,    90,    -1,    90,
      -1,    89,    46,     1,    -1,    90,    45,    91,    -1,    91,
      -1,    90,    45,     1,    -1,    47,    91,    -1,    92,    -1,
      47,     1,    -1,    94,    93,    94,    -1,    94,    -1,    94,
      93,     1,    -1,    25,    -1,    30,    -1,    31,    -1,    26,
      -1,    20,    -1,    27,    -1,    94,    95,    96,    -1,    96,
      -1,    32,    -1,    33,    -1,    96,    97,    98,    -1,    98,
      -1,    96,    97,     1,    -1,    34,    -1,    41,    -1,    98,
      99,   100,    -1,   100,    -1,    98,    99,     1,    -1,    42,
      -1,    35,    -1,    39,    -1,   101,   100,    -1,   102,    -1,
     101,     1,    -1,    41,    -1,    42,    -1,    40,    -1,   104,
      -1,   103,    -1,     7,    -1,     7,    53,    88,    54,    -1,
      51,    88,    52,    -1,   105,    -1,   108,    -1,    51,     1,
      -1,     7,    51,   106,    52,    -1,     1,    51,    -1,   107,
      -1,    -1,   107,    55,    88,    -1,    88,    -1,   107,    55,
       1,    -1,     4,    -1,     5,    -1,     6,    -1,     3,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    62,    62,    65,    66,    69,    70,    71,    76,    77,
      78,    81,    82,    85,    86,    87,    88,    91,    92,    93,
      96,    97,    98,    99,   102,   103,   104,   109,   110,   111,
     112,   113,   114,   115,   118,   119,   122,   123,   124,   125,
     128,   129,   132,   133,   134,   135,   138,   139,   144,   145,
     148,   149,   150,   151,   152,   153,   154,   155,   156,   157,
     158,   159,   160,   163,   164,   165,   166,   170,   171,   174,
     177,   178,   181,   182,   185,   188,   189,   192,   193,   196,
     197,   200,   201,   202,   203,   204,   207,   208,   209,   212,
     217,   218,   219,   220,   221,   222,   223,   224,   225,   226,
     227,   228,   229,   230,   231,   232,   233,   234,   235,   236,
     239,   240,   241,   244,   245,   246,   249,   250,   251,   254,
     255,   256,   259,   260,   261,   262,   263,   264,   267,   268,
     271,   272,   275,   276,   277,   280,   281,   284,   285,   286,
     289,   290,   291,   294,   295,   296,   299,   300,   301,   304,
     305,   308,   309,   312,   313,   314,   315,   318,   319,   322,
     323,   326,   327,   328,   331,   332,   333,   334
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
       0,    58,    59,    60,    60,    61,    61,    61,    62,    62,
      62,    63,    63,    64,    64,    64,    64,    65,    65,    65,
      66,    66,    66,    66,    67,    67,    67,    68,    68,    68,
      68,    68,    68,    68,    69,    69,    70,    70,    70,    70,
      71,    71,    72,    72,    72,    72,    73,    73,    74,    74,
      75,    75,    75,    75,    75,    75,    75,    75,    75,    75,
      75,    75,    75,    76,    76,    76,    76,    77,    77,    78,
      79,    79,    80,    80,    81,    82,    82,    83,    83,    84,
      84,    85,    85,    85,    85,    85,    86,    86,    86,    87,
      88,    88,    88,    88,    88,    88,    88,    88,    88,    88,
      88,    88,    88,    88,    88,    88,    88,    88,    88,    88,
      89,    89,    89,    90,    90,    90,    91,    91,    91,    92,
      92,    92,    93,    93,    93,    93,    93,    93,    94,    94,
      95,    95,    96,    96,    96,    97,    97,    98,    98,    98,
      99,    99,    99,   100,   100,   100,   101,   101,   101,   102,
     102,   103,   103,   104,   104,   104,   104,   105,   105,   106,
     106,   107,   107,   107,   108,   108,   108,   108
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     1,     3,     3,
       3,     4,     3,     3,     1,     1,     3,     1,     3,     3,
       1,     4,     3,     2,     1,     1,     1,     6,     5,     2,
       4,     6,     3,     5,     1,     0,     3,     1,     3,     1,
       2,     2,     3,     1,     3,     1,     1,     3,     1,     1,
       1,     1,     1,     1,     1,     1,     2,     4,     6,     4,
       2,     6,     2,     1,     1,     4,     6,     2,     2,     4,
       2,     0,     2,     0,     6,     4,     6,     4,     6,     4,
       6,     3,     5,     3,     3,     5,     3,     2,     3,     2,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     2,     2,     2,     2,     1,
       3,     1,     3,     3,     1,     3,     2,     1,     2,     3,
       1,     3,     1,     1,     1,     1,     1,     1,     3,     1,
       1,     1,     3,     1,     3,     1,     1,     3,     1,     3,
       1,     1,     1,     2,     1,     2,     1,     1,     1,     1,
       1,     1,     4,     3,     1,     1,     2,     4,     2,     1,
       0,     3,     1,     3,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,    24,    25,    26,     0,     0,     4,     5,
       0,     6,    15,    20,     0,    14,    17,     0,     1,     3,
      29,    20,     0,     0,    23,     0,     9,     0,     0,    32,
       0,     0,    34,    37,    10,     0,     8,     0,   167,   164,
     165,   166,   151,   148,   146,   147,     0,     0,    19,   111,
     114,   117,   120,   129,   133,   138,     0,   144,   150,   149,
     154,   155,    22,     0,    16,    13,    18,    41,    46,    40,
      43,     0,     0,    30,     0,   158,     0,     0,   118,   116,
     156,     0,   109,   150,     0,     0,   126,   122,   125,   127,
     123,   124,   130,   131,     0,     0,   135,   136,     0,   141,
     142,   140,     0,   145,   143,    21,     0,     0,    33,     0,
       0,     0,     0,     0,    71,    28,    48,    49,    50,    51,
      54,    63,    55,    64,    52,    53,     0,    38,    36,     0,
       0,   162,     0,   159,     0,     0,     0,     0,     0,   108,
     107,     0,   153,     0,     0,     0,     0,   106,   105,     0,
     112,   110,   115,   113,   121,   119,   128,   134,   132,   139,
     137,    47,    44,    42,    68,    56,     0,    60,     0,    62,
       0,     0,    87,     0,    89,    73,    67,    31,    27,   157,
       0,   152,    96,    97,    99,    98,    95,   101,    91,   102,
      92,   104,    94,   103,    93,   100,    90,     0,     0,     0,
       0,     0,     0,    88,    86,     0,    70,     0,     0,   163,
     161,     0,    65,    48,     0,     0,     0,    57,    75,    48,
      59,    77,    79,     0,     0,     0,     0,     0,    69,    72,
       0,    56,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    12,    58,    66,     0,     0,     0,     0,    74,    76,
      61,    84,    78,    80,    83,    81,    11,     0,     0,     0,
       0,     0,     0,     0,    85,    82
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     6,     7,     8,     9,   206,    14,    15,    16,    30,
      11,    31,    32,    33,    69,    70,   115,   116,   117,   118,
     119,   175,   208,   120,   121,   122,   123,   224,   124,   125,
     126,    82,    49,    50,    51,    94,    52,    95,    53,    98,
      54,   102,    55,    56,    57,    83,    59,    60,   132,   133,
      61
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -182
static const yytype_int16 yypact[] =
{
     198,    77,   -40,  -182,  -182,  -182,    47,   188,  -182,  -182,
      93,  -182,   104,    17,    46,  -182,     9,    14,  -182,  -182,
     120,   -11,    79,   371,  -182,   203,  -182,   139,   371,   170,
     146,    41,    54,  -182,  -182,    31,  -182,    65,  -182,  -182,
    -182,  -182,   110,  -182,  -182,  -182,   379,   387,    78,    94,
    -182,  -182,   738,    19,   103,  -182,   638,  -182,  -182,  -182,
    -182,  -182,  -182,    97,   104,  -182,    78,   116,   119,   121,
    -182,   126,   107,   170,   131,  -182,   314,   395,    65,  -182,
     689,   133,    78,   233,   403,   452,  -182,  -182,  -182,  -182,
    -182,  -182,  -182,  -182,   645,   687,  -182,  -182,   694,  -182,
    -182,  -182,   701,    65,  -182,  -182,   156,   155,   702,   460,
     468,   179,   322,   138,  -182,  -182,  -182,  -182,  -182,  -182,
    -182,  -182,  -182,  -182,  -182,  -182,   172,  -182,  -182,   224,
     689,  -182,   171,   177,   182,   395,   395,   395,   395,  -182,
    -182,   395,  -182,   476,   484,   533,   541,  -182,  -182,   549,
      65,    94,    65,  -182,    65,   164,    19,    65,   103,    65,
    -182,  -182,  -182,  -182,  -182,     5,     6,     0,   -24,  -182,
     190,   733,  -182,   191,  -182,   255,  -182,   702,  -182,  -182,
     557,  -182,  -182,  -182,  -182,  -182,  -182,   689,  -182,   689,
    -182,   689,  -182,   689,  -182,   689,  -182,   242,   296,   242,
     296,   242,   565,  -182,  -182,   259,  -182,   183,   108,   689,
    -182,   702,  -182,   228,   614,   468,   199,  -182,  -182,   234,
    -182,  -182,  -182,   -12,   222,    -3,   183,   160,  -182,  -182,
     242,    18,    22,    -5,   215,   242,   296,   275,   242,   622,
     165,  -182,  -182,  -182,   296,   296,   296,   565,  -182,  -182,
    -182,  -182,  -182,  -182,    65,    21,  -182,   261,   262,   243,
     630,   296,   296,   296,    65,    78
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -182,  -182,  -182,   278,  -182,  -182,    -9,   260,  -182,     3,
    -182,   251,  -182,   216,  -182,   184,  -123,  -181,   -78,  -182,
    -182,  -182,  -182,  -182,  -182,  -182,  -182,    43,  -182,  -182,
     -39,   -21,   208,   -37,  -182,  -182,   200,  -182,   201,  -182,
     197,  -182,   -52,  -182,  -182,   -23,  -182,  -182,  -182,  -182,
    -182
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -161
static const yytype_int16 yytable[] =
{
      58,    22,    48,    10,   104,    58,   178,    66,    81,    79,
      10,    17,   201,   197,   199,    29,   213,   217,   219,   220,
     221,   198,    84,    58,   236,   237,   244,     3,     4,     5,
     245,   246,    73,    58,   198,   239,   200,   131,   134,    75,
      35,    84,    25,    84,     3,     4,     5,    18,   153,   242,
     160,    75,    84,    96,   248,   250,    75,   252,   260,    28,
      97,    58,    58,   257,   258,   221,   -35,    84,    84,    75,
      25,    58,    58,   173,   212,    58,   218,    -7,    12,    58,
     242,   248,   252,   -35,    13,   229,    58,    58,   166,   168,
      -7,    -7,    -7,    71,    20,    26,   182,   183,   184,   185,
      21,    27,   186,    72,   188,   190,   192,   194,   127,   211,
     196,    38,    39,    40,    41,    42,    75,   109,   110,   111,
       3,     4,     5,   222,    84,   112,   113,   108,    36,    38,
      39,    40,    41,    42,    27,   109,   110,   111,    99,    85,
      64,   210,   100,   112,   113,   101,    13,    67,    43,    44,
      45,   105,   243,    68,    23,    46,   162,   249,    24,    47,
     253,    76,    68,    77,   114,   228,    43,    44,    45,    34,
      23,   -45,   106,    46,    24,   -15,   107,    47,   207,    58,
     169,   225,   114,   129,    12,   142,   170,   174,    -2,     1,
      13,    58,    58,   232,   233,     2,    92,    93,   227,     1,
     169,     3,     4,     5,    62,     2,   234,    63,   226,   241,
     161,     3,     4,     5,   256,    27,    58,   240,   255,   -39,
      27,   176,   -39,   179,    58,   177,   225,    38,    39,    40,
      41,    42,   180,   109,   110,   111,   181,    58,   202,   265,
     204,   112,   113,   211,   230,    38,    39,    40,    41,    42,
     235,   109,   110,   111,   143,   144,   145,   146,   238,   112,
     113,   147,   148,   247,    43,    44,    45,   205,     3,     4,
       5,    46,     3,     4,     5,    47,   251,   261,   262,   263,
     114,   149,    43,    44,    45,    19,    74,    65,   128,    46,
     259,   163,   151,    47,   155,   158,   156,   211,   114,    38,
      39,    40,    41,    42,     0,   214,   215,   216,     0,     0,
       0,     0,     0,   112,   113,   130,     0,    38,    39,    40,
      41,    42,     0,   171,     0,    38,    39,    40,    41,    42,
       0,     0,     0,     0,     0,     0,    43,    44,    45,     0,
       0,     0,     0,    46,     0,     0,     0,    47,     0,     0,
       0,     0,   114,     0,    43,    44,    45,     0,     0,     0,
       0,    46,    43,    44,    45,    47,  -160,     0,     0,    46,
       0,   172,    37,    47,    38,    39,    40,    41,    42,     0,
      78,     0,    38,    39,    40,    41,    42,     0,    80,     0,
      38,    39,    40,    41,    42,     0,   130,     0,    38,    39,
      40,    41,    42,     0,   150,     0,    38,    39,    40,    41,
      42,    43,    44,    45,     0,     0,     0,     0,    46,    43,
      44,    45,    47,     0,     0,     0,    46,    43,    44,    45,
      47,     0,     0,     0,    46,    43,    44,    45,    47,     0,
       0,     0,    46,    43,    44,    45,    47,     0,     0,     0,
      46,     0,     0,   152,    47,    38,    39,    40,    41,    42,
       0,   165,     0,    38,    39,    40,    41,    42,     0,   167,
       0,    38,    39,    40,    41,    42,     0,   187,     0,    38,
      39,    40,    41,    42,     0,   189,     0,    38,    39,    40,
      41,    42,    43,    44,    45,     0,     0,     0,     0,    46,
      43,    44,    45,    47,     0,     0,     0,    46,    43,    44,
      45,    47,     0,     0,     0,    46,    43,    44,    45,    47,
       0,     0,     0,    46,    43,    44,    45,    47,     0,     0,
       0,    46,     0,     0,   191,    47,    38,    39,    40,    41,
      42,     0,   193,     0,    38,    39,    40,    41,    42,     0,
     195,     0,    38,    39,    40,    41,    42,     0,   209,     0,
      38,    39,    40,    41,    42,     0,   223,     0,    38,    39,
      40,    41,    42,    43,    44,    45,     0,     0,     0,     0,
      46,    43,    44,    45,    47,     0,     0,     0,    46,    43,
      44,    45,    47,     0,     0,     0,    46,    43,    44,    45,
      47,     0,     0,     0,    46,    43,    44,    45,    47,     0,
       0,     0,    46,     0,     0,   231,    47,    38,    39,    40,
      41,    42,     0,   254,     0,    38,    39,    40,    41,    42,
       0,   264,     0,    38,    39,    40,    41,    42,     0,   103,
       0,    38,    39,    40,    41,    42,   154,     0,    38,    39,
      40,    41,    42,     0,    43,    44,    45,     0,     0,     0,
       0,    46,    43,    44,    45,    47,     0,     0,     0,    46,
      43,    44,    45,    47,     0,     0,     0,    46,    43,    44,
      45,    47,     0,     0,     0,    43,    44,    45,    37,    47,
      38,    39,    40,    41,    42,   157,    47,    38,    39,    40,
      41,    42,   159,     0,    38,    39,    40,    41,    42,     0,
     135,   136,   137,   138,     0,     0,     0,   139,   140,     0,
       0,     0,     0,   135,   136,   137,   138,    43,    44,    45,
     139,   140,     0,     0,    43,    44,    45,   141,    47,     0,
      75,    43,    44,    45,     0,    47,     0,     0,     0,     0,
     141,   164,    47,    75,   135,   136,   137,   138,    86,     0,
       0,   139,   140,    87,    88,    89,     0,     0,    90,    91,
      92,    93,     0,     0,     0,     0,     0,     0,     0,     0,
       0,   141,   203,     0,    75
};

static const yytype_int16 yycheck[] =
{
      23,    10,    23,     0,    56,    28,   129,    28,    47,    46,
       7,    51,    36,     8,     8,     1,   197,   198,   199,   200,
     201,    16,    46,    46,    36,    37,     8,    13,    14,    15,
       8,    36,     1,    56,    16,    38,    36,    76,    77,    51,
      51,    46,    53,    46,    13,    14,    15,     0,    85,   230,
     102,    51,    46,    34,   235,   236,    51,   238,    37,    50,
      41,    84,    85,   244,   245,   246,    52,    46,    46,    51,
      53,    94,    95,   112,   197,    98,   199,     0,     1,   102,
     261,   262,   263,    52,     7,   208,   109,   110,   109,   110,
      13,    14,    15,    52,     1,    49,   135,   136,   137,   138,
       7,    55,   141,    49,   143,   144,   145,   146,     1,     1,
     149,     3,     4,     5,     6,     7,    51,     9,    10,    11,
      13,    14,    15,   201,    46,    17,    18,     1,    49,     3,
       4,     5,     6,     7,    55,     9,    10,    11,    35,    45,
       1,   180,    39,    17,    18,    42,     7,     1,    40,    41,
      42,    54,   230,     7,    50,    47,     1,   235,    54,    51,
     238,    51,     7,    53,    56,    57,    40,    41,    42,    49,
      50,    55,    53,    47,    54,    55,    55,    51,   175,   202,
       1,   202,    56,    52,     1,    52,     7,    49,     0,     1,
       7,   214,   215,   214,   215,     7,    32,    33,   207,     1,
       1,    13,    14,    15,     1,     7,     7,     4,   205,    49,
      54,    13,    14,    15,    49,    55,   239,   226,   239,    49,
      55,    49,    52,    52,   247,     1,   247,     3,     4,     5,
       6,     7,    55,     9,    10,    11,    54,   260,    48,   260,
      49,    17,    18,     1,    16,     3,     4,     5,     6,     7,
      16,     9,    10,    11,    21,    22,    23,    24,    36,    17,
      18,    28,    29,    48,    40,    41,    42,    12,    13,    14,
      15,    47,    13,    14,    15,    51,     1,    16,    16,    36,
      56,    48,    40,    41,    42,     7,    35,    27,    72,    47,
     247,   107,    84,    51,    94,    98,    95,     1,    56,     3,
       4,     5,     6,     7,    -1,     9,    10,    11,    -1,    -1,
      -1,    -1,    -1,    17,    18,     1,    -1,     3,     4,     5,
       6,     7,    -1,     1,    -1,     3,     4,     5,     6,     7,
      -1,    -1,    -1,    -1,    -1,    -1,    40,    41,    42,    -1,
      -1,    -1,    -1,    47,    -1,    -1,    -1,    51,    -1,    -1,
      -1,    -1,    56,    -1,    40,    41,    42,    -1,    -1,    -1,
      -1,    47,    40,    41,    42,    51,    52,    -1,    -1,    47,
      -1,    49,     1,    51,     3,     4,     5,     6,     7,    -1,
       1,    -1,     3,     4,     5,     6,     7,    -1,     1,    -1,
       3,     4,     5,     6,     7,    -1,     1,    -1,     3,     4,
       5,     6,     7,    -1,     1,    -1,     3,     4,     5,     6,
       7,    40,    41,    42,    -1,    -1,    -1,    -1,    47,    40,
      41,    42,    51,    -1,    -1,    -1,    47,    40,    41,    42,
      51,    -1,    -1,    -1,    47,    40,    41,    42,    51,    -1,
      -1,    -1,    47,    40,    41,    42,    51,    -1,    -1,    -1,
      47,    -1,    -1,     1,    51,     3,     4,     5,     6,     7,
      -1,     1,    -1,     3,     4,     5,     6,     7,    -1,     1,
      -1,     3,     4,     5,     6,     7,    -1,     1,    -1,     3,
       4,     5,     6,     7,    -1,     1,    -1,     3,     4,     5,
       6,     7,    40,    41,    42,    -1,    -1,    -1,    -1,    47,
      40,    41,    42,    51,    -1,    -1,    -1,    47,    40,    41,
      42,    51,    -1,    -1,    -1,    47,    40,    41,    42,    51,
      -1,    -1,    -1,    47,    40,    41,    42,    51,    -1,    -1,
      -1,    47,    -1,    -1,     1,    51,     3,     4,     5,     6,
       7,    -1,     1,    -1,     3,     4,     5,     6,     7,    -1,
       1,    -1,     3,     4,     5,     6,     7,    -1,     1,    -1,
       3,     4,     5,     6,     7,    -1,     1,    -1,     3,     4,
       5,     6,     7,    40,    41,    42,    -1,    -1,    -1,    -1,
      47,    40,    41,    42,    51,    -1,    -1,    -1,    47,    40,
      41,    42,    51,    -1,    -1,    -1,    47,    40,    41,    42,
      51,    -1,    -1,    -1,    47,    40,    41,    42,    51,    -1,
      -1,    -1,    47,    -1,    -1,     1,    51,     3,     4,     5,
       6,     7,    -1,     1,    -1,     3,     4,     5,     6,     7,
      -1,     1,    -1,     3,     4,     5,     6,     7,    -1,     1,
      -1,     3,     4,     5,     6,     7,     1,    -1,     3,     4,
       5,     6,     7,    -1,    40,    41,    42,    -1,    -1,    -1,
      -1,    47,    40,    41,    42,    51,    -1,    -1,    -1,    47,
      40,    41,    42,    51,    -1,    -1,    -1,    47,    40,    41,
      42,    51,    -1,    -1,    -1,    40,    41,    42,     1,    51,
       3,     4,     5,     6,     7,     1,    51,     3,     4,     5,
       6,     7,     1,    -1,     3,     4,     5,     6,     7,    -1,
      21,    22,    23,    24,    -1,    -1,    -1,    28,    29,    -1,
      -1,    -1,    -1,    21,    22,    23,    24,    40,    41,    42,
      28,    29,    -1,    -1,    40,    41,    42,    48,    51,    -1,
      51,    40,    41,    42,    -1,    51,    -1,    -1,    -1,    -1,
      48,    49,    51,    51,    21,    22,    23,    24,    20,    -1,
      -1,    28,    29,    25,    26,    27,    -1,    -1,    30,    31,
      32,    33,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    48,    49,    -1,    51
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     1,     7,    13,    14,    15,    59,    60,    61,    62,
      67,    68,     1,     7,    64,    65,    66,    51,     0,    61,
       1,     7,    64,    50,    54,    53,    49,    55,    50,     1,
      67,    69,    70,    71,    49,    51,    49,     1,     3,     4,
       5,     6,     7,    40,    41,    42,    47,    51,    89,    90,
      91,    92,    94,    96,    98,   100,   101,   102,   103,   104,
     105,   108,     1,     4,     1,    65,    89,     1,     7,    72,
      73,    52,    49,     1,    69,    51,    51,    53,     1,    91,
       1,    88,    89,   103,    46,    45,    20,    25,    26,    27,
      30,    31,    32,    33,    93,    95,    34,    41,    97,    35,
      39,    42,    99,     1,   100,    54,    53,    55,     1,     9,
      10,    11,    17,    18,    56,    74,    75,    76,    77,    78,
      81,    82,    83,    84,    86,    87,    88,     1,    71,    52,
       1,    88,   106,   107,    88,    21,    22,    23,    24,    28,
      29,    48,    52,    21,    22,    23,    24,    28,    29,    48,
       1,    90,     1,    91,     1,    94,    96,     1,    98,     1,
     100,    54,     1,    73,    49,     1,    89,     1,    89,     1,
       7,     1,    49,    88,    49,    79,    49,     1,    74,    52,
      55,    54,    88,    88,    88,    88,    88,     1,    88,     1,
      88,     1,    88,     1,    88,     1,    88,     8,    16,     8,
      36,    36,    48,    49,    49,    12,    63,    67,    80,     1,
      88,     1,    74,    75,     9,    10,    11,    75,    74,    75,
      75,    75,    76,     1,    85,    89,    67,    64,    57,    74,
      16,     1,    89,    89,     7,    16,    36,    37,    36,    38,
      64,    49,    75,    76,     8,     8,    36,    48,    75,    76,
      75,     1,    75,    76,     1,    89,    49,    75,    75,    85,
      37,    16,    16,    36,     1,    89
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
    {(yyval.tree) = setType((yyvsp[(2) - (3)].tree), (yyvsp[(1) - (3)].type), false); yyerrok;;}
    break;

  case 9:
#line 77 "parser.y"
    {(yyval.tree) = NULL; yyerrok;;}
    break;

  case 10:
#line 78 "parser.y"
    {(yyval.tree) = NULL; yyerrok; yyerrok; ;}
    break;

  case 11:
#line 81 "parser.y"
    {(yyval.tree) = setType((yyvsp[(3) - (4)].tree), (yyvsp[(2) - (4)].type), true); yyerrok;;}
    break;

  case 12:
#line 82 "parser.y"
    {(yyval.tree) = setType((yyvsp[(2) - (3)].tree), (yyvsp[(1) - (3)].type), false); yyerrok;;}
    break;

  case 13:
#line 85 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); yyerrok; ;}
    break;

  case 14:
#line 86 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 15:
#line 87 "parser.y"
    {(yyval.tree) = NULL;;}
    break;

  case 16:
#line 88 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 17:
#line 91 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 18:
#line 92 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (3)].tree); addChild((yyval.tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 19:
#line 93 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 20:
#line 96 "parser.y"
    { (yyval.tree) = newDeclNode(VarK, UndefinedType, (yyvsp[(1) - (1)].tokenData)); (yyval.tree)->tmp = (yyvsp[(1) - (1)].tokenData)->idIndex; yyerrok;;}
    break;

  case 21:
#line 97 "parser.y"
    {(yyval.tree) = newDeclNode(VarK, UndefinedType, (yyvsp[(1) - (4)].tokenData)); (yyval.tree)->isArray = true; (yyval.tree)->aSize = (yyvsp[(3) - (4)].tokenData)->nvalue; (yyval.tree)->tmp = (yyvsp[(1) - (4)].tokenData)->idIndex;;}
    break;

  case 22:
#line 98 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 23:
#line 99 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 24:
#line 102 "parser.y"
    {(yyval.type) = Integer;;}
    break;

  case 25:
#line 103 "parser.y"
    {(yyval.type) = Boolean;;}
    break;

  case 26:
#line 104 "parser.y"
    {(yyval.type) = Char;;}
    break;

  case 27:
#line 109 "parser.y"
    {(yyval.tree) = newDeclNode(FuncK, (yyvsp[(1) - (6)].type), (yyvsp[(2) - (6)].tokenData), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); (yyval.tree)->tmp = (yyvsp[(2) - (6)].tokenData)->idIndex;;}
    break;

  case 28:
#line 110 "parser.y"
    {(yyval.tree) = newDeclNode(FuncK, Void, (yyvsp[(1) - (5)].tokenData), (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree)); (yyval.tree)->tmp = (yyvsp[(1) - (5)].tokenData)->idIndex;;}
    break;

  case 29:
#line 111 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 30:
#line 112 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 31:
#line 113 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 32:
#line 114 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 33:
#line 115 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 34:
#line 118 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 35:
#line 119 "parser.y"
    {(yyval.tree) = NULL;;}
    break;

  case 36:
#line 122 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 37:
#line 123 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 38:
#line 124 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 39:
#line 125 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 40:
#line 128 "parser.y"
    {(yyval.tree) = setType((yyvsp[(2) - (2)].tree), (yyvsp[(1) - (2)].type), false);;}
    break;

  case 41:
#line 129 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 42:
#line 132 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); yyerrok;;}
    break;

  case 43:
#line 133 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 44:
#line 134 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 45:
#line 135 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 46:
#line 138 "parser.y"
    {(yyval.tree) = newDeclNode(ParamK, UndefinedType, (yyvsp[(1) - (1)].tokenData));(yyval.tree)->tmp = (yyvsp[(1) - (1)].tokenData)->svalue;;}
    break;

  case 47:
#line 139 "parser.y"
    {(yyval.tree) = newDeclNode(ParamK, UndefinedType, (yyvsp[(1) - (3)].tokenData));(yyval.tree)->isArray = true;(yyval.tree)->tmp = (yyvsp[(1) - (3)].tokenData)->svalue;;}
    break;

  case 48:
#line 144 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 49:
#line 145 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 50:
#line 148 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
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
#line 151 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 54:
#line 152 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 55:
#line 153 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 56:
#line 154 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 57:
#line 155 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 58:
#line 156 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 59:
#line 157 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 60:
#line 158 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 61:
#line 159 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 62:
#line 160 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 63:
#line 163 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 64:
#line 164 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 65:
#line 165 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 66:
#line 166 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 67:
#line 170 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (2)].tree); ;}
    break;

  case 68:
#line 171 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 69:
#line 174 "parser.y"
    {(yyval.tree) = newStmtNode(CompoundK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(3) - (4)].tree)); yyerrok;;}
    break;

  case 70:
#line 177 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree));;}
    break;

  case 71:
#line 178 "parser.y"
    {(yyval.tree) = NULL;;}
    break;

  case 72:
#line 181 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree));;}
    break;

  case 73:
#line 182 "parser.y"
    {(yyval.tree) = NULL; ;}
    break;

  case 74:
#line 185 "parser.y"
    {(yyval.tree) = newStmtNode(IfK, (yyvsp[(1) - (6)].tokenData), (yyvsp[(2) - (6)].tree), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); ;}
    break;

  case 75:
#line 188 "parser.y"
    {(yyval.tree) = newStmtNode(IfK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree));;}
    break;

  case 76:
#line 189 "parser.y"
    {(yyval.tree) = newStmtNode(IfK, (yyvsp[(1) - (6)].tokenData), (yyvsp[(2) - (6)].tree), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree));;}
    break;

  case 77:
#line 192 "parser.y"
    {(yyval.tree) = newStmtNode(WhileK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree));;}
    break;

  case 78:
#line 193 "parser.y"
    {(yyval.tree) = newStmtNode(ForK, (yyvsp[(1) - (6)].tokenData), newDeclNode(VarK, Integer, (yyvsp[(2) - (6)].tokenData)), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); (yyval.tree)->tmp = (yyvsp[(2) - (6)].tokenData)->idIndex;;}
    break;

  case 79:
#line 196 "parser.y"
    {(yyval.tree) = newStmtNode(WhileK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree));;}
    break;

  case 80:
#line 197 "parser.y"
    {(yyval.tree) = newStmtNode(ForK, (yyvsp[(1) - (6)].tokenData), newDeclNode(VarK, Integer, (yyvsp[(2) - (6)].tokenData)), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); (yyval.tree)->tmp = (yyvsp[(2) - (6)].tokenData)->idIndex;;}
    break;

  case 81:
#line 200 "parser.y"
    {(yyval.tree) = newStmtNode(RangeK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 82:
#line 201 "parser.y"
    {(yyval.tree) = newStmtNode(RangeK, (yyvsp[(2) - (5)].tokenData), (yyvsp[(1) - (5)].tree), (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree)); (yyval.tree)->tmp = (yyvsp[(2) - (5)].tokenData)->idIndex;;}
    break;

  case 83:
#line 202 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 84:
#line 203 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 85:
#line 204 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 86:
#line 207 "parser.y"
    {(yyval.tree) = newStmtNode(ReturnK, (yyvsp[(1) - (3)].tokenData), (yyvsp[(2) - (3)].tree)); yyerrok;;}
    break;

  case 87:
#line 208 "parser.y"
    {(yyval.tree) = newStmtNode(ReturnK, (yyvsp[(1) - (2)].tokenData)); ;}
    break;

  case 88:
#line 209 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 89:
#line 212 "parser.y"
    {(yyval.tree) = newStmtNode(BreakK, (yyvsp[(1) - (2)].tokenData));;}
    break;

  case 90:
#line 217 "parser.y"
    {(yyval.tree) = newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); (yyval.tree)->expType = (yyvsp[(1) - (3)].tree)->expType;;}
    break;

  case 91:
#line 218 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 92:
#line 219 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 93:
#line 220 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 94:
#line 221 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 95:
#line 222 "parser.y"
    { (yyval.tree)=NULL; yyerrok;;}
    break;

  case 96:
#line 223 "parser.y"
    { (yyval.tree)=NULL; yyerrok;;}
    break;

  case 97:
#line 224 "parser.y"
    { (yyval.tree)=NULL; yyerrok;;}
    break;

  case 98:
#line 225 "parser.y"
    { (yyval.tree)=NULL; yyerrok;;}
    break;

  case 99:
#line 226 "parser.y"
    { (yyval.tree)=NULL; yyerrok;;}
    break;

  case 100:
#line 227 "parser.y"
    { (yyval.tree)=NULL;;}
    break;

  case 101:
#line 228 "parser.y"
    { (yyval.tree)=NULL;;}
    break;

  case 102:
#line 229 "parser.y"
    { (yyval.tree)=NULL;;}
    break;

  case 103:
#line 230 "parser.y"
    { (yyval.tree)=NULL;;}
    break;

  case 104:
#line 231 "parser.y"
    { (yyval.tree)=NULL;;}
    break;

  case 105:
#line 232 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].tree)), Integer, false); yyerrok;;}
    break;

  case 106:
#line 233 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].tree)), Integer, false); yyerrok;;}
    break;

  case 107:
#line 234 "parser.y"
    { (yyval.tree)=NULL; yyerrok; ;}
    break;

  case 108:
#line 235 "parser.y"
    { (yyval.tree)=NULL; yyerrok; ;}
    break;

  case 109:
#line 236 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 110:
#line 239 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Boolean, false);;}
    break;

  case 111:
#line 240 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 112:
#line 241 "parser.y"
    { (yyval.tree)=NULL; ;}
    break;

  case 113:
#line 244 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Boolean, false);;}
    break;

  case 114:
#line 245 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 115:
#line 246 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 116:
#line 249 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (2)].tokenData), (yyvsp[(2) - (2)].tree)), Boolean, false);;}
    break;

  case 117:
#line 250 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 118:
#line 251 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 119:
#line 254 "parser.y"
    {(yyval.tree) = (yyvsp[(2) - (3)].tree); addChild((yyval.tree), (yyvsp[(1) - (3)].tree)); addChild((yyval.tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 120:
#line 255 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 121:
#line 256 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 122:
#line 259 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 123:
#line 260 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 124:
#line 261 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 125:
#line 262 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 126:
#line 263 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 127:
#line 264 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 128:
#line 267 "parser.y"
    {(yyval.tree) = (yyvsp[(2) - (3)].tree);addChild((yyval.tree), (yyvsp[(1) - (3)].tree));addChild((yyval.tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 129:
#line 268 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 130:
#line 271 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 131:
#line 272 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 132:
#line 275 "parser.y"
    {(yyval.tree) = (yyvsp[(2) - (3)].tree); addChild((yyval.tree), (yyvsp[(1) - (3)].tree)); addChild((yyval.tree), (yyvsp[(3) - (3)].tree));;}
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
#line 291 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 143:
#line 294 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (2)].tree); addChild((yyval.tree), (yyvsp[(2) - (2)].tree));;}
    break;

  case 144:
#line 295 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 145:
#line 296 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 146:
#line 299 "parser.y"
    {(yyvsp[(1) - (1)].tokenData)->tokenclass=CHSIGN; (yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 147:
#line 300 "parser.y"
    {(yyvsp[(1) - (1)].tokenData)->tokenclass=SIZEOF; (yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 148:
#line 301 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 149:
#line 304 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 150:
#line 305 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 151:
#line 308 "parser.y"
    {(yyval.tree) = newExpNode(IdK, (yyvsp[(1) - (1)].tokenData)); (yyval.tree)->name = (yyvsp[(1) - (1)].tokenData)->idIndex;;}
    break;

  case 152:
#line 309 "parser.y"
    {(yyval.tree) = newExpNode(OpK, (yyvsp[(2) - (4)].tokenData), newExpNode(IdK, (yyvsp[(1) - (4)].tokenData)), (yyvsp[(3) - (4)].tree)); (yyval.tree)->child[0]->name = (yyvsp[(1) - (4)].tokenData)->idIndex;;}
    break;

  case 153:
#line 312 "parser.y"
    {(yyval.tree) = (yyvsp[(2) - (3)].tree); yyerrok;;}
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
#line 315 "parser.y"
    {(yyval.tree) = NULL; ;}
    break;

  case 157:
#line 318 "parser.y"
    {(yyval.tree) = newExpNode(CallK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(3) - (4)].tree));(yyval.tree)->name = (yyvsp[(1) - (4)].tokenData)->idIndex;;}
    break;

  case 158:
#line 319 "parser.y"
    {(yyval.tree) = NULL; yyerrok;;}
    break;

  case 159:
#line 322 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 160:
#line 323 "parser.y"
    {(yyval.tree) = NULL;;}
    break;

  case 161:
#line 326 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); yyerrok;;}
    break;

  case 162:
#line 327 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 163:
#line 328 "parser.y"
    { (yyval.tree)=NULL; ;}
    break;

  case 164:
#line 331 "parser.y"
    {(yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));(yyval.tree)->expType = Integer; (yyval.tree)->value = (yyvsp[(1) - (1)].tokenData)->nvalue;;}
    break;

  case 165:
#line 332 "parser.y"
    {(yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));(yyval.tree)->expType = Char;(yyval.tree)->cvalue = (yyvsp[(1) - (1)].tokenData)->cvalue;;}
    break;

  case 166:
#line 333 "parser.y"
    {(yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));(yyval.tree)->expType = Char;(yyval.tree)->string = (yyvsp[(1) - (1)].tokenData)->svalue;(yyval.tree)->isArray = true;;}
    break;

  case 167:
#line 334 "parser.y"
    {(yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));(yyval.tree)->expType = Boolean;(yyval.tree)->value = (yyvsp[(1) - (1)].tokenData)->nvalue;;}
    break;


/* Line 1267 of yacc.c.  */
#line 2694 "parser.tab.c"
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


#line 337 "parser.y"


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
        
        if(n_errors == 0)
        {
            symanticA(syntaxTree, table);
            
            if(n_errors == 0)
            {
                printTree(syntaxTree);
            }
        }
    }
    
    printf("Number of warnings: %d\n", n_warnings);
    printf("Number of errors: %d\n", n_errors);
    
    return 0;
}

