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
#include "emitcode.hpp"


extern int yylex();
extern FILE *yyin;
extern int yydebug;
extern int line;
extern TreeNode *currentfunction;
FILE * code;
void yyerror(const char *);

// ----- VARIABLES -----
extern int  opterr;
extern int  optind;
extern char *optarg;
extern int n_errors;
extern int n_warnings;
extern int goffset;
extern int foffset;
int toffset;
int entry;
int parmc;
int pos1, pos2;
int toffset_old;
bool inaFunction;
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
#line 52 "parser.y"
{
    ExpType type;            // for passing types.  typespec to pass up a type in decl like int or bool
    TokenData *tokenData;    // for terminals.  token data comes from yylex() in the $ variables
    TreeNode *tree;          // for nonterminals.   these tree nodes as you build the tree
}
/* Line 193 of yacc.c.  */
#line 265 "parser.tab.c"
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
#line 290 "parser.tab.c"

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
#define YYLAST   741

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  58
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  51
/* YYNRULES -- Number of rules.  */
#define YYNRULES  166
/* YYNRULES -- Number of states.  */
#define YYNSTATES  265

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
      95,   100,   104,   110,   112,   113,   117,   119,   123,   125,
     128,   131,   135,   137,   141,   143,   145,   149,   151,   153,
     155,   157,   159,   161,   163,   165,   168,   173,   180,   185,
     188,   195,   198,   200,   202,   207,   214,   217,   220,   225,
     228,   229,   232,   233,   240,   245,   252,   257,   264,   269,
     276,   280,   286,   290,   294,   300,   304,   307,   311,   314,
     318,   322,   326,   330,   334,   338,   342,   346,   350,   354,
     358,   362,   366,   370,   374,   377,   380,   383,   386,   388,
     392,   394,   398,   402,   404,   408,   411,   413,   416,   420,
     422,   426,   428,   430,   432,   434,   436,   438,   442,   444,
     446,   448,   452,   454,   458,   460,   462,   466,   468,   472,
     474,   476,   478,   481,   483,   486,   488,   490,   492,   494,
     496,   498,   503,   507,   509,   511,   514,   519,   522,   524,
     525,   529,   531,   535,   537,   539,   541
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
       7,    51,     1,    -1,     7,    51,    69,    52,     1,    -1,
      70,    -1,    -1,    70,    49,    71,    -1,    71,    -1,    70,
      49,     1,    -1,     1,    -1,    67,    72,    -1,    67,     1,
      -1,    72,    55,    73,    -1,    73,    -1,    72,    55,     1,
      -1,     1,    -1,     7,    -1,     7,    53,    54,    -1,    75,
      -1,    76,    -1,    77,    -1,    78,    -1,    86,    -1,    87,
      -1,    81,    -1,    83,    -1,     9,     1,    -1,     9,     1,
      16,    75,    -1,     9,     1,     8,    75,    16,    75,    -1,
      10,     1,    36,    75,    -1,    10,     1,    -1,    11,     7,
      48,     1,    36,    75,    -1,    11,     1,    -1,    82,    -1,
      84,    -1,     9,     1,     8,    74,    -1,     9,     1,     8,
      75,    16,    76,    -1,    88,    49,    -1,     1,    49,    -1,
      56,    79,    80,    57,    -1,    79,    63,    -1,    -1,    80,
      74,    -1,    -1,     9,    89,     8,    75,    16,    75,    -1,
       9,    89,     8,    74,    -1,     9,    89,     8,    75,    16,
      76,    -1,    10,    89,    36,    75,    -1,    11,     7,    48,
      85,    36,    75,    -1,    10,    89,    36,    76,    -1,    11,
       7,    48,    85,    36,    76,    -1,    89,    38,    89,    -1,
      89,    38,    89,    37,    89,    -1,    89,    38,     1,    -1,
       1,    37,     1,    -1,    89,    38,    89,    37,     1,    -1,
      17,    88,    49,    -1,    17,    49,    -1,    17,     1,    49,
      -1,    18,    49,    -1,   103,    48,    88,    -1,   103,    21,
      88,    -1,   103,    22,    88,    -1,   103,    24,    88,    -1,
     103,    23,    88,    -1,     1,    48,    88,    -1,     1,    21,
      88,    -1,     1,    22,    88,    -1,     1,    24,    88,    -1,
       1,    23,    88,    -1,   103,    48,     1,    -1,   103,    21,
       1,    -1,   103,    22,     1,    -1,   103,    24,     1,    -1,
     103,    23,     1,    -1,   103,    29,    -1,   103,    28,    -1,
       1,    29,    -1,     1,    28,    -1,    89,    -1,    89,    46,
      90,    -1,    90,    -1,    89,    46,     1,    -1,    90,    45,
      91,    -1,    91,    -1,    90,    45,     1,    -1,    47,    91,
      -1,    92,    -1,    47,     1,    -1,    94,    93,    94,    -1,
      94,    -1,    94,    93,     1,    -1,    25,    -1,    30,    -1,
      31,    -1,    26,    -1,    20,    -1,    27,    -1,    94,    95,
      96,    -1,    96,    -1,    32,    -1,    33,    -1,    96,    97,
      98,    -1,    98,    -1,    96,    97,     1,    -1,    34,    -1,
      41,    -1,    98,    99,   100,    -1,   100,    -1,    98,    99,
       1,    -1,    42,    -1,    35,    -1,    39,    -1,   101,   100,
      -1,   102,    -1,   101,     1,    -1,    41,    -1,    42,    -1,
      40,    -1,   104,    -1,   103,    -1,     7,    -1,     7,    53,
      88,    54,    -1,    51,    88,    52,    -1,   105,    -1,   108,
      -1,    51,     1,    -1,     7,    51,   106,    52,    -1,     1,
      51,    -1,   107,    -1,    -1,   107,    55,    88,    -1,    88,
      -1,   107,    55,     1,    -1,     4,    -1,     5,    -1,     6,
      -1,     3,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    78,    78,    81,    82,    85,    86,    87,    92,    93,
      94,    97,    98,   101,   102,   103,   104,   107,   108,   109,
     112,   113,   114,   115,   118,   119,   120,   125,   126,   127,
     128,   130,   131,   134,   135,   138,   139,   140,   141,   144,
     145,   148,   149,   150,   151,   154,   155,   160,   161,   164,
     165,   166,   167,   168,   169,   170,   171,   172,   173,   174,
     175,   176,   179,   180,   181,   182,   186,   187,   190,   193,
     194,   197,   198,   201,   204,   205,   208,   209,   212,   213,
     216,   217,   218,   219,   220,   223,   224,   225,   228,   233,
     234,   235,   236,   237,   238,   239,   240,   241,   242,   243,
     244,   245,   246,   247,   248,   249,   250,   251,   252,   255,
     256,   257,   260,   261,   262,   265,   266,   267,   270,   271,
     272,   275,   276,   277,   278,   279,   280,   283,   284,   287,
     288,   291,   292,   293,   296,   297,   300,   301,   302,   305,
     306,   307,   310,   311,   312,   315,   316,   317,   320,   321,
     324,   325,   328,   329,   330,   331,   334,   335,   338,   339,
     342,   343,   344,   347,   348,   349,   350
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
      68,    68,    68,    69,    69,    70,    70,    70,    70,    71,
      71,    72,    72,    72,    72,    73,    73,    74,    74,    75,
      75,    75,    75,    75,    75,    75,    75,    75,    75,    75,
      75,    75,    76,    76,    76,    76,    77,    77,    78,    79,
      79,    80,    80,    81,    82,    82,    83,    83,    84,    84,
      85,    85,    85,    85,    85,    86,    86,    86,    87,    88,
      88,    88,    88,    88,    88,    88,    88,    88,    88,    88,
      88,    88,    88,    88,    88,    88,    88,    88,    88,    89,
      89,    89,    90,    90,    90,    91,    91,    91,    92,    92,
      92,    93,    93,    93,    93,    93,    93,    94,    94,    95,
      95,    96,    96,    96,    97,    97,    98,    98,    98,    99,
      99,    99,   100,   100,   100,   101,   101,   101,   102,   102,
     103,   103,   104,   104,   104,   104,   105,   105,   106,   106,
     107,   107,   107,   108,   108,   108,   108
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     1,     3,     3,
       3,     4,     3,     3,     1,     1,     3,     1,     3,     3,
       1,     4,     3,     2,     1,     1,     1,     6,     5,     2,
       4,     3,     5,     1,     0,     3,     1,     3,     1,     2,
       2,     3,     1,     3,     1,     1,     3,     1,     1,     1,
       1,     1,     1,     1,     1,     2,     4,     6,     4,     2,
       6,     2,     1,     1,     4,     6,     2,     2,     4,     2,
       0,     2,     0,     6,     4,     6,     4,     6,     4,     6,
       3,     5,     3,     3,     5,     3,     2,     3,     2,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     2,     2,     2,     2,     1,     3,
       1,     3,     3,     1,     3,     2,     1,     2,     3,     1,
       3,     1,     1,     1,     1,     1,     1,     3,     1,     1,
       1,     3,     1,     3,     1,     1,     3,     1,     3,     1,
       1,     1,     2,     1,     2,     1,     1,     1,     1,     1,
       1,     4,     3,     1,     1,     2,     4,     2,     1,     0,
       3,     1,     3,     1,     1,     1,     1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,    24,    25,    26,     0,     0,     4,     5,
       0,     6,    15,    20,     0,    14,    17,     0,     1,     3,
      29,    20,     0,     0,    23,     0,     9,     0,     0,    31,
       0,     0,    33,    36,    10,     0,     8,     0,   166,   163,
     164,   165,   150,   147,   145,   146,     0,     0,    19,   110,
     113,   116,   119,   128,   132,   137,     0,   143,   149,   148,
     153,   154,    22,     0,    16,    13,    18,    40,    45,    39,
      42,     0,     0,    30,     0,   157,     0,     0,   117,   115,
     155,     0,   108,   149,     0,     0,   125,   121,   124,   126,
     122,   123,   129,   130,     0,     0,   134,   135,     0,   140,
     141,   139,     0,   144,   142,    21,     0,     0,    32,     0,
       0,     0,     0,     0,    70,    28,    47,    48,    49,    50,
      53,    62,    54,    63,    51,    52,     0,    37,    35,     0,
       0,   161,     0,   158,     0,     0,     0,     0,     0,   107,
     106,     0,   152,     0,     0,     0,     0,   105,   104,     0,
     111,   109,   114,   112,   120,   118,   127,   133,   131,   138,
     136,    46,    43,    41,    67,    55,     0,    59,     0,    61,
       0,     0,    86,     0,    88,    72,    66,     0,    27,   156,
       0,   151,    95,    96,    98,    97,    94,   100,    90,   101,
      91,   103,    93,   102,    92,    99,    89,     0,     0,     0,
       0,     0,     0,    87,    85,     0,    69,     0,     0,   162,
     160,    64,    47,     0,     0,     0,    56,    74,    47,    58,
      76,    78,     0,     0,     0,     0,     0,    68,    71,     0,
      55,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      12,    57,    65,     0,     0,     0,     0,    73,    75,    60,
      83,    77,    79,    82,    80,    11,     0,     0,     0,     0,
       0,     0,     0,    84,    81
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     6,     7,     8,     9,   206,    14,    15,    16,    30,
      11,    31,    32,    33,    69,    70,   115,   116,   117,   118,
     119,   175,   208,   120,   121,   122,   123,   223,   124,   125,
     126,    82,    49,    50,    51,    94,    52,    95,    53,    98,
      54,   102,    55,    56,    57,    83,    59,    60,   132,   133,
      61
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -181
static const yytype_int16 yypact[] =
{
     156,    77,   -40,  -181,  -181,  -181,    47,   138,  -181,  -181,
      35,  -181,    92,    48,    73,  -181,    97,    14,  -181,  -181,
     134,    17,    85,   315,  -181,   120,  -181,   153,   315,   109,
     206,     4,     9,  -181,  -181,    31,  -181,   105,  -181,  -181,
    -181,  -181,   202,  -181,  -181,  -181,   323,   372,   139,   127,
    -181,  -181,   179,    19,    81,  -181,   623,  -181,  -181,  -181,
    -181,  -181,  -181,   133,    92,  -181,   139,   145,   150,   167,
    -181,   126,   161,   109,   183,  -181,   295,   380,   105,  -181,
     690,   187,   139,   173,   388,   396,  -181,  -181,  -181,  -181,
    -181,  -181,  -181,  -181,   630,   637,  -181,  -181,   644,  -181,
    -181,  -181,   686,   105,  -181,  -181,   203,   213,   310,   404,
     453,   230,   303,   212,  -181,  -181,  -181,  -181,  -181,  -181,
    -181,  -181,  -181,  -181,  -181,  -181,   226,  -181,  -181,   223,
     690,  -181,   224,   222,   231,   380,   380,   380,   380,  -181,
    -181,   380,  -181,   461,   469,   477,   485,  -181,  -181,   534,
     105,   127,   105,  -181,   105,   186,    19,   105,    81,   105,
    -181,  -181,  -181,  -181,  -181,     8,     5,   -11,   -24,  -181,
     232,   681,  -181,   229,  -181,   254,  -181,   310,  -181,  -181,
     542,  -181,  -181,  -181,  -181,  -181,  -181,   690,  -181,   690,
    -181,   690,  -181,   690,  -181,   690,  -181,   223,   241,   223,
     241,   223,   550,  -181,  -181,   258,  -181,   242,   108,   690,
    -181,  -181,   268,   558,   453,   253,  -181,  -181,   270,  -181,
    -181,  -181,    57,   251,    -3,   242,   131,  -181,  -181,   223,
      18,     6,    -5,   243,   223,   241,   288,   223,   566,   207,
    -181,  -181,  -181,   241,   241,   241,   550,  -181,  -181,  -181,
    -181,  -181,  -181,   105,    -7,  -181,   274,   277,   259,   615,
     241,   241,   241,   105,   139
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -181,  -181,  -181,   287,  -181,  -181,    -9,   276,  -181,     3,
    -181,   278,  -181,   233,  -181,   204,  -123,  -180,  -134,  -181,
    -181,  -181,  -181,  -181,  -181,  -181,  -181,    66,  -181,  -181,
     -39,   -21,   239,   -37,  -181,  -181,   220,  -181,   245,  -181,
     217,  -181,   -52,  -181,  -181,   -23,  -181,  -181,  -181,  -181,
    -181
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -160
static const yytype_int16 yytable[] =
{
      58,    22,    48,    10,   104,    58,   178,    66,    81,    79,
      10,    17,   201,   199,   244,    29,   197,   212,   216,   218,
     219,   220,    84,    58,   198,   200,   243,     3,     4,     5,
     259,   245,    73,    58,   198,   238,    20,   131,   134,    84,
      75,    84,    21,    84,     3,     4,     5,    18,   153,   241,
     160,    84,    84,    96,   247,   249,    71,   251,    72,    75,
      97,    58,    58,   256,   257,   220,   -34,   221,    35,    75,
      25,    58,    58,   173,   211,    58,   217,    -7,    12,    58,
     241,   247,   251,   -34,    13,   228,    58,    58,   166,   168,
      -7,    -7,    -7,   235,   236,   242,   182,   183,   184,   185,
     248,    25,   186,   252,   188,   190,   192,   194,    75,   177,
     196,    38,    39,    40,    41,    42,    99,   109,   110,   111,
     100,    62,    26,   101,    63,   112,   113,   108,    27,    38,
      39,    40,    41,    42,    36,   109,   110,   111,    -2,     1,
      27,   210,    23,   112,   113,     2,    24,    28,    43,    44,
      45,     3,     4,     5,    64,    46,    75,     1,   -38,    47,
      13,   -38,   127,     2,   114,   227,    43,    44,    45,     3,
       4,     5,    85,    46,     3,     4,     5,    47,   207,    58,
     240,   224,   114,    34,    23,    84,    27,   105,    24,   -15,
      58,    58,   231,   232,   143,   144,   145,   146,   226,    86,
     -44,   147,   148,   106,    87,    88,    89,    67,   225,    90,
      91,    92,    93,    68,   162,    58,   239,   254,    92,    93,
      68,   149,   107,    58,   177,   224,    38,    39,    40,    41,
      42,   169,   109,   110,   111,   129,    58,   170,   264,   142,
     112,   113,   177,    12,    38,    39,    40,    41,    42,    13,
     213,   214,   215,    76,   169,    77,   255,   161,   112,   113,
     233,   174,    27,    43,    44,    45,   205,     3,     4,     5,
      46,     3,     4,     5,    47,   176,   179,   180,   204,   114,
     202,    43,    44,    45,   229,   181,   234,   237,    46,   250,
     260,   246,    47,   261,    19,   262,   130,   114,    38,    39,
      40,    41,    42,    65,   171,   128,    38,    39,    40,    41,
      42,   163,   258,    74,   155,   158,    37,     0,    38,    39,
      40,    41,    42,   151,    78,     0,    38,    39,    40,    41,
      42,   135,   136,   137,   138,    43,    44,    45,   139,   140,
     156,     0,    46,    43,    44,    45,    47,  -159,     0,     0,
      46,     0,   172,     0,    47,    43,    44,    45,   141,   164,
       0,    75,    46,    43,    44,    45,    47,     0,     0,     0,
      46,     0,     0,    80,    47,    38,    39,    40,    41,    42,
       0,   130,     0,    38,    39,    40,    41,    42,     0,   150,
       0,    38,    39,    40,    41,    42,     0,   152,     0,    38,
      39,    40,    41,    42,     0,   165,     0,    38,    39,    40,
      41,    42,    43,    44,    45,     0,     0,     0,     0,    46,
      43,    44,    45,    47,     0,     0,     0,    46,    43,    44,
      45,    47,     0,     0,     0,    46,    43,    44,    45,    47,
       0,     0,     0,    46,    43,    44,    45,    47,     0,     0,
       0,    46,     0,     0,   167,    47,    38,    39,    40,    41,
      42,     0,   187,     0,    38,    39,    40,    41,    42,     0,
     189,     0,    38,    39,    40,    41,    42,     0,   191,     0,
      38,    39,    40,    41,    42,     0,   193,     0,    38,    39,
      40,    41,    42,    43,    44,    45,     0,     0,     0,     0,
      46,    43,    44,    45,    47,     0,     0,     0,    46,    43,
      44,    45,    47,     0,     0,     0,    46,    43,    44,    45,
      47,     0,     0,     0,    46,    43,    44,    45,    47,     0,
       0,     0,    46,     0,     0,   195,    47,    38,    39,    40,
      41,    42,     0,   209,     0,    38,    39,    40,    41,    42,
       0,   222,     0,    38,    39,    40,    41,    42,     0,   230,
       0,    38,    39,    40,    41,    42,     0,   253,     0,    38,
      39,    40,    41,    42,    43,    44,    45,     0,     0,     0,
       0,    46,    43,    44,    45,    47,     0,     0,     0,    46,
      43,    44,    45,    47,     0,     0,     0,    46,    43,    44,
      45,    47,     0,     0,     0,    46,    43,    44,    45,    47,
       0,     0,     0,    46,     0,     0,   263,    47,    38,    39,
      40,    41,    42,     0,   103,     0,    38,    39,    40,    41,
      42,   154,     0,    38,    39,    40,    41,    42,    37,     0,
      38,    39,    40,    41,    42,   157,     0,    38,    39,    40,
      41,    42,     0,     0,     0,    43,    44,    45,     0,     0,
       0,     0,    46,    43,    44,    45,    47,     0,     0,     0,
      43,    44,    45,     0,    47,     0,     0,    43,    44,    45,
       0,    47,     0,     0,    43,    44,    45,   159,    47,    38,
      39,    40,    41,    42,     0,    47,     0,     0,     0,     0,
       0,     0,   135,   136,   137,   138,     0,     0,     0,   139,
     140,   135,   136,   137,   138,     0,     0,     0,   139,   140,
       0,     0,     0,     0,     0,     0,    43,    44,    45,   141,
     203,     0,    75,     0,     0,     0,     0,    47,   141,     0,
       0,    75
};

static const yytype_int16 yycheck[] =
{
      23,    10,    23,     0,    56,    28,   129,    28,    47,    46,
       7,    51,    36,     8,     8,     1,     8,   197,   198,   199,
     200,   201,    46,    46,    16,    36,     8,    13,    14,    15,
      37,    36,     1,    56,    16,    38,     1,    76,    77,    46,
      51,    46,     7,    46,    13,    14,    15,     0,    85,   229,
     102,    46,    46,    34,   234,   235,    52,   237,    49,    51,
      41,    84,    85,   243,   244,   245,    52,   201,    51,    51,
      53,    94,    95,   112,   197,    98,   199,     0,     1,   102,
     260,   261,   262,    52,     7,   208,   109,   110,   109,   110,
      13,    14,    15,    36,    37,   229,   135,   136,   137,   138,
     234,    53,   141,   237,   143,   144,   145,   146,    51,     1,
     149,     3,     4,     5,     6,     7,    35,     9,    10,    11,
      39,     1,    49,    42,     4,    17,    18,     1,    55,     3,
       4,     5,     6,     7,    49,     9,    10,    11,     0,     1,
      55,   180,    50,    17,    18,     7,    54,    50,    40,    41,
      42,    13,    14,    15,     1,    47,    51,     1,    49,    51,
       7,    52,     1,     7,    56,    57,    40,    41,    42,    13,
      14,    15,    45,    47,    13,    14,    15,    51,   175,   202,
      49,   202,    56,    49,    50,    46,    55,    54,    54,    55,
     213,   214,   213,   214,    21,    22,    23,    24,   207,    20,
      55,    28,    29,    53,    25,    26,    27,     1,   205,    30,
      31,    32,    33,     7,     1,   238,   225,   238,    32,    33,
       7,    48,    55,   246,     1,   246,     3,     4,     5,     6,
       7,     1,     9,    10,    11,    52,   259,     7,   259,    52,
      17,    18,     1,     1,     3,     4,     5,     6,     7,     7,
       9,    10,    11,    51,     1,    53,    49,    54,    17,    18,
       7,    49,    55,    40,    41,    42,    12,    13,    14,    15,
      47,    13,    14,    15,    51,    49,    52,    55,    49,    56,
      48,    40,    41,    42,    16,    54,    16,    36,    47,     1,
      16,    48,    51,    16,     7,    36,     1,    56,     3,     4,
       5,     6,     7,    27,     1,    72,     3,     4,     5,     6,
       7,   107,   246,    35,    94,    98,     1,    -1,     3,     4,
       5,     6,     7,    84,     1,    -1,     3,     4,     5,     6,
       7,    21,    22,    23,    24,    40,    41,    42,    28,    29,
      95,    -1,    47,    40,    41,    42,    51,    52,    -1,    -1,
      47,    -1,    49,    -1,    51,    40,    41,    42,    48,    49,
      -1,    51,    47,    40,    41,    42,    51,    -1,    -1,    -1,
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
      -1,     3,     4,     5,     6,     7,    -1,     1,    -1,     3,
       4,     5,     6,     7,    40,    41,    42,    -1,    -1,    -1,
      -1,    47,    40,    41,    42,    51,    -1,    -1,    -1,    47,
      40,    41,    42,    51,    -1,    -1,    -1,    47,    40,    41,
      42,    51,    -1,    -1,    -1,    47,    40,    41,    42,    51,
      -1,    -1,    -1,    47,    -1,    -1,     1,    51,     3,     4,
       5,     6,     7,    -1,     1,    -1,     3,     4,     5,     6,
       7,     1,    -1,     3,     4,     5,     6,     7,     1,    -1,
       3,     4,     5,     6,     7,     1,    -1,     3,     4,     5,
       6,     7,    -1,    -1,    -1,    40,    41,    42,    -1,    -1,
      -1,    -1,    47,    40,    41,    42,    51,    -1,    -1,    -1,
      40,    41,    42,    -1,    51,    -1,    -1,    40,    41,    42,
      -1,    51,    -1,    -1,    40,    41,    42,     1,    51,     3,
       4,     5,     6,     7,    -1,    51,    -1,    -1,    -1,    -1,
      -1,    -1,    21,    22,    23,    24,    -1,    -1,    -1,    28,
      29,    21,    22,    23,    24,    -1,    -1,    -1,    28,    29,
      -1,    -1,    -1,    -1,    -1,    -1,    40,    41,    42,    48,
      49,    -1,    51,    -1,    -1,    -1,    -1,    51,    48,    -1,
      -1,    51
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
      88,    74,    75,     9,    10,    11,    75,    74,    75,    75,
      75,    76,     1,    85,    89,    67,    64,    57,    74,    16,
       1,    89,    89,     7,    16,    36,    37,    36,    38,    64,
      49,    75,    76,     8,     8,    36,    48,    75,    76,    75,
       1,    75,    76,     1,    89,    49,    75,    75,    85,    37,
      16,    16,    36,     1,    89
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
#line 78 "parser.y"
    {syntaxTree = (yyvsp[(1) - (1)].tree);;}
    break;

  case 3:
#line 81 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree));;}
    break;

  case 4:
#line 82 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 5:
#line 85 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 6:
#line 86 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 7:
#line 87 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 8:
#line 92 "parser.y"
    {(yyval.tree) = setType((yyvsp[(2) - (3)].tree), (yyvsp[(1) - (3)].type), false); yyerrok;;}
    break;

  case 9:
#line 93 "parser.y"
    {(yyval.tree) = NULL; yyerrok;;}
    break;

  case 10:
#line 94 "parser.y"
    {(yyval.tree) = NULL; yyerrok; yyerrok;;}
    break;

  case 11:
#line 97 "parser.y"
    {(yyval.tree) = setType((yyvsp[(3) - (4)].tree), (yyvsp[(2) - (4)].type), true); yyerrok;;}
    break;

  case 12:
#line 98 "parser.y"
    {(yyval.tree) = setType((yyvsp[(2) - (3)].tree), (yyvsp[(1) - (3)].type), false); yyerrok;;}
    break;

  case 13:
#line 101 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); yyerrok; ;}
    break;

  case 14:
#line 102 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 15:
#line 103 "parser.y"
    {(yyval.tree) = NULL;;}
    break;

  case 16:
#line 104 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 17:
#line 107 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 18:
#line 108 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (3)].tree); addChild((yyval.tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 19:
#line 109 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 20:
#line 112 "parser.y"
    { (yyval.tree) = newDeclNode(VarK, UndefinedType, (yyvsp[(1) - (1)].tokenData)); (yyval.tree)->tmp = (yyvsp[(1) - (1)].tokenData)->idIndex; yyerrok;;}
    break;

  case 21:
#line 113 "parser.y"
    {(yyval.tree) = newDeclNode(VarK, UndefinedType, (yyvsp[(1) - (4)].tokenData)); (yyval.tree)->isArray = true; (yyval.tree)->aSize = (yyvsp[(3) - (4)].tokenData)->nvalue; (yyval.tree)->tmp = (yyvsp[(1) - (4)].tokenData)->idIndex;;}
    break;

  case 22:
#line 114 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 23:
#line 115 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 24:
#line 118 "parser.y"
    {(yyval.type) = Integer;;}
    break;

  case 25:
#line 119 "parser.y"
    {(yyval.type) = Boolean;;}
    break;

  case 26:
#line 120 "parser.y"
    {(yyval.type) = Char;;}
    break;

  case 27:
#line 125 "parser.y"
    {(yyval.tree) = newDeclNode(FuncK, (yyvsp[(1) - (6)].type), (yyvsp[(2) - (6)].tokenData), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); (yyval.tree)->tmp = (yyvsp[(2) - (6)].tokenData)->idIndex;;}
    break;

  case 28:
#line 126 "parser.y"
    {(yyval.tree) = newDeclNode(FuncK, Void, (yyvsp[(1) - (5)].tokenData), (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree)); (yyval.tree)->tmp = (yyvsp[(1) - (5)].tokenData)->idIndex;;}
    break;

  case 29:
#line 127 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 30:
#line 128 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 31:
#line 130 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 32:
#line 131 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 33:
#line 134 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 34:
#line 135 "parser.y"
    {(yyval.tree) = NULL;;}
    break;

  case 35:
#line 138 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 36:
#line 139 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 37:
#line 140 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 38:
#line 141 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 39:
#line 144 "parser.y"
    {(yyval.tree) = setType((yyvsp[(2) - (2)].tree), (yyvsp[(1) - (2)].type), false);;}
    break;

  case 40:
#line 145 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 41:
#line 148 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); yyerrok;;}
    break;

  case 42:
#line 149 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 43:
#line 150 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 44:
#line 151 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 45:
#line 154 "parser.y"
    {(yyval.tree) = newDeclNode(ParamK, UndefinedType, (yyvsp[(1) - (1)].tokenData));(yyval.tree)->tmp = (yyvsp[(1) - (1)].tokenData)->svalue;;}
    break;

  case 46:
#line 155 "parser.y"
    {(yyval.tree) = newDeclNode(ParamK, UndefinedType, (yyvsp[(1) - (3)].tokenData));(yyval.tree)->isArray = true; (yyval.tree)->tmp = (yyvsp[(1) - (3)].tokenData)->svalue; (yyval.tree)->aSize = sizeof((yyval.tree)->tmp);;}
    break;

  case 47:
#line 160 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 48:
#line 161 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 49:
#line 164 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 50:
#line 165 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 51:
#line 166 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 52:
#line 167 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 53:
#line 168 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 54:
#line 169 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 55:
#line 170 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 56:
#line 171 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 57:
#line 172 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 58:
#line 173 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 59:
#line 174 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 60:
#line 175 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 61:
#line 176 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 62:
#line 179 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 63:
#line 180 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 64:
#line 181 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 65:
#line 182 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 66:
#line 186 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (2)].tree); ;}
    break;

  case 67:
#line 187 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 68:
#line 190 "parser.y"
    {(yyval.tree) = newStmtNode(CompoundK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(3) - (4)].tree)); yyerrok;;}
    break;

  case 69:
