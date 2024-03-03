#!/bin/bash
cd
echo "En este scrip, según función de lo que hayas escrito de primer termino te realizara esa opción. Las opciones son comparar, carpeta y fichero."
if [ "$1" = "comparar" ]
then
if [ "$2" -gt "$3" ]
then
echo "El tercer termino es menor que el segundo."
else 
echo "El tercer termino es mayor que el segundo"
fi
fi

if [ "$1" = "carpeta" ]
then
echo "Crea una carpeta con esta forma: carpeta_sobre_(Segundo valor introducido)_de_(Tercer valor introducido)"
mkdir "carpeta_sobre_$2_de_$3"
fi

if  [ "$1" = "fichero" ] 
then
echo "Crea una carpeta con esta forma: carpeta_(Segundo valor introducido). Y dentro de ella crea un fichero de esta forma: (Tercer valor introducido).txt"
mkdir "carpeta_$2"
cd "carpeta_$2"
touch "$3.txt"
fi


#-------------------------------------------------------------------------------------------------------------------------------------
#ScriptLinuxTerminalPython
import subprocess
import tkinter as tk
import turtle
import random

class CustomTerminal:
    def __init__(self, master):
        self.master = master
        master.title("Custom Terminal")

        self.input_var = tk.StringVar()
        self.entry = tk.Entry(master, bg='black', fg='white', textvariable=self.input_var)
        self.entry.pack(fill=tk.X)
        self.entry.focus_set()

        self.output_text = tk.Text(master, wrap=tk.WORD, bg='black', fg='white', state='disabled')
        self.output_text.pack(fill=tk.BOTH, expand=True)

        self.epilepsy_running = False  # Variable para controlar si la epilepsia está en ejecución
        self.current_background = None  # Variable para almacenar la imagen de fondo actual
        self.entry.bind("<Return>", self.execute_command)

        # Mensaje inicial con los comandos disponibles
        self.show_available_commands()

    def show_available_commands(self):
        commands = [
            "exit / quit: Salir de la terminal",
            "clear: Limpiar la pantalla",
            "creadores: Mostrar los creadores del programa",
            "bandera_españa: Mostrar la bandera de España",
            "epilepsia: Activar/desactivar el modo de epilepsia",
            "fondo_negro: Establecer fondo negro y letras blancas",
            "fondo_blanco: Establecer fondo blanco y letras negras",
            "tres_en_raya: Jugar al Tres en Raya",
            "A parte tambien se pueden usar todos los comandos de bash. "
            "Aclarar que al lanzar el script te detecta como directorio principal donde tienes guardado el script."
        ]
        self.output_text.config(state='normal')
        self.output_text.insert(tk.END, "Comandos disponibles:\n")
        for command in commands:
            self.output_text.insert(tk.END, f"- {command}\n")
        self.output_text.insert(tk.END, "\n")
        self.output_text.config(state='disabled')

    def execute_command(self, event):
        command = self.input_var.get()
        self.output_text.config(state='normal')
        self.output_text.insert(tk.END, f"$DESKTOP: {command}\n")

        if command.lower() in ["exit", "quit"]:
            self.master.destroy()
            return
        elif command.lower() in ["clear"]:
            self.output_text.delete("1.0", tk.END)
            self.show_available_commands()
        elif command.lower() in ["creadores"]:
            self.output_text.insert(tk.END, "$ Los creadores somos: Hugo Muñoz, Marco Fragola, Iván García y Eneko Urigoita \n")
        elif command.lower() in ["bandera_españa"]:
            self.draw_spain_flag()
        elif command.lower() in ["epilepsia"]:
            self.toggle_epilepsy()
        elif command.lower() in ["fondo_negro"]:
            self.stop_epilepsy()
            self.set_black_background()
        elif command.lower() in ["fondo_blanco"]:
            self.stop_epilepsy()
            self.set_white_background()
        elif command.lower() in ["tres_en_raya"]:
            self.play_tic_tac_toe()
        else:
            try:
                output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT, text=True)
                self.output_text.insert(tk.END, output)
            except subprocess.CalledProcessError as e:
                self.output_text.insert(tk.END, f"Error: {e.output}\n")

        self.output_text.config(state='disabled')
        self.input_var.set("")

    def toggle_epilepsy(self):
        self.epilepsy_running = not self.epilepsy_running
        if self.epilepsy_running:
            self.start_epilepsy()
        else:
            self.stop_epilepsy()

    def start_epilepsy(self):
        colors = ["black", "white", "red", "green", "blue", "yellow", "cyan", "magenta", "orange", "pink", "purple"]
        while self.epilepsy_running:
            text_color = random.choice(colors)
            bg_color = random.choice(colors)
            self.output_text.config(bg=bg_color, fg=text_color)
            self.master.update()  # Actualizar la ventana para reflejar los cambios
            self.master.after(50)  # Esperar 50 milisegundos antes de cambiar los colores nuevamente

    def stop_epilepsy(self):
        self.epilepsy_running = False

    def set_black_background(self):
        self.output_text.config(bg="black", fg="white")

    def set_white_background(self):
        self.output_text.config(bg="white", fg="black")

    def play_tic_tac_toe(self):
        self.stop_epilepsy()  # Detener la epilepsia si está en ejecución
        root = tk.Toplevel(self.master)
        game = TicTacToe(root, self)

    def draw_spain_flag(self):
        window = turtle.Screen()
        window.title("Bandera de España")
        window.setup(width=600, height=400)
        window.bgcolor("white")

        t = turtle.Turtle()
        t.speed(0)

        t.penup()
        t.goto(-300, 100)
        t.pendown()
        self.draw_rectangle(t, 600, 200, "#FF0000")

        t.penup()
        t.goto(-300, 33.33)
        t.pendown()
        self.draw_rectangle(t, 600, 66.66, "#FFD700")

        t.penup()
        t.goto(-300, 100)
        t.pendown()
        self.draw_rectangle(t, 600, 66.66, "#FF0000")

        t.penup()
        t.goto(-300, -33.33)
        t.pendown()
        self.draw_rectangle(t, 600, 66.66, "#FF0000")

        t.hideturtle()
        window.mainloop()

    def draw_rectangle(self, t, width, height, color):
        t.begin_fill()
        t.fillcolor(color)
        for _ in range(2):
            t.forward(width)
            t.right(90)
            t.forward(height)
            t.right(90)
        t.end_fill()

