%option noyywrap
%{
    #include <stdio.h>
    #include <string.h>
    #include <ctype.h>

    FILE *yyin;
    FILE *yyout;

    const char *palabras_vacias[] = {
        " a ", "ante", "bajo", "con", "contra", "de", "desde", "en", "entre",
        "hacia", "hasta", "para", "por", "según", "sin", "sobre", "tras",
        "y", "o", "u", "e", "ni", "que", "si", "como", "cuando", "donde",
        "el", "la", "los", "las", "un", "una", "unos", "unas", "al", "del",
        "lo", "su", "sus", "mi", "mis", "tu", "tus", "me", "se", "le", "les",
        NULL
    };

    int es_palabra_vacia(const char *palabra) {
        int i;
        for (i = 0; palabras_vacias[i] != NULL; i++) {
            if (strcasecmp(palabra, palabras_vacias[i]) == 0)
                return 1;
        }
        return 0;
    }

    int ultima_fue_espacio = 1;
%}

PALABRA     [[:alpha:]]+
ESPACIO     [ \t]+
SALTO       \n+
PUNTO       [\.\,\;\:\?\!\¡\¿\"“”]+
OTRO        .

%%

{PALABRA} {
    if (!es_palabra_vacia(yytext)) {
        if (!ultima_fue_espacio)
            fputc(' ', yyout);
        fprintf(yyout, "%s", yytext);
        ultima_fue_espacio = 0;
    }
}

{PUNTO} {
    fprintf(yyout, "%s ", yytext); // agrega espacio después de puntuación
    ultima_fue_espacio = 1;
}

{ESPACIO} { /* ignorar, ya controlamos los espacios */ }

{SALTO} {
    fputc('\n', yyout); // conserva saltos de línea
    ultima_fue_espacio = 1;
}

{OTRO} {
    fprintf(yyout, "%s", yytext);
    ultima_fue_espacio = 0;
}

%%

int main(void) {
    char name[] = "perdroparamocol_neutro.txt";
    char outname[] = "sinpreposiciones.txt";

    FILE *file = fopen(name, "r");
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

    printf("Archivo generado sin preposiciones: %s\n", outname);
    return 0;
}
