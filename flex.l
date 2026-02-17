%{
#include <stdio.h>
%}

/* Definiciones */
LETRA       [a-zA-Z]
DIGITO      [0-9]
ID          ({LETRA}|_)({LETRA}|{DIGITO}|_)*

ENTEROS     [0-9]+
FLOTANTES       [0-9]+"."[0-9]+
CIENTIFICOS     ([0-9]+"."[0-9]+|[0-9]+)[eE][+-]?[0-9]+
HEXADECIMALES   0[xX][0-9a-fA-F]+


%%

{CIENTIFICOS}   {printf("Numero Cientificos: %s\n" , yytext);}
{FLOTANTES}     {printf("Numero Flotantes: %s\n" , yytext);}
{HEXADECIMALES}     {printf("Numero Hexadecimaless: %s\n" , yytext);}
{ENTEROS}       {printf("Numero Enteros: %s\n" , yytext);}



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

