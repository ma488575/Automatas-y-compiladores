cadena = input("Ingresa la cadena: ")
entradas = cadena.split()

compuesta1=0
palabra1=0
numero1=0
num1=0
num2=0
num3=0
for cad in entradas:
    letra = False
    numero = False
    compuesta = False
    
    for ca in cad:
        if '0' <= ca <= '9':
            numero = True
        elif ('a' <= ca <='z') or ('A' <= ca <='Z'):
            letra = True
        elif (ca == '@') or (ca == '&') or (ca == '$'):
            compuesta = True
    if numero and not letra and not compuesta:
        num1=num1+1
        clasificacion = "NUmero entero"
    elif letra and not numero and not compuesta:
        num2=num2+1
        clasificacion = "Palabra"
    elif compuesta and not letra and not numero:
        num3=num3+1
        clasificacion = "Caracter especial"
    else:
        num3=num3+1
        clasificacion = "Compuesta"

    print(f"{cad}: {clasificacion}")
    


print(f"Palabras: {num2}")
print(f"Numeros: {num1}")
print(f"Compuesta: {num3}")



    