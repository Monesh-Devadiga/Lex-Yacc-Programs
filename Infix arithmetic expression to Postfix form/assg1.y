%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);

char temp[1000];
%}

%union {
    char str[1000];
}

%token <str> ID
%left '+' '-'
%left '*' '/'

%type <str> expr

%%
input:
    expr '\n' { printf("Postfix: %s\n", $1); }
    ;

expr:
      expr '+' expr {
            sprintf(temp, "%s %s +", $1, $3);
            strcpy($$, temp);
      }
    | expr '-' expr {
            sprintf(temp, "%s %s -", $1, $3);
            strcpy($$, temp);
      }
    | expr '*' expr {
            sprintf(temp, "%s %s *", $1, $3);
            strcpy($$, temp);
      }
    | expr '/' expr {
            sprintf(temp, "%s %s /", $1, $3);
            strcpy($$, temp);
      }
    | '(' expr ')' {
            strcpy($$, $2);
      }
    | ID {
            strcpy($$, $1);
      }
    ;
%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter infix expression:\n");
    yyparse();
    return 0;
}