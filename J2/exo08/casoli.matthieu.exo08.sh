#!/bin/bash

#verrouillage script
function verrouillage() {
if [ -s ".lock" ]; then
echo "ATTENTION ! Le script est déjà en cours d'utilisation"
exit 1
else 
echo "$$" > ".lock"
fi
}

function secureQuit() {
rm -f ".lock"
exit 0
}


#Créer un répertoire comportant le nom du script dans ./tmp/
mkdir -p ./tmp/$(basename $0)

#Vérifier et stocker les chemin absolu des commandes dans une variables
cmd_which=$(which mkdir)

#Déplacer vous dans ce répertoire
cd ./tmp/$(basename $0)

verrouillage

#Jeu du plus ou  moins
if [ $(whoami) != root ]; then
randomNmbr=$((RANDOM%50+1))
	echo "Bienvenue dans le jeu du plus ou moins !"
	echo "Le but du jeu est de deviner un nombre compris entre 1 et 50."
	echo "Pour ce faire vous disposez de 10 tentatives, à vous de jouer !"
		values=()		
		count=1	
		while [[ $userAnswer != $randomNmbr && $count -lt 11 ]]; do
		echo "Tentative n°$count :" 
		read userAnswer 
		values+=($userAnswer)
			if [ $userAnswer -lt $randomNmbr ]; then
			echo -e "\033[45mC'est plus !\033[0m"
			elif [ $userAnswer == $randomNmbr ]; then 
			echo "Félicitation, vous avez trouvé la solution en moins de 10 tentatives !"			
			else 
			echo -e "\033[45mC'est moins !\033[0m"
			fi
		((count++))
		done
		echo "Voici l'historique des valeurs saisies : ${values[@]}"
fi



echo "Fin du script"
secureQuit
