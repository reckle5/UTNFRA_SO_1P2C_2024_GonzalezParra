#!/bin/bash
# ------------- FILTROS AVANZADOS -------------- #

SALIDA="$HOME/repogit/UTNFRA_SO_1P2C_2024_GonzalezParra/RTA_ARCHIVOS_Examen_20241013/Filtro_Avanzado.txt"
IP=$(curl -s ifconfig.me)
USER=$(whoami)
HASH=$(sudo grep $USER /etc/shadow | awk -F':' '{print $2}')
URL=$(git remote get-url origin)

cat << EOF > $SALIDA
Mi IP Publica es: $IP
Mi usuario es: $USER
El Hash de mi usuario es: $HASH
La URL de mi repositorio es: $URL

EOF


