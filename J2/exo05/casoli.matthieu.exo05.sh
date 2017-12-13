#!/bin/bash


#Créer un répertoire comportant le nom du script dans ./tmp/
mkdir -p ./tmp/$(basename $0)

#Déplacer vous dans ce répertoire
cd ./tmp/$(basename $0)

while true;
do
#Demander le renseignement d'un repertoire à creer
echo "veuillez saisir un nom de repertoire :"
read newRepName
if [ "$newRepName" == "exit" ]; then
exit 0
else
#Vérifier que le répertoire n'existe pas et créé le, sinon on termine le
#script en exit 1
if [ -d "$newRepName" ]; then
echo "$newRepName existe déjà !" && exit 1
else
echo "N'existe pas"
mkdir $newRepName
cd $newRepName
touch newFile
fi
fi
#Changer les permissions en 777 uniquement si elle ne sont pas en 777
if [ $(stat -c '%a' newFile) != "777" ]; then
chmod 777 newFile
echo "$(stat newFile)"
echo "Fin du script"
fi
done
