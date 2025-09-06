%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bison.tab.h"

int line_num = 1;
%}

%option noyywrap
%x MCOMMENT


%%

"<!--"            { BEGIN(MCOMMENT); }
<MCOMMENT>"-->"   { BEGIN(INITIAL); }
<MCOMMENT>.       { printf("%s",yytext); }
<MCOMMENT>[\n]      { printf("%s",yytext); line_num++; }




[\n]                { printf("%s",yytext); line_num++; }

[ ]   { printf("%s",yytext);}
[\t\r]+              { printf("%s",yytext);}


"<MYHTML>"        { printf("%s",yytext); return TAG_MYHTML_OPEN; }
"</MYHTML>"       { printf("%s",yytext); return TAG_MYHTML_CLOSE; }

"<head>"          { printf("%s",yytext); return TAG_HEAD_OPEN; }
"</head>"         { printf("%s",yytext); return TAG_HEAD_CLOSE; }

"<body>"          { printf("%s",yytext); return TAG_BODY_OPEN; }
"</body>"         { printf("%s",yytext); return TAG_BODY_CLOSE; }

"<title>"         { printf("%s",yytext); return TAG_TITLE_OPEN; }
"</title>"        { printf("%s",yytext); return TAG_TITLE_CLOSE; }

"<meta"           { printf("%s",yytext); return TAG_META_OPEN; }
"<p"              { printf("%s",yytext); return TAG_P_OPEN; }
"</p>"            { printf("%s",yytext); return TAG_P_CLOSE; }

"<a"              { printf("%s",yytext); return TAG_A_OPEN; }
"</a>"            { printf("%s",yytext); return TAG_A_CLOSE; }

"<img"            { printf("%s",yytext); return TAG_IMG_OPEN; }
"<form"           { printf("%s",yytext); return TAG_FORM_OPEN; }
"</form>"         { printf("%s",yytext); return TAG_FORM_CLOSE; }

"<input"          { printf("%s",yytext); return TAG_INPUT_OPEN; }
"<label"          { printf("%s",yytext); return TAG_LABEL_OPEN; }
"</label>"        { printf("%s",yytext); return TAG_LABEL_CLOSE; }

"<div"   { printf("%s",yytext); return TAG_DIV_OPEN; }
"</div>" { printf("%s",yytext); return TAG_DIV_CLOSE; }

"charset"   { printf("%s",yytext); return ATTR_CHARSET; }
"id"  { printf("%s",yytext); return ATTR_ID; }
"href"   { printf("%s",yytext); return ATTR_HREF; }
"src" { printf("%s",yytext); return ATTR_SRC; }
"alt" { printf("%s",yytext); return ATTR_ALT; }
"width"  { printf("%s",yytext); return ATTR_WIDTH; }
"height" { printf("%s",yytext); return ATTR_HEIGHT; }
"style"  { printf("%s",yytext); return ATTR_STYLE; }
"type"   { printf("%s",yytext);return ATTR_TYPE; }
"value"  { printf("%s",yytext); return ATTR_VALUE; }
"for" { printf("%s",yytext); return ATTR_FOR; }
"name"   { printf("%s",yytext); return ATTR_NAME; }
"content"   { printf("%s",yytext); return ATTR_CONTENT; }
"checkboxcount"   { printf("%s",yytext); return ATTR_CHECKBOXCOUNT; }

">" { printf("%s",yytext); return TAG_CLOSE; }
"=" { printf("%s",yytext); return EQ; }

\"([^\"\n])*\"  { printf("%s",yytext); return STRING; }
[^ \n=<>]+ { printf("%s",yytext); return TEXT; }

.  { printf("%s",yytext);}

%%
