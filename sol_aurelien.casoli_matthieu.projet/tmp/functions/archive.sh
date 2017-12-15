#!/bin/bash
#titre           :archive.sh
#description     :Archivage des fichiers précedement download.
#author		 :Sol/Casoli
#date            :12.12.17    
#usage		 :bash /functions/archive.sh
#notes           :
#bash_version    :4.4.7(1)-release
#==============================================================================

function archivage() {
cd ../download
		for f in ./*; do
			name=$f
			decoupe=${name:0:3}
			nameUP=${decoupe^^}
			mkdir ../archive/$nameUP
			mv ./$f  ../archive/$nameUP/$f
			echo "Le fichier suivant : $f, à été archivé."
			sleep 1
		done
echo "Fin de l'archivage."
}

archivage


