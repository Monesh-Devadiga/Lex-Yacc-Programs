%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%
"&&"      { return AND; }
"||"      { return OR; }
"!"       { return NOT; }
[0-1]     { yylval = atoi(yytext); return NUMBER; }
\n        return '\n';
[ \t]     ;
.         return yytext[0];
%%

int yywrap() {
    return 1;
}