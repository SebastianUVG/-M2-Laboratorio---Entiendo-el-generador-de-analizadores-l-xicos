%{
#include <stdio.h>
%}

/* Definiciones */
LETRA      [a-zA-Z]
DIGITO     [0-9]
ID         ({LETRA}|_)({LETRA}|{DIGITO}|_)*

%%

{ID}        { printf("IDENTIFICADOR: %s\n", yytext); }

[ \t\n]+    { /* ignorar espacios */ }

.           { printf("CARACTER NO VALIDO: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
