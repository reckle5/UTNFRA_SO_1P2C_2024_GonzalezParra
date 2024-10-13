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
