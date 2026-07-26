%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%
[0-9]+"."[0-9]+   { yylval.type = 2; return NUM; }  // float
[0-9]+            { yylval.type = 1; return NUM; }  // int

\n                return '\n';
[ \t]             ;
.                 return yytext[0];
%%

int yywrap() {
    return 1;
}