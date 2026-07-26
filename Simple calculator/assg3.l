%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%
[a-z]      { yylval = yytext[0]; return ID; }
[0-9]+     { yylval = atoi(yytext); return NUMBER; }
\n         { return '\n'; }   // critical
[ \t]      ;
.          { return yytext[0]; }
%%

int yywrap() {
    return 1;
}