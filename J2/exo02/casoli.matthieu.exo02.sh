#!/bin/bash

#Créer un répertoire comportant le nom du script dans ./tmp/
mkdir -p ./tmp/$(basename $0)

#Déplacer vous dans ce répertoire
cd ./tmp/$(basename $0)

#Afficher un phrase contenant le chemin du répertoire courant
echo "Vous etes dans le répertoire suivant: $(pwd)"

#Créer 1 répertoires A uniquement si le répertoire n'existe pas
mkdir -p A

#Dans le repertoire A créer 5 fichiers de {01 à 05} si le fichier n'existe pas
touch ./A/{01..05}

#Copier les 5 fichiers dans le repertoire  B
cp -r  A ./B/

#Lister les répertoires récursif sans utiliser ls
find -type d

#Insérer un contenu : 'Ce fichier est le 01" dans le fichiers B/01
echo "Ce fichier est le 01" >> B/01

#Afficher le contenu du fichier B/01
cat B/01

#Ajouter une ligne supplémentaire au fichier B/01
echo "ligne supplémentaire" >> B/01

#Terminer le script avec un code 0 et une phrase
echo "Fin du script" 
exit 0
