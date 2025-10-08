%option noyywrap
%{
	#include<stdio.h>
	#include"test.h"
%}

%%
[A-Z]{4}[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1|2][0-9]|3[0-2])[H|M|X]{1}[A-Z]{5}[A-Z0-9]{1}[0-9] { printf("TOKEN_CURP=%s\n", yytext);}
%%
int main()
{
        yylex();
	return 0;
}