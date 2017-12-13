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
tmpfile=$(readlink -f ./tmp)

#Déplacer vous dans ce répertoire
cd ./tmp/$(basename $0)

verrouillage

#vérification des arguments
if [ $# = 0 ]; then
echo "Veuillez saisir EN ARGUMENTS le nombre d'utilisateurs à créer et relancez le script"
secureQuit
fi

#Formulaire de création utilisateur
for (( i=0; i<$1; i++ ))
do
echo "Bienvenue dans la création d'utilisateurs, veuilez remplir les champs suivants"
echo -e "\033[45mNom :\033[0m"
read userName
echo -e "\033[45mPrénom :\033[0m"
read forName
echo -e "\033[45mEnvironnement : bash zsh ou sh ?\033[0m"
read environnement
mkdir $userName.$forName
echo -e "\033[45mSouhaitez-vous initialiser le mot de passe ?(O/N)\033[0m"
read initMdp
case $initMdp in
	O) echo "Initialisation du mot de passe :"
		echo -e "\033[45mVeuillez saisir un mot de passe :\033[0m"
		read mdp

		echo "Informations utilisateur" > "$userName.$forName/$userName.$forName"
		echo "Nom : $userName" >> "$userName.$forName/$userName.$forName"
		echo "Prénom : $forName" >> "$userName.$forName/$userName.$forName"
		echo "Environnement : $environnement" >> "$userName.$forName/$userName.$forName"
		echo "Mot de passe : $mdp" > "$userName.$forName/.$userName.$forName"
		;;
	N) echo "Erreur, veuillez initialiser votre mot de passe."
		;;
esac

echo -e "\033[45m$userName \033[0mviens d'être crée, félicitation !"
done

#Affichage de l'arborescence du répertoire tmp :
tree $tmpfile

echo "Fin du script"
secureQuit
