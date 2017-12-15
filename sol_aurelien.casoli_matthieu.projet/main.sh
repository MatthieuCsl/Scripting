#!/bin/bash
#titre           :main.sh
#description     :Affiche le menu principal et redirige vers d'autres scripts.
#author		 :Sol/Casoli
#date            :12.12.17    
#usage		 :bash main.sh
#notes           :
#bash_version    :4.4.7(1)-release
#==============================================================================

#Créer un répertoire comportant le nom du script dans ./tmp/
mkdir -p ./tmp/menu

#Déplacer vous dans ce répertoire
cd ./tmp/menu


while [ "$done" != true ]; do
#affichage du menu
cat << EOF
###############################
######--YOUTUBE SELF_DL--######
###############################
#######-MENU PRINCIPAL-########
1 - Télechargement de vidéo - #
2 -    Archivage de vidéo   - #
3 - 	   Sauvegarde	    - #
4 -  Récapitulatif et stats - #
5 - 	    Quitter    	    - #
###############################
##########-Made by-############
#######-Sol Aurélien-##########
############-and-##############
#######-Casoli Matthieu-#######
###############################
EOF

read userOption

case $userOption in
	1)	../functions/download.sh
		;;	 
	2)	../functions/archive.sh
		;;
	3)	../functions/save.sh
		;;	 
	4) 	
		;;
	5) done="true"
		;;
	*) 
		;;
esac

done

