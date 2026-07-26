%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%%
input:
      S '\n'   { printf("Balanced\n"); }
    ;

S:
      '(' S ')' S
    | 
    ;
%%

void yyerror(const char *s) {
    printf("Not Balanced\n");
}

int main() {
    printf("Enter expression:\n");
    yyparse();
    return 0;
}