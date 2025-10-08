%option noyywrap
%{
	#include<stdio.h>
	#include"test.h"
%}

%%
[a-z]{2}[0-9]{6}["@uaeh.edu.mx"] { printf("TOKEN_EMAIL=%s\n", yytext);}
%%
int main()
{
        yylex();
	return 0;
}