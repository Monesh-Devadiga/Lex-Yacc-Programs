%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER
%left OR
%left AND
%right NOT

%%
input:
    expr '\n' { printf("Result = %d\n", $1); }
    ;

expr:
      expr OR expr   { $$ = $1 || $3; }
    | expr AND expr  { $$ = $1 && $3; }
    | NOT expr       { $$ = !$2; }
    | '(' expr ')'   { $$ = $2; }
    | NUMBER         { $$ = $1; }
    ;
%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter boolean expression:\n");
    yyparse();
    return 0;
}