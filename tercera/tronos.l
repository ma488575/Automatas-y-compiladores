%option noyywrap
%{
	#include<stdio.h>
	FILE *yyin;
	int lugares = 0;
	int westeros = 0;
	int Invernalia = 0;
	int Desembarco_del_rey = 0;
	int Nido_de_aguilas = 0;
	int Altojardin = 0;
	int Aguasdulces = 0;
	int Roca_dragon = 0;
	int Roca_casterly = 0;
	int Bastion_tormentas = 0;
	int Dorne = 0;

	int casas = 0;
	int stark = 0;
	int arryn = 0;
	int tully = 0;
	int greyjoy = 0;
	int lannister = 0;
	int tyrell = 0;
	int martell = 0;
	int baratheon = 0;
	int targaryen = 0;

	int personajes = 0;
	int casa_stark = 0;
	int casa_baratheon = 0;
	int casa_targaryen = 0;
	int casa_lannister = 0;
%}

Westeros [W|w]["esteros"]
Invernalia [I|i]["nvernalia"]
Desem [D|d]["esembarco del rey"]
Nido [N|n]["ido de "][a-z\xC3\xA1\xC3\x81]["guilas"]
Alto [A|a]["ltojard"][a-z\xC3\x8D][n]
Aguas [A|a]["guasdulces"]
Roca [R|r]["ocadrag"][a-z\xC3\xB3][n]
RocaC [R|r]["oca "][C|c]["asterly"]
Bastion [B|b]["asti"][a-z\xC3\xB3][n][" de "][T|t]["ormentas"]
Dorne [D|d]["orne"]
Stark [S|s]["tark"]
Arryn [A|a]["rryn"]
Tully [T|t]["ully"]
Greyjoy [G|g]["reyjoy"]
Lannister [L|l]["annister"]
Tyrell [T|t]["yrell"]
Martell [M|m]["artell"]
Bara [B|b]["aratheon"]
Targa [T|t]["argaryen"]
Eddard  [E|e]["ddard"]
Catelyn [C|c]["atelyn"]
Arya    [A|a]["rya"]
Sansa   [S|s]["ansa"]
Robert   [R|r]["obert"]
Joffrey  [J|j]["offrey"]
Stannis  [S|s]["tannis"]
Aegon     [A|a]["egon"]
Daenerys  [D|d]["aenerys"]
Aer     [A|a]["erys"]
Tywin   [T|t]["ywin"]
Jaime   [J|j]["aime"]
Tyrion  [T|t]["yrion"]
Cersei  [C|c]["ersei"]

%%
{Westeros}             { westeros++; lugares++;}
{Invernalia}           { Invernalia++; lugares++; }
{Desem}                { Desembarco_del_rey++; lugares++; }
{Nido}                 { Nido_de_aguilas++; lugares++; }
{Alto}                 { Altojardin++; lugares++; }
{Aguas}                { Aguasdulces++; lugares++; }
{Roca}                 { Roca_dragon++; lugares++; }
{RocaC}                { Roca_casterly++; lugares++; }
{Bastion}              { Bastion_tormentas++; lugares++; }
{Dorne}                { Dorne++; lugares++; }
{Stark}                { stark++; casas++; }
{Arryn}                { arryn++; casas++;}
{Tully}                { tully++; casas++;}
{Greyjoy}              { greyjoy++; casas++;}
{Lannister}            { lannister++; casas++;}
{Tyrell}               { tyrell++; casas++;}
{Martell}              { martell++; casas++;}
{Bara}                 { baratheon++; casas++;}
{Targa}                { targaryen++; casas++;}
{Eddard}               { casa_stark++; personajes++;}
{Catelyn}              { casa_stark++; personajes++;}

{Sansa}                { casa_stark++; personajes++;}
{Robert}               { casa_baratheon++; personajes++;}
{Joffrey}              { casa_baratheon++; personajes++;}
{Stannis}              { casa_baratheon++; personajes++;}
{Aegon}                { casa_targaryen++; personajes++;}


{Tywin}                { casa_lannister++; personajes++;}
{Jaime}                { casa_lannister++; personajes++;}
{Tyrion}               { casa_lannister++; personajes++;}
{Cersei}               { casa_lannister++; personajes++;}
%%
int main()

{
	FILE *file_7;
	char name[] = "tronos.txt";
	file_7 = fopen(name, "r");
	if (!file_7) {
	    printf("Ocurrio un error al abrir el archivo.\n");
	    return 1;
	}
	 yyin = file_7;  
	 yylex();         
	 fclose(file_7);

	    



	    printf("Lugares: %d\n", lugares);
	    printf("  Westeros: %d\n", westeros);
	    printf("  Invernalia: %d\n", Invernalia);
	    printf("  Desembarco del Rey: %d\n", Desembarco_del_rey);
	    printf("  Nido de aguilas: %d\n", Nido_de_aguilas);
	    printf("  Altojardin: %d\n", Altojardin);
	    printf("  Aguasdulces: %d\n", Aguasdulces);
	    printf("  Roca Dragon: %d\n", Roca_dragon);
	    printf("  Roca Casterly: %d\n", Roca_casterly);
	    printf("  Bastion de Tormentas: %d\n", Bastion_tormentas);
	    printf("  Dorne: %d\n\n", Dorne);
	    printf("Casas: %d\n", casas);
	    printf("  Stark: %d\n", stark);
	    printf("  Arryn: %d\n", arryn);
	    printf("  Tully: %d\n", tully);
	    printf("  Greyjoy: %d\n", greyjoy);
	    printf("  Lannister: %d\n", lannister);
	    printf("  Tyrell: %d\n", tyrell);
	    printf("  Martell: %d\n", martell);
	    printf("  Baratheon: %d\n", baratheon);
	    printf("  Targaryen: %d\n\n", targaryen);
	    printf("Personajes: %d\n", personajes);
	    printf("Personajes Casa Stark: %d\n", casa_stark);
	    printf("Personajes Casa Baratheon: %d\n", casa_baratheon);
	    printf("Personajes Casa Targaryen: %d\n", casa_targaryen);
	    printf("Personajes Casa Lannister: %d\n\n", casa_lannister);

	return 0;
}