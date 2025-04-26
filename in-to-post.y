%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);
%}

%token NUM
%token PLUS MINUS MUL DIV LPAREN RPAREN

%left PLUS MINUS
%left MUL DIV

%%

input:
    expr '\n' { printf("\n"); }
;

expr:
    expr PLUS expr   { printf("+ "); }
  | expr MINUS expr  { printf("- "); }
  | expr MUL expr    { printf("* "); }
  | expr DIV expr    { printf("/ "); }
  | LPAREN expr RPAREN { /* no output for parentheses */ }
  | NUM              { printf("%d ", $1); }
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
