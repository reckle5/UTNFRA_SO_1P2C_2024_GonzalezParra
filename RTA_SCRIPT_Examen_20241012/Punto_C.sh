#!/bin/bash

#Punto C: Usuarios y permisos


USER_HASH=$1
HASH=$(sudo grep $USER_HASH /etc/shadow | awk -F':' '{print $2}')

# --------- CREANDO USUARIOS CON SU GRUPO ---------------#

sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

sudo useradd -m -s /bin/bash -G  p1c2_2024_gAlumno -p "HASH" p1c2_2024_A1
sudo useradd -m -s /bin/bash -G  p1c2_2024_gAlumno -p "HASH" p1c2_2024_A2
sudo useradd -m -s /bin/bash -G  p1c2_2024_gAlumno -p "HASH" p1c2_2024_A3
sudo useradd -m -s /bin/bash -G  p1c2_2024_gProfesores -p "HASH" p1c2_2024_P1

# --------- AJUSTANDO PERMISOS --------------------------#


sudo chown -R p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chmod -R 750 /Examenes-UTN/alumno_1

sudo chown -R p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chmod -R 760 /Examenes-UTN/alumno_2

sudo chown -R p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chmod -R 700 /Examenes-UTN/alumno_3

sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores
sudo chmod -R 773 /Examenes-UTN/profesores



# --------- VALIDAR --------------------------------------#

sudo su -c "whoami > /Examenes-UTN/alumno_1/validar.txt" p1c2_2024_A1 
sudo su -c "whoami > /Examenes-UTN/alumno_2/validar.txt" p1c2_2024_A2
sudo su -c "whoami > /Examenes-UTN/alumno_3/validar.txt" p1c2_2024_A3
sudo su -c "whoami > /Examenes-UTN/profesores/validar.txt" p1c2_2024_P1