#line 193 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree));;}
    break;

  case 70:
#line 194 "parser.y"
    {(yyval.tree) = NULL;;}
    break;

  case 71:
#line 197 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (2)].tree), (yyvsp[(2) - (2)].tree));;}
    break;

  case 72:
#line 198 "parser.y"
    {(yyval.tree) = NULL; ;}
    break;

  case 73:
#line 201 "parser.y"
    {(yyval.tree) = newStmtNode(IfK, (yyvsp[(1) - (6)].tokenData), (yyvsp[(2) - (6)].tree), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); ;}
    break;

  case 74:
#line 204 "parser.y"
    {(yyval.tree) = newStmtNode(IfK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree));;}
    break;

  case 75:
#line 205 "parser.y"
    {(yyval.tree) = newStmtNode(IfK, (yyvsp[(1) - (6)].tokenData), (yyvsp[(2) - (6)].tree), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree));;}
    break;

  case 76:
#line 208 "parser.y"
    {(yyval.tree) = newStmtNode(WhileK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree));;}
    break;

  case 77:
#line 209 "parser.y"
    {(yyval.tree) = newStmtNode(ForK, (yyvsp[(1) - (6)].tokenData), newDeclNode(VarK, Integer, (yyvsp[(2) - (6)].tokenData)), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); (yyval.tree)->tmp = (yyvsp[(2) - (6)].tokenData)->idIndex;;}
    break;

  case 78:
