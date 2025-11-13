%option noyywrap
%{
	#include<stdio.h>
	FILE *yyin;
	
	int pa = 0;
	int apa = 0;
	int runrun = 0;
	int madrecita = 0;
	int manitos = 0;
	int guayos = 0;
	int zumbambico = 0;
	int estoraque = 0;
	int diciembre = 0;
	int llenarseme = 0;
	int cucarachas = 0;
	int eavemaria = 0;
	int cachupe = 0;
	int ome = 0;
	int berraco = 0;
	int colimotes = 0;
	int toditico = 0;
	int atisbo = 0;
	int ama = 0;
	int callaitos = 0;
	int revolotiado = 0;
	int achicopalado = 0;
	int onde = 0;
	int allacito = 0;
	int toditicos = 0;
	int buste = 0;
	int mismito = 0;
	int pegaditicos = 0;
	int surrongo = 0;
	int calorcito = 0;
	int estico = 0;
	
	int total_palabras = 0;
%}

EAVEMARIA [E|e]["avemar"]([\xC3\x8D]|\xC3\xAD)["a"]
OME [Oo][Mm][Ee]
PA [Pp][Aa]([\']|\xE2\x80\x99)
APA [Aa]["Pp"]([\xC3\x81]|\xC3\xA1)
RUNRUN [Rr][Uu][Nn][Rr]((\xC3\x9A)|(\xC3\xBA))[Nn]
MADRECITA [Mm][Aa][Dd][Rr][Ee][Cc][Ii][Tt][Aa]
MANITOS [Mm][Aa][Nn][Ii][Tt][Oo][Ss]
GUAYOS [Gg][Uu][Aa][Yy][Oo][Ss]
ZUMBAMBICO [Zz][Uu][Mm][Bb][Aa][Mm][Bb][Ii][Cc][Oo]
ESTORAQUE [Ee][Ss][Tt][Oo][Rr][Aa][Qq][Uu][Ee]
DICIEMBRE [Dd][Ii][Cc][Ii][Ee][Mm][Bb][Rr][Ee]
LLENARSEME [Ll][Ll][Ee][Nn]((\xC3\x81)|(\xC3\xA1))[Rr][Ss][Ee][Mm][Ee]
CUCARACHAS [Cc][Uu][Cc][Aa][Rr][Aa][Cc][Hh][Aa][Ss]
CACHUPE [Cc][Aa][Cc][Hh][Uu][Pp][Ee]
BERRACO [Bb][Ee][Rr][Rr][Aa][Cc][Oo]
COLIMOTES [Cc][Oo][Ll][Ii][Mm][Oo][Tt][Ee][Ss]
TODITICO [Tt][Oo][Dd][Ii][Tt][Ii][Cc][Oo]
ATISBO [Aa][Tt][Ii][Ss][Bb][Oo]
AMA [Aa][Mm][Aa]
CALLAITOS [Cc][Aa][Ll][Ll][Aa][Ii][Tt][Oo][Ss]
REVOLOTIADO [Rr][Ee][Vv][Oo][Ll][Oo][Tt][Ii][Aa][Dd][Oo]
ACHICOPALADO [Aa][Cc][Hh][Ii][Cc][Oo][Pp][Aa][Ll][Aa][Dd][Oo]
ONDE [Oo][Nn][Dd][Ee]
ALLACITO [Aa][Ll][Ll][Aa][Cc][Ii][Tt][Oo]
TODITICOS [Tt][Oo][Dd][Ii][Tt][Ii][Cc][Oo][Ss]
BUSTE [Bb][Uu][Ss][Tt][Ee]
MISMITO [Mm][Ii][Ss][Mm][Ii][Tt][Oo]
PEGADITICOS [Pp][Ee][Gg][Aa][Dd][Ii][Tt][Ii][Cc][Oo][Ss]
SURRONGO [Ss][Uu][Rr][Rr][Oo][Nn][Gg][Oo]
CALORCITO [Cc][Aa][Ll][Oo][Rr][Cc][Ii][Tt][Oo]
ESTICO [Ee][Ss][Tt][Ii][Cc][Oo]

%%

{EAVEMARIA} { eavemaria++; total_palabras++; printf("Encontrado: EAVEMARIA\n"); }
{OME} { ome++; total_palabras++; printf("Encontrado: OME\n"); }
{PA} { pa++; total_palabras++; printf("Encontrado: PA\n"); }
{APA} { apa++; total_palabras++; printf("Encontrado: APA\n"); }
{RUNRUN} { runrun++; total_palabras++; printf("Encontrado: RUNRUN\n"); }
{MADRECITA} { madrecita++; total_palabras++; printf("Encontrado: MADRECITA\n"); }
{MANITOS} { manitos++; total_palabras++; printf("Encontrado: MANITOS\n"); }
{GUAYOS} { guayos++; total_palabras++; printf("Encontrado: GUAYOS\n"); }
{ZUMBAMBICO} { zumbambico++; total_palabras++; printf("Encontrado: ZUMBAMBICO\n"); }
{ESTORAQUE} { estoraque++; total_palabras++; printf("Encontrado: ESTORAQUE\n"); }
{DICIEMBRE} { diciembre++; total_palabras++; printf("Encontrado: DICIEMBRE\n"); }
{LLENARSEME} { llenarseme++; total_palabras++; printf("Encontrado: LLENARSEME\n"); }
{CUCARACHAS} { cucarachas++; total_palabras++; printf("Encontrado: CUCARACHAS\n"); }
{CACHUPE} { cachupe++; total_palabras++; printf("Encontrado: CACHUPE\n"); }
{BERRACO} { berraco++; total_palabras++; printf("Encontrado: BERRACO\n"); }
{COLIMOTES} { colimotes++; total_palabras++; printf("Encontrado: COLIMOTES\n"); }
{TODITICO} { toditico++; total_palabras++; printf("Encontrado: TODITICO\n"); }
{ATISBO} { atisbo++; total_palabras++; printf("Encontrado: ATISBO\n"); }
{AMA} { ama++; total_palabras++; printf("Encontrado: AMA\n"); }
{CALLAITOS} { callaitos++; total_palabras++; printf("Encontrado: CALLAITOS\n"); }
{REVOLOTIADO} { revolotiado++; total_palabras++; printf("Encontrado: REVOLOTIADO\n"); }
{ACHICOPALADO} { achicopalado++; total_palabras++; printf("Encontrado: ACHICOPALADO\n"); }
{ONDE} { onde++; total_palabras++; printf("Encontrado: ONDE\n"); }
{ALLACITO} { allacito++; total_palabras++; printf("Encontrado: ALLACITO\n"); }
{TODITICOS} { toditicos++; total_palabras++; printf("Encontrado: TODITICOS\n"); }
{BUSTE} { buste++; total_palabras++; printf("Encontrado: BUSTE\n"); }
{MISMITO} { mismito++; total_palabras++; printf("Encontrado: MISMITO\n"); }
{PEGADITICOS} { pegaditicos++; total_palabras++; printf("Encontrado: PEGADITICOS\n"); }
{SURRONGO} { surrongo++; total_palabras++; printf("Encontrado: SURRONGO\n"); }
{CALORCITO} { calorcito++; total_palabras++; printf("Encontrado: CALORCITO\n"); }
{ESTICO} { estico++; total_palabras++; printf("Encontrado: ESTICO\n"); }

[[:space:]]+	  /* Ignorar espacios en blanco */
.				  /* Ignorar cualquier otro carácter */

%%

int main() {
    FILE *file;
    char name[] = "perdroparamocol.txt";
    file = fopen(name, "r");
    if (!file) {
        printf("Error al abrir el archivo %s.\n", name);
        return 1;
    }
    yyin = file;
    yylex();
    fclose(file);

    // Imprimir resultados
    printf("\n=== CONTEOS FINALES ===\n");
    printf("Total palabras encontradas: %d\n\n", total_palabras);
    printf("Detalles:\n");
    printf("pa': %d\n", pa);
    printf("apá: %d\n", apa);
    printf("runrún: %d\n", runrun);
    printf("madrecita: %d\n", madrecita);
    printf("manitos: %d\n", manitos);
    printf("guayos: %d\n", guayos);
    printf("zumbambico: %d\n", zumbambico);
    printf("estoraque: %d\n", estoraque);
    printf("diciembre: %d\n", diciembre);
    printf("llenárseme: %d\n", llenarseme);
    printf("cucarachas: %d\n", cucarachas);
    printf("cachupe: %d\n", cachupe);
    printf("eavemaria: %d\n", ome);
    printf("ome: %d\n", ome);
    printf("berraco: %d\n", berraco);
    printf("colimotes: %d\n", colimotes);
    printf("toditico: %d\n", toditico);
    printf("atisbo: %d\n", atisbo);
    printf("ama: %d\n", ama);
    printf("callaitos: %d\n", callaitos);
    printf("revolotiado: %d\n", revolotiado);
    printf("achicopalado: %d\n", achicopalado);
    printf("onde: %d\n", onde);
    printf("allacito: %d\n", allacito);
    printf("toditicos: %d\n", toditicos);
    printf("buste: %d\n", buste);
    printf("mismito: %d\n", mismito);
    printf("pegaditicos: %d\n", pegaditicos);
    printf("surrongo: %d\n", surrongo);
    printf("calorcito: %d\n", calorcito);
    printf("estico: %d\n", estico);

    return 0;
}