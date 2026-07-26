%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token TYPE ID

%%
stmt:
    TYPE list ';'   { printf("Valid declaration\n"); }
    ;

list:
      list ',' ID
    | ID
    ;
%%

void yyerror(const char *s) {
    printf("Invalid declaration\n");
}

int main() {
    printf("Enter declaration:\n");
    yyparse();
    return 0;
}