%{
#include "parser.tab.h"  /* Récupère les définitions des tokens de Bison */
%}

%option noinput
%option nounput

%%
[0-9]+          { return NUM; }    /* On envoie le jeton NUM à Bison */
[a-zA-Z]+       { return WORD; }   /* On envoie le jeton WORD à Bison */
[ \t\n]         { /* Ignorer les espaces */ }
.               { return yytext[0]; } /* Renvoie n'importe quel autre caractère */
%%

int yywrap() {
    return 1;
}

