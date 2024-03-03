# Script Linux

### Funcionamiento

Mediante la función **ECHO** el programa te imprime en pantalla un texto pidiéndote que introduzcas una de las siguientes tres opciones, seguida de dos valores.
- COMPARAR
- CARPETA
- FICHERO
  
(*En el caso de elegir **COMPARAR** los dos valores siguientes tendrían que ser numéricos*)

Si ejecutas el script con el término **COMPARAR**, el script compara el segundo y tercer termino.
- Si el segundo término es mayor que el tercero, imprime *El tercer término es menor que el segundo*.
- Si el tercero es mayor o igual que el segundo, imprime *El tercer término es mayor que el segundo*.

Si ejecutas el script con el primer término **CARPETA**, crea una carpeta con el nombre en el formato: **carpeta_sobre_(segundo-termino)_de_(tercer-termino)**.

Si ejecutas el script con el primer argumento **FICHERO**, crea una carpeta llamada **carpeta_(segundo-valor)** y dentro de ella un directorio con el nombre **(tercer-valor).txt**.

Las tres funcuiones diferentes están bajo condicionales **IF** y **ELSE**

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

# Terminal Python para bash

### Funcionamiento

Se diseña una terminal auxiliar que acepte codigos, esta terminal se ejecuta con el main y con carpetas importadas deste python que tambien aceptan subprocesos.
Para un mejor entendimiento, nuestra terminal ofrece un historial de los comandos disponibles:
- exit / quit: Salir de la terminal
- clear: Limpiar la pantalla
- creadores: Mostrar los creadores del programa
- bandera_españa: Mostrar la bandera de España
- epilepsia: Activar/desactivar el modo de epilepsia
- fondo_negro: Establecer fondo negro y letras blancas
- fondo_blanco: Establecer fondo blanco y letras negras
- tres_en_raya: Jugar al Tres en Raya
  Tambien cumple que si un comando no es detectado por python, este se consulta en .bash y si existe, se ejecuta
-Aclarar que al lanzar el script te detecta como directorio principal donde tienes guardado el script.

El programa tambien cuenta con un prompt que se repite cada vez que le das a ENTER y simula lo que es una Terminal
