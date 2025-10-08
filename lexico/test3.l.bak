%option noyywrap
%{
	#include<stdio.h>
	#include"test.h"
%}

%%
[a-zA-Z][(_)a-zA-Z0-9]* { printf("TOKEN_VARIABLE=%s\n", yytext);}
%%
int main()
{
        yylex();
	return 0;
}