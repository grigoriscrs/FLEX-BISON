/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

#ifndef YY_YY_BISON_TAB_H_INCLUDED
# define YY_YY_BISON_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    STRING = 258,
    TEXT = 259,
    EQ = 260,
    TAG_CLOSE = 261,
    TAG_MYHTML_OPEN = 262,
    TAG_MYHTML_CLOSE = 263,
    TAG_HEAD_OPEN = 264,
    TAG_HEAD_CLOSE = 265,
    TAG_BODY_OPEN = 266,
    TAG_BODY_CLOSE = 267,
    TAG_TITLE_OPEN = 268,
    TAG_TITLE_CLOSE = 269,
    TAG_META_OPEN = 270,
    TAG_P_OPEN = 271,
    TAG_P_CLOSE = 272,
    TAG_A_OPEN = 273,
    TAG_A_CLOSE = 274,
    TAG_IMG_OPEN = 275,
    TAG_FORM_OPEN = 276,
    TAG_FORM_CLOSE = 277,
    TAG_INPUT_OPEN = 278,
    TAG_LABEL_OPEN = 279,
    TAG_LABEL_CLOSE = 280,
    TAG_DIV_OPEN = 281,
    TAG_DIV_CLOSE = 282,
    ATTR_ID = 283,
    ATTR_HREF = 284,
    ATTR_SRC = 285,
    ATTR_ALT = 286,
    ATTR_WIDTH = 287,
    ATTR_HEIGHT = 288,
    ATTR_STYLE = 289,
    ATTR_TYPE = 290,
    ATTR_VALUE = 291,
    ATTR_FOR = 292,
    ATTR_CHARSET = 293,
    ATTR_NAME = 294,
    ATTR_CONTENT = 295,
    ATTR_CHECKBOXCOUNT = 296
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_BISON_TAB_H_INCLUDED  */
