#!/bin/bash

#Punto B: Particionamiento y Montaje

DISCO=$(sudo fdisk -l | grep "10 GiB" | awk '{print $2}' | awk -F ':' '{print $1}')

echo "Particion de Disco: $DISCO"


sudo fdisk $DISCO << EOF
n
e
1

n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
n

+1000M
w
EOF

echo
echo "Disco $DISCO Particionado:"
echo
sudo fdisk -l $DISCO

#Formateo
sudo mkfs.ext4 ${DISCO}5
sudo mkfs.ext4 ${DISCO}6
sudo mkfs.ext4 ${DISCO}7
sudo mkfs.ext4 ${DISCO}8
sudo mkfs.ext4 ${DISCO}9
sudo mkfs.ext4 ${DISCO}10
sudo mkfs.ext4 ${DISCO}11
sudo mkfs.ext4 ${DISCO}12
sudo mkfs.ext4 ${DISCO}13
sudo mkfs.ext4 ${DISCO}14

# ----Rutas para el montaje persistente en /etc/fstab 

# <dispositivo>            <dir>                     <tipo> <opciones> <dump> <fsck>
echo "${DISCO}5     /Examenes-UTN/alumno_1/parcial_1  ext4   defaults   0      0" | sudo tee -a /etc/fstab
echo "${DISCO}6     /Examenes-UTN/alumno_1/parcial_2  ext4   defaults   0      0" | sudo tee -a /etc/fstab
echo "${DISCO}7     /Examenes-UTN/alumno_1/parcial_3  ext4   defaults   0      0" | sudo tee -a /etc/fstab
echo "${DISCO}8     /Examenes-UTN/alumno_2/parcial_1  ext4   defaults   0      0" | sudo tee -a /etc/fstab
echo "${DISCO}9     /Examenes-UTN/alumno_2/parcial_2  ext4   defaults   0      0" | sudo tee -a /etc/fstab
echo "${DISCO}10    /Examenes-UTN/alumno_2/parcial_3  ext4   defaults   0      0" | sudo tee -a /etc/fstab
echo "${DISCO}11    /Examenes-UTN/alumno_3/parcial_1  ext4   defaults   0      0" | sudo tee -a /etc/fstab
echo "${DISCO}12    /Examenes-UTN/alumno_3/parcial_2  ext4   defaults   0      0" | sudo tee -a /etc/fstab
echo "${DISCO}13    /Examenes-UTN/alumno_3/parcial_3  ext4   defaults   0      0" | sudo tee -a /etc/fstab
echo "${DISCO}14    /Examenes-UTN/profesores          ext4   defaults   0      0" | sudo tee -a /etc/fstab

sudo systemctl daemon-reload
#Montaje
sudo mount -a







