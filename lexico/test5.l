%option noyywrap
%{
	#include<stdio.h>
	#include"test.h"
%}

%%
[A-Z]{4}[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1|2][0-9]|3[0-1])[A-Z0-9]{3} { printf("TOKEN_RFC=%s\n", yytext);}
%%
int main()
{
        yylex();
	return 0;
}