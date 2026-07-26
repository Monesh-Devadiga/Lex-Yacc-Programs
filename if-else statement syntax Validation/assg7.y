%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token IF ELSE ID NUM RELOP

%nonassoc IFX
%nonassoc ELSE

%%
stmt:
      IF '(' cond ')' stmt %prec IFX   { printf("Valid if statement\n"); }
    | IF '(' cond ')' stmt ELSE stmt   { printf("Valid if-else statement\n"); }
    | ID '=' NUM ';'
    ;

cond:
    ID RELOP NUM
    ;
%%

void yyerror(const char *s) {
    printf("Invalid if-else statement\n");
}

int main() {
    printf("Enter statement:\n");
    yyparse();
    return 0;
}