%option noyywrap
%{
	#include<stdio.h>
	FILE *yyin;
%}
RESERVADAS ["auto"|"break"|"case"|"char"|"class"|"const"|"continue"|"default"|"delete"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"inline"|"int"|"long"|"namespace"|"new"|"operator"|"private"|"protected"|"public"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"template"|"this"|"throw"|"try"|"typedef"|"union"|"unsigned"|"using"|"virtual"|"void"|"volatile"|"while"|"bool"|"catch"|"false"|"true"|"nullptr"]
COMENTARIOS  ["//"]*|["//"]+["//"]*
VARIABLES  [a-zA-Z][a-zA-Z0-9]*
CONSTANTES_NUMERICAS  [0-9]+|[0-9]+[.][0-9]+
OPERADORES_ARITMETICOS ["++"|"--"|"+"|"-"|"*"|"/"|"%"]
OPERADORES_LOGICOS  ["=="|"!="|"<="|">="|"<"|">"|"&&"|"!"]
SIMBOLOS_ESPECIALES ["("|")"|"|"|"{"|"}"|"\"|";"|","|"."|":"|"#"|"<"|">"]
%% 
{RESERVADAS} { printf("Palabra reservada :%s\n", yytext); }    
{COMENTARIOS} { printf("Comentarios :%s\n", yytext); }
{VARIABLES} { printf("Variables :%s\n", yytext); }
{CONSTANTES_NUMERICAS} { printf("Operador Numerico :%s\n", yytext); }
OPERADORES_ARITMETICOS { printf("Operador Aritmetico :%s\n", yytext); }
{OPERADORES_LOGICOS} { printf("Operador logico :%s\n", yytext); }
{SIMBOLOS_ESPECIALES}  { printf("Simbonolos Especiales :%s\n", yytext); }
.       { printf("%s", yytext); }

%%

int main()
{
        
	FILE *file_7;
	char name[] = "examen1.txt";
	file_7 = fopen(name, "r");
	if (!file_7) {
	    printf("Ocurrio un error al abrir el archivo.\n");
	    return 1;
	}
	yyin = file_7;
	yylex();

	return 0;
}