%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);

int sym[26];
%}

%token NUMBER ID
%left '+' '-'
%left '*' '/'

%%
input:
      input line
    |
    ;

line:
      ID '=' expr '\n' { sym[$1 - 'a'] = $3; }
    | expr '\n'        { printf("Result = %d\n", $1); }
    ;

expr:
      expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   { $$ = $1 / $3; }
    | '(' expr ')'    { $$ = $2; }
    | NUMBER          { $$ = $1; }
    | ID              { $$ = sym[$1 - 'a']; }
    ;
%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter expressions:\n");
    yyparse();
    return 0;
}