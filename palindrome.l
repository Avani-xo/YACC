%{
#include "y.tab.h"
%}

%%
[a-z]+      { yylval.str = strdup(yytext); return STRING; }
[\n\t ]+    ; // skip whitespace
.           return yytext[0];
%%
