%option noyywrap
%{
	#include<stdio.h>
	#include"test.h"
%}
TOKEN_NUMERO [0-9]+

%%
[0-9]+ { printf("TOKEN_NUMERO=%s\n", yytext);}
%%
int main()
{
        yylex();
	return 0;
}