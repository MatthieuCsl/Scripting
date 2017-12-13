#! /bin/bash

clear
if [[ ! -d  ./tmp/ ]]; then
	echo "Début de la création des répertoires"
	mkdir ./tmp/
	mkdir ./tmp/$0
fi
echo "Création du dossier finis"

cd ./tmp/$0
echo "Vous êtes dans " $(pwd)


#I choose a lazy person to do a hard job because a lazy person will find an easy way to do it.
function stockPersonalUser {
	echo "Récupération des utilisateur non-système et stockage" >> $logfile
	awk -F: ' $3 > 500 { print $0 } ' $inputfile > ./tmpfile.txt
	echo "Stockage des utilisateurs non-système dans un tableau." >> $logfile
	nonSysUsers=( $(cat ./tmpfile.txt) )
	echo "Suppression du fichier temporaire." >> $logfile
	rm -f ./tmpfile.txt
}

function userCountBeginBy() {
	echo "Décompte du nombre d'utilisateurs commençant par $1" >> $logfile
	res=$(printf "%s\n" "${nonSysUsers[@]}"| awk -F: ' { print $1 } ' | sed -re '/^'"$1"'/!d' | wc -l)
	if [[ res > 1 ]]; then
		pluriel="s"
	fi
	
	echo "Affichage du nombre d'utilisateurs dont le pseudo commence par $1" >> $journalLog
	echo "Il y a $res utilisateur$pluriel non-système dont le pseudo commence par $1."
}

function userCountEndBy() {
	echo "Décompte du nombre d'utilisateurs finissant par $1" >> $logfile
	res=$(printf "%s\n" "${nonSysUsers[@]}"| awk -F: ' { print $1 } ' | sed -re '/'"$1"'$/!d' | wc -l)
	if [[ res > 1 ]]; then
		pluriel="s"
	fi
	echo "Affichage du nombre d'utilisateur non-système dont le pseudo fini par $1" >> $journalLog
	echo "Il y a $res utilisateur$pluriel non-système dont le pseudo fini par $1."
}

function userData {
	echo "Récupération des noms d'utilisateurs." >> $logfile
	printf "%s\n" "${nonSysUsers[@]}" | awk -F: ' { print $1 } ' > ./tmpfile.txt
	usernames=( $(cat ./tmpfile.txt) )

	echo "Récupération des noms des UID." >> $logfile
	printf "%s\n" "${nonSysUsers[@]}" | awk -F: ' { print $3 } ' > ./tmpfile.txt
	uids=( $(cat ./tmpfile.txt) )

	echo "Récupération des noms des home." >> $logfile
	printf "%s\n" "${nonSysUsers[@]}" | awk -F: ' { print $6 } ' > ./tmpfile.txt
	homes=( $(cat ./tmpfile.txt) )

	echo "Récupération des différents shells." >> $logfile
	printf "%s\n" "${nonSysUsers[@]}" | awk -F: ' { print $7 } ' | sed -re '/#|bash|zsh|sh|#/!d' > ./tmpfile.txt
	bashs=( $(cat ./tmpfile.txt) )

	len=${#usernames[@]}

	echo "Affichage des données." >> $journalLog
	i=0
	while [[ i -lt len ]]; do
		echo -ne "L'utilisateur : ${usernames[$i]}. " 
		echo -ne " A pour UID : ${uids[$i]}.   		"
		echo -ne " A pour home : ${homes[$i]}. 		"
		echo -e " A pour Shell : ${bashs[$i]}.		"
		let i++
	done

	echo "Suppression de tous les fichiers temporaires." >> $logfile
	rm -f ./tmp*
}

function line17 {
	echo "Affichage de la 17ème ligne de ce script." >> $journalLog
	echo "La 17ème ligne de ce script est : "
	sed -e '17 !d;' $0
}

function main {
	echo "Récupération du flux à traiter." >> $logfile
	curl https://t1loc.fr/passwd > ./inputstream.txt
	inputfile=$(readlink -f ./inputstream.txt)
	clear
	echo "Démarrage de la fonction de stockage des utilisateurs standard" >> $journalLog
	stockPersonalUser
	echo "Démarrage de la fonction de décompte des utilisateurs dont le pseudo commence par test" >> $journalLog
	userCountBeginBy "test"
	echo "Démarrage de la fonction de décompte des utilisateurs dont le pseudo commence par aurel" >> $journalLog
	userCountBeginBy "aurel"
	echo "Démarrage de la fonction de décompte des utilisateurs dont le pseudo fini par ore" >> $journalLog
	userCountEndBy "ore"
	echo "Démarrage de la fonction de listing des utilisateurs" >> $journalLog
	userData
	echo "Démarrage de la fonction lisant la 17ème ligne" >> $journalLog
	line17

	nonSysUsers=""
	echo "Suppression du lockfile" >> $logfile
	rm $lockfile
	echo "Suppression de inputfile" >> $logfile
	rm $inputfile
	echo "Fin du programme avec le code 0" >> $logfile
	exit 0
}

echo "" > ./suivi.exo09.sh
echo "" > ./journalisation.log
echo "" > ./erreurs.log

journalLog=$(readlink -f ./journalisation.log)
errorLog=$(readlink -f ./error.log)
logfile=$(readlink -f ./suivi.exo09.sh)
