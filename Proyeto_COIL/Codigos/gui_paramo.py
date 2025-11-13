import tkinter as tk
from tkinter import filedialog, messagebox, scrolledtext
import shutil
import subprocess
import os


EJECUTABLE_FLEX = "paras2.exe"  

ENTRADA_FLEX = "perdroparamocol.txt"
SALIDA_FLEX  = "perdroparamocol_neutro.txt"


class App(tk.Tk):
    def __init__(self):
        super().__init__()

        self.title("Normalizador de regionalismos (Pedro Páramo)")
        self.geometry("800x600")

        self.ruta_archivo = None

        self.btn_seleccionar = tk.Button(self, text="Seleccionar archivo de texto",
                                         command=self.seleccionar_archivo)
        self.btn_seleccionar.pack(pady=10)

        self.lbl_archivo = tk.Label(self, text="Ningún archivo seleccionado")
        self.lbl_archivo.pack(pady=5)

        self.btn_procesar = tk.Button(self, text="Procesar con Flex",
                                      command=self.procesar_archivo,
                                      state=tk.DISABLED)
        self.btn_procesar.pack(pady=10)
        self.txt_resultado = scrolledtext.ScrolledText(self, wrap=tk.WORD)
        self.txt_resultado.pack(expand=True, fill=tk.BOTH, padx=10, pady=10)

       
        self.btn_guardar = tk.Button(self, text="Guardar resultado como...",
                                     command=self.guardar_resultado,
                                     state=tk.DISABLED)
        self.btn_guardar.pack(pady=5)

    def seleccionar_archivo(self):
        ruta = filedialog.askopenfilename(
            title="Seleccionar archivo de texto",
            filetypes=[("Archivos de texto", "*.txt"), ("Todos los archivos", "*.*")]
        )
        if ruta:
            self.ruta_archivo = ruta
            self.lbl_archivo.config(text=f"Archivo: {os.path.basename(ruta)}")
            self.btn_procesar.config(state=tk.NORMAL)

    def procesar_archivo(self):
        if not self.ruta_archivo:
            messagebox.showwarning("Atención", "Primero selecciona un archivo.")
            return

        try:
            
            shutil.copyfile(self.ruta_archivo, ENTRADA_FLEX)
            subprocess.run(EJECUTABLE_FLEX, shell=True, check=True)

            if not os.path.exists(SALIDA_FLEX):
                messagebox.showerror("Error",
                                     f"No se encontró el archivo de salida: {SALIDA_FLEX}")
                return

            with open(SALIDA_FLEX, "r", encoding="utf-8", errors="replace") as f:
                texto = f.read()

            self.txt_resultado.delete("1.0", tk.END)
            self.txt_resultado.insert(tk.END, texto)

            self.btn_guardar.config(state=tk.NORMAL)
            messagebox.showinfo("Listo", "Archivo procesado correctamente.")

        except FileNotFoundError:
            messagebox.showerror(
                "Error",
                f"No se encontró el ejecutable de flex: {EJECUTABLE_FLEX}\n"
                f"Asegúrate de que está en la misma carpeta o pon la ruta completa."
            )
        except subprocess.CalledProcessError:
            messagebox.showerror(
                "Error",
                "Hubo un problema al ejecutar el programa de flex."
            )
        except Exception as e:
            messagebox.showerror("Error", str(e))

    def guardar_resultado(self):
        contenido = self.txt_resultado.get("1.0", tk.END)
        if not contenido.strip():
            messagebox.showwarning("Atención", "No hay contenido para guardar.")
            return

        ruta_guardar = filedialog.asksaveasfilename(
            title="Guardar resultado",
            defaultextension=".txt",
            filetypes=[("Archivos de texto", "*.txt"), ("Todos los archivos", "*.*")]
        )
        if ruta_guardar:
            with open(ruta_guardar, "w", encoding="utf-8") as f:
                f.write(contenido)
            messagebox.showinfo("Guardado", "Resultado guardado correctamente.")


if __name__ == "__main__":
    app = App()
    app.mainloop()
