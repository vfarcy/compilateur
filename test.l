%{
#include <stdio.h>
%}

%%
[0-9]+          { printf("NOMBRE : %s\n", yytext); }
[a-zA-Z]+       { printf("MOT    : %s\n", yytext); }
[ \t\n]         { /* On ignore les espaces, tabulations et retours à la ligne */ }
.               { printf("AUTRE  : %s\n", yytext); }
%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

