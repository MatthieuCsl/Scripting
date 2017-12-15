#!/bin/bash
#titre           :download.sh
#description     :fonction de télechargement, archivage et logs.
#author		 :Sol/Casoli
#date            :12.12.17    
#usage		 :bash /functions/download.sh
#notes           :
#bash_version    :4.4.7(1)-release
#==============================================================================

function telechargement() {
cd ../url
		for ligne in $(cat youtubeLink)
		do
			name=$(awk -F"=" '{print $2}' <<< $ligne)
			youtube-dl $ligne -o  ../download/$name >>../log/success_dl.log 2>>../log/errors_cmd.log
			echo "Téléchargement de $name terminé"
			sleep 1

		done
}

telechargement


