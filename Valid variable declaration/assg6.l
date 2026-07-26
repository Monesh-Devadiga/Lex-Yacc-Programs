%{
#include "y.tab.h"
%}

%%
"int"|"float"|"char"   { return TYPE; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }
","                    { return ','; }
";"                    { return ';'; }
[ \t\n]                ;
.                      return yytext[0];
%%

int yywrap() {
    return 1;
}