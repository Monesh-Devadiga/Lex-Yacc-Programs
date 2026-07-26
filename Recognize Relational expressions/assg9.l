%{
#include "y.tab.h"
%}

%%
"<"|">"|"=="|"!="   { return RELOP; }

[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
[0-9]+                 { return NUM; }

\n                     return '\n';
[ \t]                  ;
.                      return yytext[0];
%%

int yywrap() {
    return 1;
}