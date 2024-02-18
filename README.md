# Script Linux

### Funcionamiento

Mediante la función **ECHO** el programa te pide que introduzcas una de las siguientes tres opciones seguida de dos valores
- COMPARAR
- CARPETA
- FICHERO

Si ejecutas el script con el término **COMPARAR**, el script compara el segundo y tercer termino numérico.
- Si el segundo término es mayor que el tercero, imprime *El tercer término es menor que el segundo*.
- Si el tercero es mayor o igual que el segundo, imprime *El tercer término es mayor que el segundo*.

Si ejecutas el script con el primer término **CARPETA**, crea una carpeta con el nombre en el formato: **carpeta_sobre_(segundo-termino)_de_(tercer-termino)**.

Si ejecutas el script con el primer argumento **FICHERO**, crea una carpeta llamada **carpeta_(segundo-valor)** y dentro de ella un directorio con el nombre **(tercer-valor).txt**.

Todas estas funciones están bajo condicionales **IF**
