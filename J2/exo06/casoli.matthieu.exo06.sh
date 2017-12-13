#!/bin/bash


#Créer un répertoire comportant le nom du script dans ./tmp/
mkdir -p ./tmp/$(basename $0)

#Déplacer vous dans ce répertoire
cd ./tmp/$(basename $0)


#affichage du menu
function affichageMenu() {
echo -e "\n###MENU PRINCIPAL###"
echo "1 - Créer un répertoire"
echo "2 - Lister le répertoire courant"
echo "3 - Supprimer un répertoire"
echo "4 - Afficher les permisssions du répertoires"
echo "5 - Changer les permissions du répertoires"
echo "6 - Afficher une aide"
echo "7 - Quitter"
}


while true; do
affichageMenu
echo -e "\nFaites votre choix :"
read choix

case $choix in 
	1) echo -e "\nVeuillez saisir un nom de répertoire à créer :"
		while true; do		
			read newRepName
			if [ -d "$newRepName" ]; then
				echo "$newRepName éxiste déjà, essayez à nouveau :"
			else
				echo "N'éxiste pas"
				mkdir $newRepName
				echo "Le répertoire : '$newRepName' viens d'être créé"
				break
			fi
		done
		 ;;
	2) echo "Le répertoire courant contient:"
		echo -e "\033[45m$(ls)\033[0m"
		 ;;
	3) echo "Veuillez saisir le nom du répertoire à supprimer :"
	   read repSuppress
		rm -rf $repSuppress
		 ;;
	4) echo "Veuillez saisir le nom du répertoire dont vous souhaitez afficher les permissions :"
	   read statRep
	   echo "$(stat -c '%a' $statRep)"
		 ;;
	5) echo "Veuillez saisir le nom du répertoire dont vous souhaitez changer les permissions :"
	   read changPerm
	   if [ $(stat -c '%a' $changPerm) != "777" ]; then
		chmod 777 $changPerm
	   fi
	   echo "Les permissions du répertoire '$changPerm' ont été modifiés avec succés !"
	   echo "$(stat -c '%a' $changPerm)"
		 ;;
	6) echo "Une aide"
		 ;;
	7) echo "Fin du script"
		exit 0
		 ;;
esac
done
