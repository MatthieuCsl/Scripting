#!/bin/bash
#titre           :save.sh
#description     :Permet la sauvegarde et la compression des archives.
#author		 :Sol/Casoli
#date            :12.12.17    
#usage		 :bash /function/save.sh
#notes           :
#bash_version    :4.4.7(1)-release
#==============================================================================

function save() {
cd ../../tmp/backup

tar -cvf $(date +%d-%Y-%m_%I-%M-%S).tar.gz ../archive/
clear
echo "La sauvegarde du dossier 'archive' viens d'être effectuée avec succés."
}

save
