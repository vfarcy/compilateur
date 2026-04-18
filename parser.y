%{
#include <stdio.h>
#include <stdlib.h>

/* Prototypes pour éviter les warnings */
int yylex();
void yyerror(const char *s);
%}

/* Définition des jetons */
%token NUM WORD

%%
/* Une grammaire très simple : une liste de lignes */
programme:
    /* vide */
    | programme ligne
    ;

ligne:
    NUM  { printf("Bison a reçu un NOMBRE !\n"); }
    | WORD { printf("Bison a reçu un MOT !\n"); }
    ;
%%

/* Fonction appelée en cas d'erreur de syntaxe */
void yyerror(const char *s) {
    fprintf(stderr, "Erreur syntaxique : %s\n", s);
}

int main() {
    printf("Tapez des mots ou des nombres (Ctrl+D pour quitter) :\n");
    yyparse();
    return 0;
}

