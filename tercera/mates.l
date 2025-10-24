%option noyywrap
%{
	#include<stdio.h>
	int lineas =0;
	int palabras =0;
	int caracteres =0;
	int ni =0;
	int num =0;
	int b =0;
	int jo =0;
	int digitos =0;
%}
INICIAN_NI ["NI"|"ni"]+[a-zA-Z]+
INICIAN_NUM ["NUM"|"num"]+[a-zA-Z]+
INICIAN_B  ["B"|"b"]+[a-zA-Z]["TO"|"to"]
TERMINAN_JO [J|j][O|o]+[a-zA-Z]
DIGITOS [0-9]+
CARACTERES [a-zA-Z0-9|" "]{1}
LINEAS ["\n"]
PALABRAS  [A-Za-z]+
%%
{INICIAN_NI}      { ni++; }
{INICIAN_NUM}     { num++; }
{INICIAN_B}       { b++; }
{TERMINAN_JO}     { jo++; }
{DIGITOS}         { digitos++; }
{CARACTERES}      { caracteres++; }
{LINEAS}          { lineas++; }
{PALABRAS}        { palabras++; }

%%
int main()
{

	FILE *file_7;
	char name[] = "elbrutodelasmates.txt";
	file_7 = fopen(name, "r");
	if (!file_7) {
	    printf("Ocurrio un error al abrir el archivo.\n");
	    return 1;
	}
	yyin = file_7;
	yylex();

	    printf("Empiezan por NI: %s\n", ni);
	    printf("Empiezan por nu: %s\n", num);
	    printf("Empieza por n: %s\n", b);
	    printf("Terminan en jo: %s\n", jo);
	    printf("Digitos: %s\n", digitos);
	    printf("Caracteres: %s\n", caracteres);
	    printf("Lineas: %s\n", lineas);
	    printf("Palabras: %s\n", palabras);



	return 0;
}