%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token ID NUM RELOP

%%
input:
    expr '\n' { printf("Valid relational expression\n"); }
    ;

expr:
    operand RELOP operand
    ;

operand:
      ID
    | NUM
    ;
%%

void yyerror(const char *s) {
    printf("Invalid relational expression\n");
}

int main() {
    printf("Enter expression:\n");
    yyparse();
    return 0;
}