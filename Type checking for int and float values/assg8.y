%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%union {
    int type;   // 1 = int, 2 = float
}

%token <type> NUM
%type <type> expr

%left '+' '-' '*' '/'

%%
input:
    expr '\n' {
        if($1 == 1) printf("Valid expression of type INT\n");
        else if($1 == 2) printf("Valid expression of type FLOAT\n");
    }
    ;

expr:
      expr '+' expr {
            if($1 == $3) $$ = $1;
            else { printf("Type Error\n"); exit(0); }
      }
    | expr '-' expr {
            if($1 == $3) $$ = $1;
            else { printf("Type Error\n"); exit(0); }
      }
    | expr '*' expr {
            if($1 == $3) $$ = $1;
            else { printf("Type Error\n"); exit(0); }
      }
    | expr '/' expr {
            if($1 == $3) $$ = $1;
            else { printf("Type Error\n"); exit(0); }
      }
    | '(' expr ')' { $$ = $2; }
    | NUM          { $$ = $1; }
    ;
%%

void yyerror(const char *s) {
    printf("Invalid expression\n");
}

int main() {
    printf("Enter expression:\n");
    yyparse();
    return 0;
}