class TicTacToe:
    def __init__(self, master, terminal):
        self.master = master
        self.terminal = terminal
        master.title("Tres en Raya")

        self.canvas = tk.Canvas(master, width=300, height=300, bg="white")
        self.canvas.pack()

        self.canvas.bind("<Button-1>", self.on_click)

        self.board = [[" " for _ in range(3)] for _ in range(3)]
        self.current_player = "X"
        self.game_over = False

        self.draw_board()
        self.create_status_labels()

    def draw_board(self):
        for i in range(1, 3):
            self.canvas.create_line(i * 100, 0, i * 100, 300, fill="black", width=2)
            self.canvas.create_line(0, i * 100, 300, i * 100, fill="black", width=2)

    def create_status_labels(self):
        self.status_label = tk.Label(self.master, text="", font=("Helvetica", 16))
        self.status_label.pack()

    def update_status_label(self, message):
        self.status_label.config(text=message)

    def on_click(self, event):
        if not self.game_over:
            x = event.x // 100
            y = event.y // 100

            if self.board[y][x] == " ":
                self.board[y][x] = self.current_player
                self.draw_move(x, y, self.current_player)
                if self.check_winner(x, y):
                    self.game_over = True
                    self.update_status_label(f"¡{self.current_player} ha ganado!")
                    self.create_restart_button()
                elif self.check_draw():
                    self.game_over = True
                    self.update_status_label("¡Empate!")
                    self.create_restart_button()
                else:
                    self.current_player = "O" if self.current_player == "X" else "X"

    def draw_move(self, x, y, player):
        mid_x = x * 100 + 50
        mid_y = y * 100 + 50
        if player == "X":
            self.canvas.create_line(mid_x - 40, mid_y - 40, mid_x + 40, mid_y + 40, fill="red", width=2)
            self.canvas.create_line(mid_x + 40, mid_y - 40, mid_x - 40, mid_y + 40, fill="red", width=2)
        else:
            self.canvas.create_oval(mid_x - 40, mid_y - 40, mid_x + 40, mid_y + 40, outline="blue", width=2)

    def check_winner(self, x, y):
        player = self.board[y][x]
        # Check row
        if all(cell == player for cell in self.board[y]):
            return True
        # Check column
        if all(row[x] == player for row in self.board):
            return True
        # Check diagonals
        if all(self.board[i][i] == player for i in range(3)) or all(self.board[i][2 - i] == player for i in range(3)):
            return True
        return False

    def check_draw(self):
        return all(cell != " " for row in self.board for cell in row)

    def create_restart_button(self):
        self.restart_button = tk.Button(self.master, text="Reiniciar", command=self.restart_game)
        self.restart_button.pack()

    def restart_game(self):
        self.board = [[" " for _ in range(3)] for _ in range(3)]
        self.current_player = "X"
        self.game_over = False
        self.canvas.delete("all")
        self.draw_board()
        self.update_status_label("")
        self.restart_button.destroy()

def main():
    root = tk.Tk()
    terminal = CustomTerminal(root)
    root.mainloop()

if __name__ == "__main__":
    main()


