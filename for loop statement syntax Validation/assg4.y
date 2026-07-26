%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token FOR ID NUM RELOP INC

%%
stmt:
    FOR '(' init ';' cond ';' inc ')' 
        { printf("Valid for loop\n"); }
    ;

init:
    ID '=' NUM
    ;

cond:
    ID RELOP NUM
    ;

inc:
    ID INC
    ;

%%

void yyerror(const char *s) {
    printf("Invalid for loop\n");
}

int main() {
    printf("Enter for loop:\n");
    yyparse();
    return 0;
}