%{
#include <stdio.h>
%}

/* Definiciones */
LETRA       [a-zA-Z]
DIGITO      [0-9]
ENTEROS     {DIGITO}+
HEXADECIMALES       0[xX][0-9a-fA-F]+
CIENTIFICOS     {DIGITO}+(\.{DIGITO}+)?[eE][+-]?{DIGITO}+
FLOTANTES       {DIGITO}+"."{DIGITO}+
ID      [a-zA-Z_][a-zA-Z0-9_]*


%%

\/\/.*                              { /* ignorar comentario de línea */ }
\/\*([^*]|\*+[^*/])*\*+\/            { /* ignorar comentario multilínea */ }

\"([^\\\"]|\\[nt\"\\])*\"    {
    printf("Cadena: %s\n", yytext);
}


"=="        { printf("Relacional: ==\n"); }
"!="        { printf("Relacional: !=\n"); }
"<="        { printf("Relacional: <=\n"); }
">="        { printf("Relacional: >=\n"); }

"&&"        { printf("Logico : &&\n"); }
"||"        { printf("Logico: ||\n"); }

"<"     { printf("Relacional : <\n"); }
">"     { printf("Relacional: >\n"); }
"!"     { printf("Logico: !\n"); }

"+"     { printf("Aritmetico: +\n"); }
"-"     { printf("Aritmetico: -\n"); }
"*"     { printf("Aritmetico: *\n"); }
"/"     { printf("Aritmetico: /\n"); }


{CIENTIFICOS}       {printf("Cientifico: %s\n", yytext); }
{HEXADECIMALES}     {printf("Hexadecimal: %s\n", yytext); }
{FLOTANTES}    {printf("Flotante: %s\n", yytext); }
{ENTEROS}       {printf("Entero: %s\n", yytext); }
{ID}        {printf("\033[1;34mIDENTIFICADOR: %s\033[0m\n", yytext);}

[[:space:]]+    { /* ignorar espacios en blanco */ }

.       { printf("NO RECONOCIDO: %s\n", yytext); }


%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

