

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(char *c);
int yylex(void);
%}


%token  '{' '}' ':' '[' ']' ',' STR NUM 


%%

S:
    '{' OBJ '}' S {printf("VALIDO\n");}
    |
    ;
OBJ:
    STR ':' TOKEN
    |OBJ ',' OBJ
    ;
TOKEN:
    NUM 
    |STR 
    | '[' VET ']'
    | '{' OBJ '}'
    | '[]'
    ;
VET:
    TOKEN
    |VET ',' VET
    
    ;

%%

void yyerror(char *s) {
    printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
