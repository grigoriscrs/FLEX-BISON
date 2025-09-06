%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


extern int yylex();
extern int yyparse();
extern int line_num;

extern FILE *yyin;
void yyerror(const char *s);

%}

%token STRING TEXT EQ TAG_CLOSE
%token TAG_MYHTML_OPEN TAG_MYHTML_CLOSE
%token TAG_HEAD_OPEN TAG_HEAD_CLOSE
%token TAG_BODY_OPEN TAG_BODY_CLOSE
%token TAG_TITLE_OPEN TAG_TITLE_CLOSE
%token TAG_META_OPEN
%token TAG_P_OPEN TAG_P_CLOSE
%token TAG_A_OPEN TAG_A_CLOSE
%token TAG_IMG_OPEN
%token TAG_FORM_OPEN TAG_FORM_CLOSE
%token TAG_INPUT_OPEN
%token TAG_LABEL_OPEN TAG_LABEL_CLOSE
%token TAG_DIV_OPEN TAG_DIV_CLOSE

%token ATTR_ID ATTR_HREF ATTR_SRC ATTR_ALT ATTR_WIDTH ATTR_HEIGHT
%token ATTR_STYLE ATTR_TYPE ATTR_VALUE ATTR_FOR
%token ATTR_CHARSET ATTR_NAME ATTR_CONTENT ATTR_CHECKBOXCOUNT

%%

program:
    myhtml
; 

myhtml:
    TAG_MYHTML_OPEN head_opt body TAG_MYHTML_CLOSE
;

head_opt:
    /* empty */
  | head
;

head:
    TAG_HEAD_OPEN head_elements TAG_HEAD_CLOSE
;

head_elements:  title 
  | title meta_list;
;

title:
    TAG_TITLE_OPEN text2 TAG_TITLE_CLOSE 
;

meta_list: meta | meta_list meta
;

meta: TAG_META_OPEN  meta_attrs  TAG_CLOSE ;

meta_attrs:
    ATTR_CHARSET EQ STRING 
  | ATTR_NAME  EQ STRING ATTR_CONTENT EQ STRING 
;

body:
    TAG_BODY_OPEN body_elements_opt TAG_BODY_CLOSE
;

body_elements_opt:
    /* empty */
  | body_elements
;

body_elements:
    body_elements body_element
  | body_element
;

body_element:
    p
  | a
  | img
  | form
  | div
;

p:
    TAG_P_OPEN p_attrs_opt TAG_CLOSE text2 TAG_P_CLOSE
  | TAG_P_OPEN p_attrs_opt TAG_CLOSE TAG_P_CLOSE
;

p_attrs_opt:
    /* empty */
  | ATTR_ID EQ STRING
  | ATTR_ID EQ STRING ATTR_STYLE EQ STRING
  | ATTR_STYLE EQ STRING ATTR_ID EQ STRING
;

a:
    TAG_A_OPEN a_attrs TAG_CLOSE a_content TAG_A_CLOSE
;

a_attrs:
    ATTR_ID EQ STRING ATTR_HREF EQ STRING
  | ATTR_HREF EQ STRING ATTR_ID EQ STRING
;

a_content:
    text2
  | img
  | text2 img
  | img text2
;

img:
    TAG_IMG_OPEN img_attrs TAG_CLOSE
;

img_attrs:
    ATTR_ID EQ STRING img_attr1 img_attr2 
    
img_attr1: ATTR_SRC EQ STRING ATTR_ALT EQ STRING
          | ATTR_ALT EQ STRING ATTR_SRC EQ STRING

img_attr2: ATTR_WIDTH EQ STRING ATTR_HEIGHT EQ STRING
          |ATTR_HEIGHT EQ STRING ATTR_WIDTH EQ STRING
          | ATTR_WIDTH EQ STRING
          |ATTR_HEIGHT EQ STRING
 

;

form:
    TAG_FORM_OPEN form_attrs_opt TAG_CLOSE form_elements TAG_FORM_CLOSE
;

form_attrs_opt:
    /* empty */
  | ATTR_ID EQ STRING
  | ATTR_ID EQ STRING ATTR_STYLE EQ STRING
;

form_elements:
    form_elements form_element
  | form_element
;

form_element:
    input
  | label
;

input:
    TAG_INPUT_OPEN input_attrs TAG_CLOSE
;

input_attrs:
    ATTR_ID EQ STRING ATTR_TYPE EQ STRING
  | ATTR_ID EQ STRING ATTR_TYPE EQ STRING ATTR_VALUE EQ STRING
  | ATTR_ID EQ STRING ATTR_TYPE EQ STRING ATTR_STYLE EQ STRING
;

label:
    TAG_LABEL_OPEN label_attrs TAG_CLOSE text2 TAG_LABEL_CLOSE
;

label_attrs:
    ATTR_ID EQ STRING ATTR_FOR EQ STRING
  | ATTR_ID EQ STRING ATTR_FOR EQ STRING ATTR_STYLE EQ STRING
;

div:
    TAG_DIV_OPEN div_attrs_opt TAG_CLOSE body_elements_opt TAG_DIV_CLOSE
;

div_attrs_opt:
    /* empty */
  | ATTR_ID EQ STRING
  | ATTR_ID EQ STRING ATTR_STYLE EQ STRING
;

text2: TEXT | text2 TEXT;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax error - line %d: [ %s ] \n\n", line_num, s);
   
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "You must enter: %s <filname>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("File not found !");
        return 1;
    }

    if (yyparse() == 0) {
        printf("\n Your file is syntactic correct.\n");
    } else {
        printf("\n !!! Your file is not syntactic correct !!! \n");
    }
    printf("\n\n");
    fclose(yyin);
    return 0;
}