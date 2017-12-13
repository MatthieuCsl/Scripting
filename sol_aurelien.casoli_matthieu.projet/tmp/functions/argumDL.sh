#!/bin/bash
#titre           :argumDL.sh
#description     :Permet le télechargement via les arguments.
#author		 :Sol/Casoli
#date            :12.12.17    
#usage		 :bash /functions/argumDL.sh
#notes           :
#bash_version    :4.4.7(1)-release
#==============================================================================

#Télechargement via arguments
cd ../../tmp/download
youtube-dl $1 -o ./$(date +%d-%Y-%m_%I-%M-%S)


