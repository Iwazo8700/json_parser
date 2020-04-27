

%{
#include <stdio.h>
  #include <stdlib.h>
#include <string.h>
void yyerror(char *c);
int yylex(void);
%}

%token STR NUM EOL


%%

S:
    '{' OBJ '}' S  EOL {printf("VALIDO\n");}
    |
    ;
OBJ:
    STR ':' TOKEN
    | TOKEN ',' OBJ
    ;
TOKEN:
    NUM 
    |STR 
    | '[' VET ']'
    | '{' OBJ '}'
    | '['']'
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
