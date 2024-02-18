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
