#!/bin/bash
#titre           :argumDL.sh
#description     :Permet le télechargement via les arguments.
#author		 :Sol/Casoli
#date            :12.12.17    
#usage		 :bash /functions/argumDL.sh
#notes           :
#bash_version    :4.4.7(1)-release
#==============================================================================

#Télechargement via arguments
cd ../download
name=$(awk -F"=" '{print $2}' <<< $1)

echo "Début du télechargement de $name..."
youtube-dl $1 -o ../download/$name >>../log/success_dl.log 2>>../log/errors_cmd.log
sleep 1

echo "Début de l'archivage de $name..."
decoupe=${name:0:1}
nameUP=${decoupe^^}
pwd
mkdir ../archive/$nameUP
mv ./$name.mkv  ../archive/$nameUP/$name
echo "Le fichier suivant : $name, à été archivé."




