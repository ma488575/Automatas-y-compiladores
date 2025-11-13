%option noyywrap
%{
    #include<stdio.h>

    FILE *yyin;
    FILE *yyout;   
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


{EAVEMARIA}    { fputs("caramba", yyout); }



{PA}           { fputs("para", yyout); }
{APA}          { fputs("papá", yyout); }
{RUNRUN}       { fputs("rumor", yyout); }
{MADRECITA}    { fputs("madre", yyout); }
{MANITOS}      { fputs("manos", yyout); }
{GUAYOS}       { fputs("zapatos", yyout); }
{ZUMBAMBICO}   { fputs("tonto", yyout); }
{ESTORAQUE}    { fputs("tipo", yyout); }
{DICIEMBRE}    { fputs("diciembre", yyout); }
{LLENARSEME}   { fputs("llenárseme", yyout); }
{CUCARACHAS}   { fputs("cucarachas", yyout); }
{CACHUPE}      { fputs("olor fuerte", yyout); }
{BERRACO}      { fputs("muy valiente", yyout); }
{COLIMOTES}    { fputs("cerros", yyout); }
{TODITICO}     { fputs("todo", yyout); }
{ATISBO}       { fputs("mirada", yyout); }

{CALLAITOS}    { fputs("callados", yyout); }
{REVOLOTIADO}  { fputs("alborotado", yyout); }
{ACHICOPALADO} { fputs("desanimado", yyout); }
{ONDE}         { fputs("donde", yyout); }
{ALLACITO}     { fputs("allá", yyout); }
{TODITICOS}    { fputs("todos", yyout); }
{BUSTE}        { fputs("usted", yyout); }
{MISMITO}      { fputs("mismo", yyout); }
{PEGADITICOS}  { fputs("pegados", yyout); }
{SURRONGO}     { fputs("hijo", yyout); }
{CALORCITO}    { fputs("calor", yyout); }
{ESTICO}       { fputs("este", yyout); }

.|\n           { fputc(yytext[0], yyout); }

%%

int main(void) {
    FILE *file;
    char name[]    = "perdroparamocol.txt";          
    char outname[] = "perdroparamocol_neutro.txt";   
    file = fopen(name, "r");
    if (!file) {
        printf("Error al abrir el archivo %s.\n", name);
        return 1;
    }

    yyout = fopen(outname, "w");
    if (!yyout) {
        printf("Error al crear el archivo %s.\n", outname);
        fclose(file);
        return 1;
    }

    yyin = file;
    yylex();        
    fclose(file);
    fclose(yyout);

    printf("Texto con regionalismos reemplazados guardado en: %s\n", outname);
    return 0;
}
