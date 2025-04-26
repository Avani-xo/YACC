%{
#include "y.tab.h"
%}

%%
[0-9]+          { yylval = atoi(yytext); return NUM; }
[ \t\n]         ; // Skip whitespace
"+"             return PLUS;
"-"             return MINUS;
"*"             return MUL;
"/"             return DIV;
"("             return LPAREN;
")"             return RPAREN;
.               return yytext[0];
%%