#line 212 "parser.y"
    {(yyval.tree) = newStmtNode(WhileK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(2) - (4)].tree), (yyvsp[(4) - (4)].tree));;}
    break;

  case 79:
#line 213 "parser.y"
    {(yyval.tree) = newStmtNode(ForK, (yyvsp[(1) - (6)].tokenData), newDeclNode(VarK, Integer, (yyvsp[(2) - (6)].tokenData)), (yyvsp[(4) - (6)].tree), (yyvsp[(6) - (6)].tree)); (yyval.tree)->tmp = (yyvsp[(2) - (6)].tokenData)->idIndex;;}
    break;

  case 80:
#line 216 "parser.y"
    {(yyval.tree) = newStmtNode(RangeK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 81:
#line 217 "parser.y"
    {(yyval.tree) = newStmtNode(RangeK, (yyvsp[(2) - (5)].tokenData), (yyvsp[(1) - (5)].tree), (yyvsp[(3) - (5)].tree), (yyvsp[(5) - (5)].tree)); (yyval.tree)->tmp = (yyvsp[(2) - (5)].tokenData)->idIndex;;}
    break;

  case 82:
#line 218 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 83:
#line 219 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 84:
#line 220 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 85:
#line 223 "parser.y"
    {(yyval.tree) = newStmtNode(ReturnK, (yyvsp[(1) - (3)].tokenData), (yyvsp[(2) - (3)].tree)); yyerrok;;}
    break;

  case 86:
#line 224 "parser.y"
    {(yyval.tree) = newStmtNode(ReturnK, (yyvsp[(1) - (2)].tokenData)); ;}
    break;

  case 87:
#line 225 "parser.y"
    { (yyval.tree) = NULL; yyerrok; ;}
    break;

  case 88:
#line 228 "parser.y"
    {(yyval.tree) = newStmtNode(BreakK, (yyvsp[(1) - (2)].tokenData));;}
    break;

  case 89:
#line 233 "parser.y"
    {(yyval.tree) = newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); (yyval.tree)->expType = (yyvsp[(1) - (3)].tree)->expType;;}
    break;

  case 90:
#line 234 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 91:
#line 235 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 92:
#line 236 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 93:
#line 237 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Integer, false);;}
    break;

  case 94:
#line 238 "parser.y"
    { (yyval.tree)=NULL; yyerrok;;}
    break;

  case 95:
#line 239 "parser.y"
    { (yyval.tree)=NULL; yyerrok;;}
    break;

  case 96:
#line 240 "parser.y"
    { (yyval.tree)=NULL; yyerrok;;}
    break;

  case 97:
#line 241 "parser.y"
    { (yyval.tree)=NULL; yyerrok;;}
    break;

  case 98:
#line 242 "parser.y"
    { (yyval.tree)=NULL; yyerrok;;}
    break;

  case 99:
#line 243 "parser.y"
    { (yyval.tree)=NULL;;}
    break;

  case 100:
#line 244 "parser.y"
    { (yyval.tree)=NULL;;}
    break;

  case 101:
#line 245 "parser.y"
    { (yyval.tree)=NULL;;}
    break;

  case 102:
#line 246 "parser.y"
    { (yyval.tree)=NULL;;}
    break;

  case 103:
#line 247 "parser.y"
    { (yyval.tree)=NULL;;}
    break;

  case 104:
#line 248 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].tree)), Integer, false); yyerrok;;}
    break;

  case 105:
#line 249 "parser.y"
    {(yyval.tree) = setType(newExpNode(AssignK, (yyvsp[(2) - (2)].tokenData), (yyvsp[(1) - (2)].tree)), Integer, false); yyerrok;;}
    break;

  case 106:
#line 250 "parser.y"
    { (yyval.tree)=NULL; yyerrok; ;}
    break;

  case 107:
#line 251 "parser.y"
    { (yyval.tree)=NULL; yyerrok; ;}
    break;

  case 108:
#line 252 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 109:
#line 255 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Boolean, false);;}
    break;

  case 110:
#line 256 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 111:
#line 257 "parser.y"
    { (yyval.tree)=NULL; ;}
    break;

  case 112:
#line 260 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(2) - (3)].tokenData), (yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)), Boolean, false);;}
    break;

  case 113:
#line 261 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 114:
#line 262 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 115:
#line 265 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (2)].tokenData), (yyvsp[(2) - (2)].tree)), Boolean, false);;}
    break;

  case 116:
#line 266 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 117:
#line 267 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 118:
#line 270 "parser.y"
    {(yyval.tree) = (yyvsp[(2) - (3)].tree); addChild((yyval.tree), (yyvsp[(1) - (3)].tree)); addChild((yyval.tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 119:
#line 271 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 120:
#line 272 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 121:
#line 275 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 122:
#line 276 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 123:
#line 277 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 124:
#line 278 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 125:
#line 279 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 126:
#line 280 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Boolean, false);;}
    break;

  case 127:
#line 283 "parser.y"
    {(yyval.tree) = (yyvsp[(2) - (3)].tree);addChild((yyval.tree), (yyvsp[(1) - (3)].tree));addChild((yyval.tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 128:
#line 284 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 129:
#line 287 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 130:
#line 288 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 131:
#line 291 "parser.y"
    {(yyval.tree) = (yyvsp[(2) - (3)].tree); addChild((yyval.tree), (yyvsp[(1) - (3)].tree)); addChild((yyval.tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 132:
#line 292 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 133:
#line 293 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 134:
#line 296 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 135:
#line 297 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 136:
#line 300 "parser.y"
    {(yyval.tree) = (yyvsp[(2) - (3)].tree); addChild((yyval.tree), (yyvsp[(1) - (3)].tree)); addChild((yyval.tree), (yyvsp[(3) - (3)].tree));;}
    break;

  case 137:
#line 301 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 138:
#line 302 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 139:
#line 305 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 140:
#line 306 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 141:
#line 307 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 142:
#line 310 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (2)].tree); addChild((yyval.tree), (yyvsp[(2) - (2)].tree));;}
    break;

  case 143:
#line 311 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 144:
#line 312 "parser.y"
    { (yyval.tree) = NULL; ;}
    break;

  case 145:
#line 315 "parser.y"
    {(yyvsp[(1) - (1)].tokenData)->tokenclass=CHSIGN; (yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 146:
#line 316 "parser.y"
    {(yyvsp[(1) - (1)].tokenData)->tokenclass=SIZEOF; (yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 147:
#line 317 "parser.y"
    {(yyval.tree) = setType(newExpNode(OpK, (yyvsp[(1) - (1)].tokenData)), Integer, false);;}
    break;

  case 148:
#line 320 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 149:
#line 321 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 150:
#line 324 "parser.y"
    {(yyval.tree) = newExpNode(IdK, (yyvsp[(1) - (1)].tokenData)); (yyval.tree)->name = (yyvsp[(1) - (1)].tokenData)->idIndex;;}
    break;

  case 151:
#line 325 "parser.y"
    {(yyval.tree) = newExpNode(OpK, (yyvsp[(2) - (4)].tokenData), newExpNode(IdK, (yyvsp[(1) - (4)].tokenData)), (yyvsp[(3) - (4)].tree)); (yyval.tree)->child[0]->name = (yyvsp[(1) - (4)].tokenData)->idIndex;;}
    break;

  case 152:
#line 328 "parser.y"
    {(yyval.tree) = (yyvsp[(2) - (3)].tree); yyerrok;;}
    break;

  case 153:
#line 329 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 154:
#line 330 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 155:
#line 331 "parser.y"
    {(yyval.tree) = NULL; ;}
    break;

  case 156:
#line 334 "parser.y"
    {(yyval.tree) = newExpNode(CallK, (yyvsp[(1) - (4)].tokenData), (yyvsp[(3) - (4)].tree));(yyval.tree)->name = (yyvsp[(1) - (4)].tokenData)->idIndex;;}
    break;

  case 157:
#line 335 "parser.y"
    {(yyval.tree) = NULL; yyerrok;;}
    break;

  case 158:
#line 338 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 159:
#line 339 "parser.y"
    {(yyval.tree) = NULL;;}
    break;

  case 160:
#line 342 "parser.y"
    {(yyval.tree) = addSibling((yyvsp[(1) - (3)].tree), (yyvsp[(3) - (3)].tree)); yyerrok;;}
    break;

  case 161:
#line 343 "parser.y"
    {(yyval.tree) = (yyvsp[(1) - (1)].tree);;}
    break;

  case 162:
#line 344 "parser.y"
    { (yyval.tree)=NULL; ;}
    break;

  case 163:
#line 347 "parser.y"
    {(yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));(yyval.tree)->expType = Integer; (yyval.tree)->value = (yyvsp[(1) - (1)].tokenData)->nvalue;;}
    break;

  case 164:
#line 348 "parser.y"
    {(yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));(yyval.tree)->expType = Char; (yyval.tree)->cvalue = (yyvsp[(1) - (1)].tokenData)->cvalue;;}
    break;

  case 165:
#line 349 "parser.y"
    {(yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData));(yyval.tree)->expType = Char; (yyval.tree)->string = (yyvsp[(1) - (1)].tokenData)->svalue; (yyval.tree)->isArray = true; (yyval.tree)->aSize = sizeof((yyvsp[(1) - (1)].tokenData)->svalue);;}
    break;

  case 166:
#line 350 "parser.y"
    {(yyval.tree) = newExpNode(ConstantK, (yyvsp[(1) - (1)].tokenData)); (yyval.tree)->expType = Boolean; (yyval.tree)->value = (yyvsp[(1) - (1)].tokenData)->nvalue;;}
    break;


/* Line 1267 of yacc.c.  */
#line 2697 "parser.tab.c"
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


#line 353 "parser.y"


//
// Utility
//
TreeNode * parse(void)
{
    yyparse();
    return syntaxTree;
}

// function declaration
void startgeneration(TreeNode * tree, SymbolTable * table);
void codegen(char *filename, TreeNode * tree, SymbolTable * table);
void nodegenstart(TreeNode *tree, SymbolTable * table);
void nodegenend(TreeNode *tree, SymbolTable * table);
void generate(TreeNode * tree, SymbolTable * table);

int main(int argc, char *argv[])
{
    // expected format -c [option] [filename]
    //               arg0    arg1    arg2
    // in case no filename listed
    SymbolTable *table = new SymbolTable();
    int c, dset = 0,  pset = 0, bDset = 0, bPset = 0, hset = 0, mset = 0;
       
    while((c = ourGetopt(argc, argv, (char *)"dDpPhM")) != EOF)
    {
        switch(c)
        {
            case 'd':
                dset = 1;
                break;
            case 'p':
                pset = 1;
                break;
            case 'M':
                mset = 1;
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
        printf("-h      - this usage message \n");
        printf("-p      - print the abstract syntax tree \n");
        printf("-P      - print the abstract syntax tree plus type information \n");
        printf("-M      - print the abstract syntax tree plus memory info \n");
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
    
    table->debug(bDset);
    
    if(n_errors == 0)
    {
        symanticA(syntaxTree, table);
    }
   
    
    if(bPset == 1)
    {
        if(n_errors == 0)
        {
            printTree(syntaxTree);
        }
    }
       
    if(mset == 1)
    {
        if(n_errors == 0)
        {
            printTreeMemory(syntaxTree);
            printf("Offset for end of global space: %d \n", goffset );
        }
    }
    
    // ----- CODE GENERATION -----
    // should do this automatically
    if(n_errors == 0)
    {
        char *path = strdup(argv[optind]);
        int n = strlen(path);
        if(n > 3 && path[n - 1] == '-' && path[n - 2] == 'c' && path[n - 3] == '.')
        {
            path[n - 2] = 't';
            path[n - 1] = 'm';
        }
        else
        {
            printf("ERROR(I/O): Input filename must end in .c-\n");
            n_errors++;
            printf("Number of warnings: %d\n", n_warnings);
            printf("Number of errors: %d\n", n_errors);
            return -1;
        }
        
        
        code = fopen(path, "w+");
        
        codegen(argv[optind], syntaxTree, table);
        fclose(code);
        
    }
    
    printf("Number of warnings: %d\n", n_warnings);
    printf("Number of errors: %d\n", n_errors);
}

void codegen(char *filename, TreeNode * tree, SymbolTable * table)
{
        inaFunction = false;
        // insert header comment
        emitComment((char *)"C- version: 1.00");
        emitComment((char *)"by Sydney Petrehn");
        emitComment((char *)"Input file:", filename);

        // backpatch a jump to init
        entry = emitSkip(1);

        // I/O Library
        // input
        TreeNode *input;
        input = (TreeNode *)table->lookup((char *)"input");
        if(input != NULL)
        {
            input->memlocation = emitSkip(0);
        }
        
        emitComment((char *)"FUNCTION input");
        emitRM((char *)"ST", 3, -1, 1, (char *)"Store return address");
        emitRO((char *)"IN", 2, 2, 2, (char *)"Grab int input");
        emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
        emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
        emitRM((char *)"LDA", 7, 0, 3, (char *)"Return");
        emitComment((char *)"END FUNCTION input");
        
        // output
        TreeNode *output;
        output = (TreeNode *)table->lookup((char *)"output");
        if(output != NULL)
        {
            output->memlocation = emitSkip(0);
        }
       
        emitComment((char *)"FUNCTION output");
        emitRM((char *)"ST", 3, -1, 1, (char *)"Store return address");
        emitRM((char *)"LD", 3, -2, 1, (char *)"Load parameter");
        emitRO((char *)"OUT", 3, 3, 3, (char *)"Output integer");
        emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
        emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
        emitRM((char *)"LDA", 7, 0, 3, (char *)"Return");
        emitComment((char *)"END FUNCTION output");

        // inputb
        TreeNode *inputb;
        inputb = (TreeNode *)table->lookup((char *)"inputb");
        if(inputb != NULL)
        {
            inputb->memlocation = emitSkip(0);
        }
        
        emitComment((char *)"FUNCTION inputb");
        emitRM((char *)"ST", 3, -1, 1, (char *)"Store return address");
        emitRO((char *)"INB", 2, 2, 2, (char *)"Grab bool input");
        emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
        emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
        emitRM((char *)"LDA", 7, 0, 3, (char *)"Return");
        emitComment((char *)"END FUNCTION inputb");
        
        // outputb
        TreeNode *outputb;
        outputb = (TreeNode *)table->lookup((char *)"outputb");
        if(output != NULL)
        {
            outputb->memlocation = emitSkip(0);
        }
        
        emitComment((char *)"FUNCTION outputb");
        emitRM((char *)"ST", 3, -1, 1, (char *)"Store return address");
        emitRM((char *)"LD", 3, -2, 1, (char *)"Load parameter");
        emitRO((char *)"OUTB", 3, 3, 3, (char *)"Output bool");
        emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
        emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
        emitRM((char *)"LDA", 7, 0, 3, (char *)"Return");
        emitComment((char *)"END FUNCTION outputb");

        // inputc
        TreeNode *inputc;
        inputc = (TreeNode *)table->lookup((char *)"inputc");
        if(inputc != NULL)
        {
            inputc->memlocation = emitSkip(0);
        }
        emitComment((char *)"FUNCTION inputc");
        emitRM((char *)"ST", 3, -1, 1, (char *)"Store return address");
        emitRO((char *)"INC", 2, 2, 2, (char *)"Grab char input");
        emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
        emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
        emitRM((char *)"LDA", 7, 0, 3, (char *)"Return");
        emitComment((char *)"END FUNCTION inputc");
        
        // outputc
        TreeNode *outputc;
        outputc = (TreeNode *)table->lookup((char *)"outputc");
        if(outputc != NULL)
        {
            outputc->memlocation = emitSkip(0);
        }
        emitComment((char *)"FUNCTION outputc");
        emitRM((char *)"ST", 3, -1, 1, (char *)"Store return address");
        emitRM((char *)"LD", 3, -2, 1, (char *)"Load parameter");
        emitRO((char *)"OUTC", 3, 3, 3, (char *)"Output char");
        emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
        emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
        emitRM((char *)"LDA", 7, 0, 3, (char *)"Return");
        emitComment((char *)"END FUNCTION outputc");

        // outnl
        TreeNode *outnl;
        outnl = (TreeNode *)table->lookup((char *)"outnl");
        if(outnl != NULL)
        {
            outnl->memlocation = emitSkip(0);
        }
        
        emitComment((char *)"FUNCTION outnl");
        emitRM((char *)"ST", 3, -1, 1, (char *)"Store return address");
        emitRO((char *)"OUTNL", 3, 3, 3, (char *)"Output newline");
        emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
        emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
        emitRM((char *)"LDA", 7, 0, 3, (char *)"Return");
        emitComment((char *)"END FUNCTION outnl");
        
        // main body
        emitComment((char *)"=========================================");
        
        startgeneration(tree, table);
}

void startgeneration(TreeNode * tree, SymbolTable * table)
{
    generate(tree, table);
    
    emitComment((char *)"=========================================");
    
    
    emitComment((char *)"INIT");
    
    // idk why but add this? it should be 2.
    if(goffset == 2)
    {
        goffset = 0;
    }
    else if(goffset == 1)
    {
        goffset = 0;
    }
    else if(goffset == -1)
    {
        //goffset = 0;
    }
    else if(goffset == -15)
    {
        goffset = -9;
    }
    else if(goffset == -7)
    {
        goffset = -9;
    }
    
    
    
    emitRM((char *)"LDA", 1, goffset, 0, (char *)"Set first frame at end of globals");
    emitRM((char *)"ST", 1, 0, 1, (char *)"Store old fp (point to self)");
    
    emitComment((char *)"INIT GLOBALS AND STATICS");
   
    //please god work
    TreeNode * iterater = tree;
    while(iterater != NULL)
    {
        if(iterater->isArray == true)
        {
            emitRM((char *)"LDC", 3, iterater->aSize, 6, (char *)"load size of array", iterater->name);
            emitRM((char *)"ST", 3, iterater->memlocation+1, 0, (char *)"save size of array", iterater->name);
        }
        iterater = iterater->sibling;
    }
    
    emitComment((char *)"END INIT GLOBALS AND STATICS");
   
    TreeNode *memtemp;
    int loc;
    memtemp = (TreeNode *)table->lookup((char *)"main");
    if(memtemp != NULL)
    {
        loc = memtemp->memlocation - emitSkip(0) - 1;
    }
    else
    {
        loc = -9;
    }
    
    emitRM((char *)"LDA", 3, 1, 7, (char *)"Return address in ac");
    emitRM((char *)"JMP", 7, loc , 7, (char *)"Jump to main");
    emitRM((char *)"HALT", 0, 0, 0, (char *)"DONE!");
    emitComment((char *)"END INIT");
     
}

void generate(TreeNode * tree, SymbolTable * table)
{
    nodegenstart(tree, table);
    
    for(int i = 0; i <3; i++)
    {
        if( (tree->child[i]) != NULL)
        {
            generate(tree->child[i], table);
        }
    }
    
    nodegenend(tree, table);
    // look at the sibling
    if( (tree->sibling) != NULL)
    {
        generate(tree->sibling, table);
    }
    
}

void nodegenstart(TreeNode *tree, SymbolTable * table)
{
    int i;
    TreeNode *temp;
    
    if (tree->nodekind == StmtK)
    {
        switch(tree->subkind.stmt)
        {
            case NullK:
                break;
            case IfK:
                emitComment((char *)"IF");
                break;
            case WhileK:
                emitComment((char *)"While");
                break;
            case ForK:
                emitComment((char *)"For");
                break;
            case CompoundK:
            
                toffset_old = toffset;
                if(!tree->noScope)
                {
                    emitComment((char *)"COMPOUND");
                    toffset = tree->memsize;
                    emitComment((char *)"TOFF set: ", (int *)toffset );
                }
                emitComment((char *)"Compound body");
                break;
            case ReturnK:
                emitComment((char *)"Return");
                break;
            case BreakK:
                emitComment((char *)"Break");
                break;
            case RangeK:
                emitComment((char *)"Range");
                break;
            default:
                break;
        }
    }
    else if(tree->nodekind == DeclK)
    {
        //VarK, FuncK, ParamK
        switch(tree->subkind.decl)
        {
            case VarK:
                emitComment((char *)"Var");
                if(tree->isArray == true)
                {
                    if(inaFunction == true)
                    {
                      //load
                      emitRM((char *)"LDC", 3, tree->memsize - 1, 6, (char *)"Load size of array", tree->name);
                      //save
                      emitRM((char *)"ST", 3, tree->memlocation +1, 1, (char *)"store return address");
                      return;
                    }
                }
                
                toffset--;
                break;
            case FuncK:
                inaFunction = true;
                emitComment((char *)"FUNCTION", tree->name);
                
                TreeNode *memtemp;
                memtemp = (TreeNode *)table->lookupGlobal(tree->name);
                if(memtemp != NULL)
                {
                    memtemp->memlocation = emitSkip(0) - 1;
                }
                
                toffset = -2;
                emitComment((char *)"TOFF set: ", (int *)toffset );
                emitRM((char *)"ST", 3, -1, 1, (char *)"store return address");
                break;
            case ParamK:
                emitComment((char *)"PARM");
                // do nothing
                break;
            default:
                break;
        }
    }
    else // ExpK
    {
        TreeNode * lhs;
        TreeNode * rhs;
        emitComment((char *)"EXPRESSION");
        switch(tree->subkind.exp)
            {
                case OpK:
                    //toffset_old++;
                    break;
                case ConstantK:
                    //emitComment((char *)"ASSIGN", tree->name);
                    break;
                case IdK:
                    break;
                case AssignK:
                    emitComment((char *)"ASSIGN ", tree->name);
                    
                    if(tree->child[0] != NULL)
                    {
                        lhs = tree->child[0];
                    }
                    
                    /*
                     Sibling: 1  Assign: = of type int [line: 8]
                     .   .   .   Child: 0  Op: [ of type int [line: 8]
                     .   .   .   .   Child: 0  Id: y of array of type int [mem: Global loc: -11 size: 5] [line: 8]
                     .   .   .   .   Child: 1  Const 1 of type int [line: 8]
                     .   .   .   Child: 1  Const 211 of type int [line: 8]
                     */
                    if(lhs->tokenclass == LB)
                    {
                        // load integer constant
                        // push index
                        lhs = tree->child[0]->child[0];
                        rhs = tree->child[0]->child[1];
                        // this next line breaks b
                        rhs->generated = true;
                        switch(rhs->tokenclass)
                        {
                            case CHARCONST:
                                emitRM((char *)"LDC", 3, (int)rhs->cvalue, 6, (char *)"Load char constant");
                                break;
                            case STRINGCONST:
                                break;
                            case NUMCONST:
                            case BOOLCONST:
                                emitRM((char *)"LDC", 3, rhs->value, 6, (char *)"Load integer constant");
                                break;
                        }
                        emitRM((char *)"ST", 3, toffset, 1, (char *)"Push index");
                        
                        //rhs->generated = true;
                        // get the rhs of the =
                        rhs = tree->child[1];
                        rhs->generated = true;
                        switch(rhs->tokenclass)
                        {
                            case CHARCONST:
                                emitRM((char *)"LDC", 3, (int)rhs->cvalue, 6, (char *)"Load char constant");
                                break;
                            case STRINGCONST:
                                break;
                            case NUMCONST:
                            case BOOLCONST:
                                emitRM((char *)"LDC", 3, rhs->value, 6, (char *)"Load integer constant");
                                break;
                        }
                        
                        // pop index
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop index");
                        
                        // load address of base of array tree->name
                        // pop index
                        emitRM((char *)"LDA", 5, lhs->memlocation, (lhs->isGlobal ? 0 : 1), (char *)"Load address of base of array", lhs->name);
                        // compute offset of value
                        emitRO((char *)"SUB", 5, 5, 4, (char *)"Compute offset of value");
                        // store variable x
                        emitRM((char *)"ST", 3, 0, 5, (char *)"Store variable", lhs->name);
                        
                        lhs->generated = true;
                        
                    }
                    else
                    {
                        
                        // check for both being ids
                        if( (tree->child[0]->nodekind == ExpK && tree->child[0]->subkind.exp == IdK ) && (tree->child[1]->nodekind == ExpK && tree->child[1]->subkind.exp == IdK ) )
                        {
                            lhs = tree->child[0];
                            rhs = tree->child[1];
                            /*
                             .   .   Sibling: 2  Assign: += of type int [line: 9]
                             .   .   .   Child: 0  Id: x of type int [mem: Global loc: 0 size: 1] [line: 9]
                             .   .   .   Child: 1  Id: y of type int [mem: Global loc: -1 size: 1] [line: 9]
                             
                             EXPRESSION
                              44:     LD  3,-1(0)    Load variable y
                              45:     LD  4,0(0)    load lhs variable x
                              46:    ADD  3,4,3    op +=
                             */
                            emitRM((char *)"LD", 3, rhs->memlocation, 0, (char *)"Load variable ", rhs->name);
                            emitRM((char *)"LD", 4, 0, 0, (char *)"Load lhs variable ", lhs->name);
                            
                            switch(tree->tokenclass)
                            {
                                case ADDASS:
                                    emitRO((char *)"ADD", 3, 4, 3, (char *)"Op +");
                                    break;
                                case SUBASS:
                                    emitRO((char *)"SUB", 3, 4, 3, (char *)"Op -");
                                    break;
                                
                            }
                            
                            
                        }
                        /*
                         Sibling: 1  Assign: = of type int [line: 8]
                         .   .   .   .   Child: 0  Id: y of array of type int [mem: Global loc: -11 size: 5] [line: 8]
                         .   .   .   .   Child: 1  Const 211 of type int [line: 8]
                         */
                        lhs = tree->child[0];
                        rhs = tree->child[1];
                        tree->child[1]->generated = true;
                        switch(rhs->tokenclass)
                        {
                            case CHARCONST:
                                emitRM((char *)"LDC", 3, (int)rhs->cvalue, 6, (char *)"Load char constant");
                                break;
                            case STRINGCONST:
                                break;
                            case NUMCONST:
                            case BOOLCONST:
                                emitRM((char *)"LDC", 3, rhs->value, 6, (char *)"Load integer constant");
                                break;
                        }
                        emitRM((char *)"ST", 3, lhs->memlocation , (lhs->isGlobal ? 0 : 1), (char *)"Store variable", lhs->name);
                        toffset--;
                    }
                   
                    break;
                case InitK:
                    emitComment((char *)"INIT ", tree->name);
                    break;
                case CallK:
                    //toffset++;
                    emitComment((char *)"CALL ", tree->name);
                    if(toffset == -4)
                    {
                        toffset = -2;
                    }
                    emitRM((char *)"ST", 1, toffset, 1, (char *)"Store fp in ghost frame for ", tree->name);
                    toffset_old = toffset;
                    
                    //toffset = -2;
                    toffset--;
                    emitComment((char *)"TOFF dec: ", (int *) toffset);
                    toffset--;
                    emitComment((char *)"TOFF dec: ", (int *) toffset);
                    
                    if(tree->child[0] != NULL)
                    {
                        if(tree->child[0]->child[0] != NULL)
                        {
                            if(tree->child[0]->child[0]->child[0] != NULL)
                            {
                                
                                if(tree->child[0]->child[0]->child[0]->isArray == false)
                                {
                                    /*
                                    lhs = tree->child[0]->child[0]->child[0];
                                    // not an array just an id
                                    emitRM((char *)"LD", 3, (parmc * -1), 0, (char *)"Load variable", tree->name);
                                    parmc++;
                                    emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                                    // load left
                                    // push left
                                    emitRM((char *)"LD", 3, (parmc * -1), 0, (char *)"Load variable", tree->name);
                                    // load right
                                     */
                                }
                                else if(tree->child[0]->child[0]->child[0]->isArray == true)
                                {
                                    lhs = tree->child[0]->child[0]->child[0];
                                    emitRM((char *)"LDA", 3, lhs->memlocation, (lhs->isGlobal ? 0 : 1), (char *)"Load address of base of array", tree->child[0]->child[0]->child[0]->name);
                                    emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                                    
                                    if(tree->child[0]->child[0]->child[1] != NULL)
                                    {
                                        tree->child[0]->child[0]->child[1]->generated = true;
                                        tree->child[0]->child[0]->child[1]->pop = false;
                                        tree->child[0]->CallParm = true;
                                        
                                        switch(tree->child[0]->child[0]->child[1]->tokenclass)
                                        {
                                            case CHARCONST:
                                                emitRM((char *)"LDC", 3, (int)tree->child[0]->child[0]->child[1]->cvalue, 6, (char *)"Load char constant");
                                                break;
                                            case STRINGCONST:
                                                break;
                                            case NUMCONST:
                                            case BOOLCONST:
                                                emitRM((char *)"LDC", 3, tree->child[0]->child[0]->child[1]->value, 6, (char *)"Load integer constant");
                                                //emitComment((char *)"HERE ");
                                                break;
                                        }
                                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                                        
                                        emitRO((char *)"SUB", 3, 4, 3, (char *)"Compute location from index");
                                        
                                        emitRM((char *)"LD", 3, 0, 3, (char *)"Load array element");
                                        
                                        emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                                       
                                        toffset--;
                                    }
                                    // case
                                    /*
                                     .   .   Sibling: 2  Call: output of type void [line: 9]
                                     .   .   .   Child: 0  Op: + of type int [line: 9]
                                     .   .   .   .   Child: 0  Op: [ of type int [line: 9]
                                     .   .   .   .   .   Child: 0  Id: x of array of type int [mem: Local loc: -3 size: 4] [line: 9]
                                     .   .   .   .   .   Child: 1  Const 2 of type int [line: 9]
                                     .   .   .   .   Child: 1  Op: [ of type int [line: 9]
                                     .   .   .   .   .   Child: 0  Id: y of array of type int [mem: Local loc: -7 size: 5] [line: 9]
                                     .   .   .   .   .   Child: 1  Const 1 of type int [line: 9]
                                     */
                                   if(tree->child[0]->child[1]->child[0] != NULL)
                                    {
                                        if(tree->child[0]->child[1]->child[0]->isArray == true)
                                        {
                                            lhs = tree->child[0]->child[1]->child[0];
                                            rhs = tree->child[0]->child[1]->child[1];
                                            emitRM((char *)"LDA", 3, lhs->memlocation, (lhs->isGlobal ? 0 : 1), (char *)"Load address of base of array", lhs->name);
                                            emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                                            
                                            //toffset--;
                                            
                                            if(tree->child[0]->child[1]->child[1] != NULL)
                                            {
                                                tree->child[0]->child[1]->child[1]->generated = true;
                                                tree->child[0]->child[1]->child[1]->pop = false;
                                                
                                                
                                                switch(tree->child[0]->child[1]->child[1]->tokenclass)
                                                {
                                                    case CHARCONST:
                                                        emitRM((char *)"LDC", 3, (int)tree->child[0]->child[1]->child[1]->cvalue, 6, (char *)"Load char constant");
                                                        break;
                                                    case STRINGCONST:
                                                        break;
                                                    case NUMCONST:
                                                    case BOOLCONST:
                                                        emitRM((char *)"LDC", 3, tree->child[0]->child[1]->child[1]->value, 6, (char *)"Load integer constant");
                                                        break;
                                                }
                                                
                                                emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                                                
                                                emitRO((char *)"SUB", 3, 4, 3, (char *)"Compute location from index");
                                                
                                                emitRM((char *)"LD", 3, 0, 3, (char *)"Load array element");
                                                
                                                toffset++;
                                                emitComment((char *)"TOFF inc: ", (int *) toffset);
                                            }
                                        }
                                        return;
                                    }
                                }
                            }
                        }
                    }
                    
                    if(tree->child[0] != NULL)
                    {
                        if(tree->child[0]->child[0] != NULL)
                        {
                            /*
                             .   .   Sibling: 2  Call: outputb of type void [line: 9]
                             .   .   .   Child: 0  Op: and of type bool [line: 9]
                             .   .   .   .   Child: 0  Id: x of type bool [mem: Local loc: -2 size: 1] [line: 9]
                             .   .   .   .   Child: 1  Id: y of type bool [mem: Local loc: -3 size: 1] [line: 9]
                             */
                            if(tree->child[0]->child[0]->isArray == false)
                            {
                                /*
                                 .   .   Child: 1  Call: output of type void [line: 4]
                                 .   .   .   Child: 0  Op: chsign of type int [line: 4]
                                 .   .   .   .   Child: 0  Const 666 of type int [line: 4]
                                 */
                                if(tree->child[0]->child[1] == NULL)
                                {
                                    emitComment((char *)"TOFF inc: ", (int *) toffset);
                                
                                    lhs = tree->child[0]->child[0];
                                    // load integer constant
                                    switch(lhs->tokenclass)
                                    {
                                        case CHARCONST:
                                            emitRM((char *)"LDC", 3, (int)lhs->cvalue, 6, (char *)"Load char constant");
                                            break;
                                        case STRINGCONST:
                                            break;
                                        case NUMCONST:
                                        case BOOLCONST:
                                            emitRM((char *)"LDC", 3, lhs->value, 6, (char *)"Load integer constant");
                                            break;
                                    }
                                }
                                else
                                {
                                    lhs = tree->child[0]->child[0];
                                    rhs = tree->child[0]->child[1];
                                    // not an array just an id
                                    emitRM((char *)"LD", 3, lhs->memlocation, 0, (char *)"Load variable", lhs->name);
                                    parmc++;
                                    emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                                    emitRM((char *)"LD", 3, rhs->memlocation , 0, (char *)"Load variable", rhs->name);
                                }
                            }
                        }
                    }
                            
                            
                    if(tree->child[0] != NULL)
                    {
                        parmc++;
                        tree->child[0]->CallParm = true;
                        
                        if(tree->child[0]->nodekind == ExpK && tree->child[0]->subkind.exp == OpK)
                        {
                           // Push Left Side
                           tree->child[0]->child[0]->pop = true;
                           if(tree->child[0]->tokenclass == CHSIGN)
                           {
                               tree->child[0]->child[0]->pop = false;
                               tree->child[0]->child[0]->isUnary = true;
                           }
                        }

                    }
                    
                    if(tree->child[1] != NULL)
                    {
                        parmc++;
                        tree->child[1]->CallParm = true;
                        //tree->generated = true;
                    }
                    
                    if(tree->child[2] != NULL)
                    {
                        parmc++;
                        //tree->child[2]->CallParm = true;
                    }
                    
                   break;
                default:
                    break;
            }
    }
}


void nodegenend(TreeNode *tree, SymbolTable * table)
{
    TreeNode * temp;
    
    if (tree->nodekind == StmtK)
    {
        switch(tree->subkind.stmt)
        {
            case NullK:
                break;
            case IfK:
                break;
            case WhileK:
                break;
            case ForK:
                break;
            case CompoundK:
                if(!tree->noScope)
                {
                    emitComment((char *)"END COMPOUND");
                }
                break;
            case ReturnK:
                break;
            case BreakK:
                break;
            case RangeK:
                break;
            default:
                break;
        }
    }
    else if(tree->nodekind == DeclK)
    {
        //VarK, FuncK, ParamK
        switch(tree->subkind.decl)
        {
            case VarK:
                break;
            case FuncK:
                emitComment((char *)"Add standard closing in case there is no return statement");
                emitRM((char *)"LDC", 2, 0, 6, (char *)"Set return value to 0");
                emitRM((char *)"LD", 3, -1, 1, (char *)"Load return address");
                emitRM((char *)"LD", 1, 0, 1, (char *)"Adjust frame pointer");
                emitRM((char *)"JMP", 7, 0, 3, (char *)"Return");
                emitComment((char *)"END FUNCTION", tree->name);
                backPatchAJumpToHere(entry, (char *)"Jump to init [backpatch]");
                inaFunction = false;
                break;
            case ParamK:
                break;
            default:
                break;
        }
    }
    else // ExpK
    {
        TreeNode * gloVar;
        TreeNode * lhs;
        TreeNode * rhs;
        
        switch(tree->subkind.exp)
            {
                case OpK:

                
                emitComment((char *)"OP ", tree->name);
                //toffset_old;
                // for this case
                /*
                 Child: 0  Op: * of type int [line: 4]
                 .   .   .   .   Child: 0  Const 50 of type int [line: 4]
                 .   .   .   .   Child: 1  Const 13 of type int [line: 4]
                 */
                lhs = tree->child[0];
                rhs = tree->child[1];
                
                switch(tree->tokenclass)
                {
                        case ADD:
                        //load var x
                        // push left side
                        // load variable y
                        pos1 = lhs->memlocation;
                        pos2 = (lhs->isGlobal ? 0 : 1);
                        
                        if(lhs->nodekind == ExpK && lhs->subkind.exp == IdK)
                        {
                            //lhs->memlocation, (lhs->isGlobal ? 0 : 1)
                            emitRM((char *)"LD", 3, pos1, pos2, (char *)"Load variable ", lhs->name);
                            emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                        }
                        
                        pos1 = rhs->memlocation;
                        pos2 = (rhs->isGlobal ? 0 : 1);
                        if(rhs->nodekind == ExpK && rhs->subkind.exp == IdK)
                        {
                            //lhs->memlocation, (lhs->isGlobal ? 0 : 1)
                            emitRM((char *)"LD", 3, pos1, pos2, (char *)"Load variable ", rhs->name);
                        }
                        
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"ADD", 3, 4, 3, (char *)"Op +");
                            break;
                        case SUB:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"SUB", 3, 4, 3, (char *)"Op -");
                            break;
                        case MUL:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            if(tree->child[1] == NULL) // unary
                                emitRM((char *)"LD", 3, 1, 3, (char *)"Load array size"); // size is 1 above index
                            else
                                emitRO((char *)"MUL", 3, 4, 3, (char *)"Op *");
                            break;
                        case DIV:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"DIV", 3, 4, 3, (char *)"Op /");
                            break;
                        case MOD:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"MOD", 3, 4, 3, (char *)"Op %");
                            break;
                        case RAND:
                            emitRO((char *)"RND", 3, 3, 6, (char *)"Op ?");
                            emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                            // push left side
                            tree->child[0]->pop = true;
                            break;
                        case AND:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"AND", 3, 4, 3, (char *)"Op &");
                            break;
                        case OR:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"OR", 3, 4, 3, (char *)"Op |");
                            break;
                        case EQ:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"TEQ", 3, 4, 3, (char *)"Op ==");
                            break;
                        case NEQ:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"TNE", 3, 4, 3, (char *)"Op !=");
                            break;
                        case GEQ:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"TGE", 3, 4, 3, (char *)"Op >=");
                            break;
                        case LEQ:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"TLE", 3, 4, 3, (char *)"Op <=");
                            break;
                        case LT:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"TLT", 3, 4, 3, (char *)"Op <");
                            break;
                        case GT:
                        //load
                        emitRM((char *)"LD", 4, toffset, 1, (char *)"Pop left into ac1");
                            emitRO((char *)"TGT", 3, 4, 3, (char *)"Op >");
                            break;
                        case NOT:
                            emitRM((char *)"LDC", 4, 1, 6, (char *)"Load 1");
                            emitRO((char *)"XOR", 3, 3, 4, (char *)"Logical not");
                            break;
                        case CHSIGN:
                            tree->child[0]->pop = false;
                            emitRO((char *)"NEG", 3, 3, 3, (char *)"Op Unary -");
                }
                    break;
                case ConstantK:
                
                    if(tree->generated == false)
                    {
                        switch(tree->tokenclass)
                        {
                            case CHARCONST:
                                emitRM((char *)"LDC", 3, (int)tree->cvalue, 6, (char *)"Load char constant");
                                break;
                            case STRINGCONST:
                                break;
                            case NUMCONST:
                            case BOOLCONST:
                                emitRM((char *)"LDC", 3, tree->value, 6, (char *)"Load integer constant");
                                //emitComment((char *)"HERE ");
                                break;
                        }
                    }
                    
                    if(tree->isUnary == true)
                    {
                        tree->pop = false;
                    }
                    
                    // see if push left side
                    if(tree->pop == true)
                    {
                        // Push Left Side
                        emitRM((char *)"ST", 3, toffset, 1, (char *)"Push left side");
                    }
                    
                    break;
                case IdK:
                     
                    break;
                case AssignK:
                    break;
                case InitK:
                    break;
                case CallK:
                    
                    TreeNode *calltemp;
                    int loc;
                    calltemp = (TreeNode *)table->lookupGlobal(tree->name);
                    if(calltemp != NULL)
                    {
                        loc = calltemp->memlocation - emitSkip(0) - 3;
                    }
                    
                    
                    toffset = toffset_old;
                    
                    emitComment((char *)"Param end ", tree->name);
                    emitRM((char *)"LDA", 1, toffset, 1, (char *)"Ghost frame becomes new active frame");
                    emitRM((char *)"LDA", 3, 1, 7, (char *)"Return address in ac");
                    emitRM((char *)"JMP", 7, loc, 7, (char *)"call", tree->name);
                    emitRM((char *)"LDA", 3, 0, 2, (char *)"save the result in ac");
                    emitComment((char *)"Call end ", tree->name);
                    emitComment((char *)"TOFF set: ");
                    
                    //parmc = 0;
                    break;
                default:
                    break;
            }
    }
    
    if(tree->CallParm == true)
    {
        emitComment((char *)"Param ");
        
        pos1 = tree->memlocation;
        pos2 = (tree->isGlobal ? 0 : 1);
        
        if(tree->nodekind == ExpK && tree->subkind.exp == IdK)
        {
            //lhs->memlocation, (lhs->isGlobal ? 0 : 1)
            emitRM((char *)"LD", 3, pos1, pos2, (char *)"Load variable ", tree->name);
        }
        
        emitRM((char *)"ST", 3, toffset--, 1, (char *)"Push parameter");
        emitComment((char *)"TOFF dec: ");
    }
     
}

