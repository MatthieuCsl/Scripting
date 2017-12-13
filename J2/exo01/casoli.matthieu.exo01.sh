#!/bin/bash

#Créer un répertoire comportant le nom du script dans ./tmp/
mkdir /tmp/$0

#Déplacer vous dans ce répertoire
cd /tmp/$0

#Afficher un phrase contenant le chemin du répertoire courant
echo "Vous etes dans le répertoire suivant: $(pwd)"

#Créer 10 répertoires de [A-J]
mkdir {A..J}

#Dans le repertoire A créer 5 fichiers de {01 à 05}
touch ./A/{01..05}

#Copier les 5 fichiers dans les autres répertoires
cp -r  A/* ./B/
cp -r  A/* ./C/
cp -r  A/* ./D/
cp -r  A/* ./E/
cp -r  A/* ./F/
cp -r  A/* ./G/
cp -r  A/* ./H/
cp -r  A/* ./I/
cp -r  A/* ./J/

#Lister tous les répertoires de façon récursive
ls -LR

#Insérer un contenu : 'Ce fichier est le 01" dans les fichiers 01
for i in {A..J}
 do
echo "Ce fichier est le 01" >> ${i}/01
 done

#Supprimer les dossiers voyelles de façon verbeuse
