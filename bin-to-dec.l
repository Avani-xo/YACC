%{
#include "y.tab.h"
%}

%%
[01]+      { yylval = strtol(yytext, NULL, 2); return BINARY; }
[ \t\n]+   ; // Skip whitespace
.          return yytext[0];
%%
