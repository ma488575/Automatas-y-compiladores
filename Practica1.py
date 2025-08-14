#Trabajo colaborativo con mi compañero Jasiel Linares Carrada similitud de codigo
cadena = input("Ingresa la cadena: ")
entradas = cadena.split()

for cad in entradas:
    letra = False
    numero = False
    compuesta = False

    for ca in cad:
        if '0' <= ca <= '9':
            letra = True
        elif ('a' <= ca <='z') or ('A' <= ca <='Z'):
            numero = True
        elif (ca == '@') or (ca == '&') or (ca == '$'):
            compuesta = True
    if numero and not letra and not compuesta:
        clasificacion = "NUmero entero"
    elif letra and not numero and not compuesta:
        clasificacion = "Palabra"
    elif letra and compuesta and numero:
        clasificacion = "Compuesta"
    elif letra and compuesta:
        clasificacion = "Compuesta"
    elif numero and compuesta:
        clasificacion = "Compuesta"
    elif compuesta and not letra and not numero:
        clasificacion = "Caracter especial"
    else:
        clasificacion = "Compuesta"

    print(f"{cad}: {clasificacion}")



    