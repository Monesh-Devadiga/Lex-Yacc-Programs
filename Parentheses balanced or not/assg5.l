%{
#include "y.tab.h"
%}

%%
"("     return '(';
")"     return ')';
\n      return '\n';
[ \t]   ;
.       ;   // ignore other characters
%%

int yywrap() {
    return 1;
}