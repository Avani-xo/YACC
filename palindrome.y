%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);
int is_palindrome(const char *str);

typedef struct {
    char *str;
} YYSTYPE;

#define YYSTYPE YYSTYPE
%}

%token STRING

%%
input:
    STRING '\n' {
        if (is_palindrome($1.str)) {
            printf("Palindrome\n");
        } else {
            printf("Not a palindrome\n");
        }
        free($1.str);
    }
;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int is_palindrome(const char *str) {
    int len = strlen(str);
    for (int i = 0; i < len / 2; i++) {
        if (str[i] != str[len - i - 1])
            return 0;
    }
    return 1;
}
