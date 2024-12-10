#!/bin/bash
#Partie 1
#sudo ufw disable pour éteindre le pare-feu de l'ordinateur ;
echo "Choississez un scan parmis les suivant :
        Scan simple : 1
        scan complet : 2
        scan personnalisé(singulier) : 3
        scan personalisé(plusieurs) : 4 " ;
read reponse

if [ "$reponse" -eq '1' ]; then
        echo " donnez l'ip à rechercher ":
        read ip_1
        sudo nmap -Pn $ip_1 ;
fi
if [ "$reponse" -eq '2' ]; then
        sudo nmap -Pn -p- ;
fi
if [ "$reponse" -eq '3' ]; then
        echo " veuilez donnez l'ip à analyser " ;
        read ip ;
        sudo nmap -P "$ip" ;
fi
#if [ "$reponse" -eq '4' ]; then
#       read -p "Entrez les adresses IP (séparées par des virgules) : " ips
#       IFS=',' read -r -a ip_array <<< "$ips"
#        for ip in "${ip_array[@]}"; do
#               nmap -p "$ip"

#Partie 2
function display_menu {
    echo "==============================="
    echo "       Outil de Scanner Nmap       "
    echo "==============================="
    echo "1) Entrer une adresse IP"
    echo "2) Effectuer une detection de syst me d'exploitation"
    echo "3) Effectuer une detection des services"
    echo "4) Effectuer les deux analyses"
    echo "5) Quitter"
    echo "==============================="
}

# Function to perform service scan
function scan_services {
    echo "[INFO] Scanning services on host $TARGET..."
    nmap -Pn -sV "$TARGET"
    echo "[INFO] Operation terminee."
}

# Function to perform OS scan
function scan_os {
    echo "[INFO] Scanning OS on host $TARGET..."
    nmap -Pn -O "$TARGET"
    echo "[INFO] Operation terminee."
}

# Main interactive loop
TARGET=""
while true; do
    display_menu
    read -p "Choisissez une option: " choice

    case $choice in
        1)
            read -p "Entrez l'adresse IP cible: " TARGET
            ;;
        2)
            if [ -z "$TARGET" ]; then
                echo "[ERREUR] Aucune adresse IP cible fournie. Veuillez choisir l'option 1 d'abord."
            else
                scan_os
            fi
            ;;
        3)
            if [ -z "$TARGET" ]; then
                echo "[ERREUR] Aucune adresse IP cible fournie. Veuillez choisir l'option 1 d'abord."
            else
                scan_services
            fi
            ;;
        4)
            if [ -z "$TARGET" ]; then
                echo "[ERREUR] Aucune adresse IP cible fournie. Veuillez choisir l'option 1 d'abord."
            else
                scan_os
                scan_services
            fi
            ;;
        5)
            echo "[INFO] Quitter le programme. Au revoir!"
            exit 0
            ;;
        *)
            echo "[ERREUR] Choix invalide. Veuillez ressayer."
            ;;
    esac
done


#Partie 3
echo "=== Scanner plusieurs hôtes ==="
echo "1. Scanner un seul hôte"
echo "2. Scanner une plage d'IP"
echo "3. Scanner plusieurs hôtes spécifiques"
read -p "Choisissez une option (1-3) : " choix

case $choix in
  1)
    read -p "Entrez l'adresse IP hôte : " ip
    nmap -v $ip
    ;;
  2)
    read -p "Entrez la plage (range) d'IP : " range
    nmap -v $range
    ;;
  3)
    read -p "Entrez les adresses IP (séparées par des virgules) : " hosts
    IFS=',' read -r -a host_array <<< "$hosts"
    for host in "${host_array[@]}"; do
      nmap -v $host
    done
    ;;
  *)
    echo "Une erreur est survenue."
    ;;
esac
#exercice 4
LOG_FILE="/tmp/rapport_scan_$(date +%Y%m%d%H%M).txt"
DEST_EMAIL="joao-gabriel.marques-dinis@efrei.net"

nmap -sS 192.168.1.1-10 > "$LOG_FILE"

mail -s "Rapport de Scan Nmap" "$DEST_EMAIL" < "$LOG_FILE" ;
