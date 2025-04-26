%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUM
%token PLUS MINUS MUL DIV
%token LPAREN RPAREN

%left PLUS MINUS
%left MUL DIV

%%
input:
    expr '\n'  { printf("Result: %d\n", $1); }
;

expr:
    expr PLUS expr   { $$ = $1 + $3; }
  | expr MINUS expr  { $$ = $1 - $3; }
  | expr MUL expr    { $$ = $1 * $3; }
  | expr DIV expr    {
        if ($3 == 0) {
            yyerror("Division by zero");
            YYABORT;
        } else {
            $$ = $1 / $3;
        }
    }
  | LPAREN expr RPAREN { $$ = $2; }
  | NUM                { $$ = $1; }
;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
