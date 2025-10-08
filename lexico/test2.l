%option noyywrap
%{
	#include<stdio.h>
	#include"test.h"
%}

%%
[0-9]+[.][0-9]+ { printf("TOKEN_DECIMAL=%s\n", yytext);}
%%
int main()
{
        yylex();
	return 0;
}