#!/usr/bin/env bash
echo "Choississez un scan parmis les suivant :
	Scan simple : 1 
	scan complet : 2 
	scan personnalisé(singulier) : 3  
	scan personalisé(plusieurs) : 4 " ;
read reponse

if [ "$reponse" -eq '1' ]; then
        echo " donnez l'ip à rechercher ":
        read ip_1
        nmap -pn "$ip_1" ; 
fi	
if [ "$reponse" -eq '2' ]; then 	
	sudo nmap -p 0-65335 ; 
fi 
if [ "$reponse" -eq '3' ]; then
	echo " veuilez donnez l'ip à analyser " ;
	read ip ;
	sudo nmap -p "$ip" ;
fi
#if [ "$reponse" -eq '4' ]; then
#	read -p "Entrez les adresses IP (séparées par des virgules) : " ips
#	IFS=',' read -r -a ip_array <<< "$ips"  
#        for ip in "${ip_array[@]}"; do
#     		nmap -p "$ip"
#        done
#    	;;
#*)
#    echo "Une erreur est survenue."
#    ;;
#fi
    
