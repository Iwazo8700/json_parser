
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

INT [0-9]+
FLOAT [0-9]+[.][0-9]+
STRING [\"\'][A-Za-z0-9\.\,\;\:\-\ ]*[\"\']


%%


[\{] {return *yytext;}
[\}] {return *yytext;}
[\[] {return *yytext;}
[\]] {return *yytext;}
[,] {return *yytext;}
[:] {return *yytext;}
{FLOAT} {return NUM;}
{INT} {return NUM;}
{STRING} {return STR;}
[[:space]] ;
[\n]+ ;
. ;

%%

int yywrap() {
  return 1;
}
