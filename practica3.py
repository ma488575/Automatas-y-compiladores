# Jasiel Linares Carrada en colaboración con Mario Rodrigo Martinez Angeles

import tkinter as tk
from tkinter import filedialog
import os

def seleccionar_archivo():
    """Abre un diálogo para seleccionar archivo"""
    root = tk.Tk()
    root.withdraw()  
    root.attributes('-topmost', True)  
    
    archivo = filedialog.askopenfilename(
        title="Seleccione el archivo de texto a analizar",
        filetypes=[("Archivos de texto", ".txt"), ("Todos los archivos", ".*")]
    )
    
    root.destroy()
    return archivo

def clasificar_lexemas(archivo_entrada):
    try:
        with open(archivo_entrada, 'r', encoding='utf-8') as archivo:
            contenido = archivo.read().strip()
        
        if not contenido:
            print("El archivo está vacío.")
            return None
        
        total_caracteres_con_espacios = len(contenido)
        total_caracteres_sin_espacios = len(contenido.replace(' ', ''))
        
        lista_lexemas = contenido.split()
        total_lexemas = len(lista_lexemas)
        
        simbolos_especiales = {'@', '#', '$', '%', '&', '_', '-', '+'}
        
        contador_numeros = 0
        contador_palabras = 0
        contador_compuestas = 0
        
        for lexema in lista_lexemas:
            tiene_numeros = False
            tiene_letras = False
            tiene_simbolos = False
            
            for caracter in lexema:
                if caracter.isdigit():
                    tiene_numeros = True
                elif caracter.isalpha():
                    tiene_letras = True
                elif caracter in simbolos_especiales:
                    tiene_simbolos = True
            
            if tiene_simbolos:
                contador_compuestas += 1
            elif tiene_numeros and not tiene_letras:
                contador_numeros += 1
            elif tiene_letras and not tiene_numeros:
                contador_palabras += 1
            else:
                contador_compuestas += 1
        
        return {
            'caracteres_con_espacios': total_caracteres_con_espacios,
            'caracteres_sin_espacios': total_caracteres_sin_espacios,
            'total_lexemas': total_lexemas,
            'palabras': contador_palabras,
            'numeros': contador_numeros,
            'compuestas': contador_compuestas,
            'nombre_archivo': os.path.basename(archivo_entrada),
            'contenido': contenido
        }
        
    except FileNotFoundError:
        print(f"Error: No se encontró el archivo '{archivo_entrada}'")
        return None
    except UnicodeDecodeError:
        print("Error: Problema de codificación en el archivo. Intente con otro archivo.")
        return None
    except Exception as e:
        print(f"Error inesperado al procesar el archivo: {e}")
        return None

def mostrar_resumen(resultados):
    print("\n" + "═" * 60)
    print("RESUMEN DE ANÁLISIS LÉXICO")
    print("═" * 60)
    print(f"Archivo analizado: {resultados['nombre_archivo']}")
    print(f"Contenido: \"{resultados['contenido'][:50]}{'...' if len(resultados['contenido']) > 50 else ''}\"")
    print("─" * 60)
    print(f"Total de caracteres (con espacios): {resultados['caracteres_con_espacios']}")
    print(f"Total de caracteres (sin espacios): {resultados['caracteres_sin_espacios']}")
    print(f"Total de lexemas encontrados: {resultados['total_lexemas']}")
    print("─" * 60)
    print(f"Total de palabras: {resultados['palabras']}")
    print(f"Total de números: {resultados['numeros']}")
    print(f"Total de combinadas: {resultados['compuestas']}")
    print("═" * 60)

def main():
    print("CLASIFICADOR DE LEXEMAS")
    print("=" * 50)
    
    while True:
        print("\n¿Qué deseas hacer?")
        print("1. Seleccionar archivo para analizar")
        print("2. Salir")
        
        opcion = input("\nSelecciona una opción (1-2): ").strip()
        
        if opcion == '2':
            print("¡Hasta luego!")
            break
        
        elif opcion == '1':
            print("\nAbriendo selector de archivos...")
            archivo_path = seleccionar_archivo()
            
            if not archivo_path:
                print("No se seleccionó ningún archivo.")
                continue
            
            if not archivo_path.lower().endswith('.txt'):
                print("Advertencia: El archivo seleccionado no es .txt, pero se intentará procesar.")
            
            if not os.path.exists(archivo_path):
                print(f"Error: El archivo '{os.path.basename(archivo_path)}' no existe.")
                continue
            
            print(f"\n🔎 Analizando archivo: {os.path.basename(archivo_path)}...")
            resultados = clasificar_lexemas(archivo_path)
            
            if resultados:
                mostrar_resumen(resultados)
                
                ver_detalles = input("\n¿Quieres ver la clasificación detallada de cada lexema? (s/n): ").lower()
                if ver_detalles in ['s', 'si', 'sí', 'y', 'yes']:
                    print("\n CLASIFICACIÓN DETALLADA:")
                    print("-" * 40)
                    contenido = resultados['contenido']
                    lista_lexemas = contenido.split()
                    simbolos_especiales = {'@', '#', '$', '%', '&', '_', '-', '+'}
                    
                    for lexema in lista_lexemas:
                        tiene_numeros = any(c.isdigit() for c in lexema)
                        tiene_letras = any(c.isalpha() for c in lexema)
                        tiene_simbolos = any(c in simbolos_especiales for c in lexema)
                        
                        if tiene_simbolos:
                            clasificacion = "Compuesta"
                        elif tiene_numeros and not tiene_letras:
                            clasificacion = "Número"
                        elif tiene_letras and not tiene_numeros:
                            clasificacion = "Palabra"
                        else:
                            clasificacion = "Compuesta"
                        
                        print(f"• {lexema}: {clasificacion}")
            
            else:
                print("No se pudieron obtener resultados del análisis.")
        
        else:
            print("Opción no válida. Por favor, selecciona 1 o 2.")
        
        continuar = input("\n¿Deseas analizar otro archivo? (s/n): ").lower()
        if continuar not in ['s', 'si', 'sí', 'y', 'yes']:
            print("¡Hasta luego!")
            break

if __name__ == "_main_":
    main()