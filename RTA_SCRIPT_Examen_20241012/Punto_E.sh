#!/bin/bash 

# ------------- FILTROS BASICO -------------- #

SALIDA="$HOME/repogit/UTNFRA_SO_1P2C_2024_GonzalezParra/RTA_ARCHIVOS_Examen_20241013/Filtro_Basico.txt"

grep -i "memtotal" /proc/meminfo > $SALIDA 
sudo dmidecode -t chassis | grep -i -e "chassis" -e "manu" >> $SALIDA

echo "----- Resultado de Filtros Basico -----"
cat $SALIDA


