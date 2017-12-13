#!/bin/bash

#Créer un répertoire comportant le nom du script dans ./tmp/
mkdir -p ./tmp/$(basename $0)

#Déplacer vous dans ce répertoire
cd ./tmp/$(basename $0)

#Afficher une phrase contenant le nombre d'argument passé au script
echo "Le nombre d'arguments passé au script est de: $#"

#Vérifier que vous avez 3 arguments (ni plus ni moins)
if [ "$#" -eq 3 ]; then
 echo "Le nombre d'arguments est valide"
 mkdir $1 $2 $3
echo "Sorti sans erreurs" && exit 0

elif [ "$#" -lt 3 ]; then
 echo "Le nombre d'arguments est invalide"
exit 1
fi
