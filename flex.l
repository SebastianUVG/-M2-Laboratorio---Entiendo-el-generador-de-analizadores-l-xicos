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

"//".*     { /* ignorar */ }
"/*"([^*]|\*+[^*/])*\*+"/"    { /* ignorar */ }


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


{CIENTIFICOS}       {printf("Cientificos: %s\n", yytext); }
{HEXADECIMALES}     {printf("Hexadecimales: %s\n", yytext); }
{FLOTANTES}    {printf("Flotantes: %s\n", yytext); }
{ENTEROS}       {printf("Entero: %s\n", yytext); }
{ID}        {printf("Identificador: %s\n", yytext); }

[ \t\n]+        { }

.       { printf("No Reconocido: %s\n", yytext); }


%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

