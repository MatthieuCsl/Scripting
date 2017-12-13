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

#Déplacer vous dans ce répertoire
cd ./tmp/$(basename $0)

verrouillage

#Récuperer le fichier présent ici : https://t1loc.fr/passwd (via le script)
if [ -f passwd ]; then
echo -e "\n\033[45mLe fichier 'passwd' est déjà présent sur votre machine.\033[0m\n"
else
wget https://t1loc.fr/passwd
echo -e "\033[45mLe téléchargemetn du fichier passwd à été effectué avec succés !\033[0m\n"
fi

#Stocker dans un tableau les utilisateurs non système (UID > 500)
tabUser=()
tabUser+=($(awk -F ":" '$3 > 500 { print $0 }' passwd))
echo -e "\033[45mVoici le tableau des utilisateurs non système (UID > 500) :\033[0m"
echo "${tabUser[@]}"

#Compter le nombre d'utilisateur commencant par : test, puis aurel, puis finissant par ore
echo -e "\n\033[45mle nombre d'utilisateurs commencant par 'test' est de :\033[0m"
echo "$(grep -E ^test passwd | wc -l)"

echo -e "\n\033[45mle nombre d'utilisateurs commencant par 'aurel' est de :\033[0m"
echo "$(grep -E ^aurel passwd | wc -l)"

echo -e "\n\033[45mle nombre d'utilisateurs finnissant par 'ore' est de :\033[0m"
echo "$(grep '[a-zA-Z]ore' passwd | wc -l)"

#Afficher la 17ème ligne du script
echo -e "\n\033[45mVoici la 17ème ligne du tableau :\033[0m"
echo "$(awk 'NR == 17 {print NR" : " $0 }' passwd)"

#Afficher l'avant dernière ligne du script
echo -e "\n\033[45mL'avant derniere ligne du fichier 'passwd' est :\033[0m"
echo "$(cat passwd | tail -2)"

echo -e "\nFin du script"
secureQuit
