#!/bin/bash

#creación de menú

echo "                                                               "
echo "██████╗ ██╗  ██╗ █████╗ ███╗   ██╗████████╗ ██████╗ ███╗   ███╗"
echo "██╔══██╗██║  ██║██╔══██╗████╗  ██║╚══██╔══╝██╔═══██╗████╗ ████║"
echo "██████╔╝███████║███████║██╔██╗ ██║   ██║   ██║   ██║██╔████╔██║"
echo "██╔═══╝ ██╔══██║██╔══██║██║╚██╗██║   ██║   ██║   ██║██║╚██╔╝██║"
echo "██║     ██║  ██║██║  ██║██║ ╚████║   ██║   ╚██████╔╝██║ ╚═╝ ██║"
echo "╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ╚═╝     ╚  "
sleep 1.5


clear


opc=0

while [[ $opc -le 5 ]]; do

echo  -e "\e[1;35m 1)Verificar uso del disco \e[0m"
echo  -e "\e[1;31m 2)Verifique si su consola es vulnerable \e[0m"
echo  -e "\e[1;38m 3)Información de su dispositivo \e[0m"
echo  -e "\e[1;32m 4)Clamav antivirus  \e[0m"
echo  -e "\e[1;34m 5)Salir \e[0m"
read -p "Digite una opción del [1/5]  "  opc

case $opc in

1)clear

threshold="20"

i=2

result=`df -kh |grep -v "Filesystem" | awk '{ print $5 }' | sed 's/%//g'`

for percent in $result; do

if ((percent > threshold))

then

partition=`df -kh | head -$i | tail -1| awk '{print $1}'`

echo "$partition at $(hostname -f) is ${percent}% full"

fi

let i=$i+1


done

;;

2) clear

env x='() { :;}; echo vulnerable' bash -c "echo NO VUlNERABLE"
sleep 2.1
echo  -e "\e[1;33m Sí en su pantalla apareció el mensaje: \e[0m"
sleep 1
echo  -e "\e[1;31m <vulnerable> \e[0m"
sleep 1
echo  -e "\e[1;33m digite(s)para ver opciones que solucionen su problema. \e[0m"
sleep 1
echo  -e "\e[1;33m Caso contrario digite(n)para volver al menú principal \e[0m"


read opc

if [[ $opc == s ]] || [[ $opc == S ]]; then

 apt install nano -y || sudo apt-get install nano -y

 nano info.txt

elif [[ $opc == n ]] || [[ $opc == N ]]; then


./unem.sh

else

echo "opción no válida"
sleep 1.5
echo "deberá volver a ingresar"
sleep 1.5
echo "adios"
exit 1

fi

;;

3) clear

apt install espeak -y || sudo apt-get install espeak -y
espeak -ves+m1 "Bienvenido o Bienvenida"
sleep 1
espeak -ves+m1 "A continuación se presentará"
sleep 1
espeak -ves+m1 "información de su equipo"

sleep 1

apt install lscpu -y || sudo apt-get install lscpu -y

clear

lscpu

sleep 1

apt install inxi -y || sudo apt-get install inxi -y



inxi -Fx

sleep 7

espeak -ves+m1 "hemos presentado"
sleep 0.5
espeak -ves+m1 "informacion como"
sleep 0.5
espeak -ves+m1 "arquitectura de su equipo"
sleep 0.5
espeak -ves+m1 "sistema-operativo"
sleep 0.5
espeak -ves+m1 "kernel"
sleep 0.5
espeak -ves+m1 "procesador"
sleep 0.5
espeak -ves+m1 "memoria interna"
sleep 0.1
espeak -ves+m1 "y  disponible"
sleep 0.5
espeak -ves+m1 "procesos"
sleep 0.2
espeak -ves+m1 "en ejecución"
sleep 0.5
espeak -ves+m1 "pongo  tambien a su disposicíon"
sleep 0.5
espeak -ves+m1 "el tradicional"
sleep 0.5
espeak -ves+m1 "neo fetch"
apt install neofetch -y || sudo apt-get install neofetch -y
neofetch

sleep 12

;;

4) clear

sudo apt install clamav -y || apt install clamav -y
sudo apt install zlib library -y || apt install zlib library -y
sudo apt install clang C -y || apt install clang C -y
sudo apt install wget -y || apt install wget -y
w g e t https://www.clamav.net/downloads/production/clamav-0.101.2.tar.gz
tar zxvf clamav-0.101.2.tar.gz
cd clamav-0.101.2
./configure --with-user
make
sudo make install || apt install make
freshclam || sudo freshclam
clear
echo "este proceso podría tomar algunos minutos"
sleep 1
echo "ya que se escaneará todo el equipo"
sleep 1
echo " sí está realizando o desea operar otra actividad"
sleep 1
echo " es recomendable que abra otra ventana de terminal"
sleep 1
echo " mientras este programa se ejecuta de manera completa"
sleep 4

echo "..............."

clamscan -rv ~/ || sudo clamscan -rv ~/


;;

5) clear

exit 1

;;

esac

done














