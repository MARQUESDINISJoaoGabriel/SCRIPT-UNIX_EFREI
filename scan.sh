#!/bin/bash
#Partie 1
echo "Choississez un scan parmis les suivant :
        Scan simple : 1
        scan complet : 2
        scan personnalisé(singulier) : 3
        scan personalisé(plusieurs) : 4 " ;
read reponse

if [ "$reponse" -eq '1' ]; then
        echo " donnez l'ip à rechercher ":
        read ip_1
        sudo nmap -pn $ip_1 ;
fi
if [ "$reponse" -eq '2' ]; then
        sudo nmap -pn -p- ;
fi
if [ "$reponse" -eq '3' ]; then
        echo " veuilez donnez l'ip à analyser " ;
        read ip ;
        sudo nmap -p "$ip" ;
fi
#if [ "$reponse" -eq '4' ]; then
#       read -p "Entrez les adresses IP (séparées par des virgules) : " ips
#       IFS=',' read -r -a ip_array <<< "$ips"
#        for ip in "${ip_array[@]}"; do
#               nmap -p "$ip"

#Partie 2
if [ -z "$1" ]; then
    echo "Usage: $0 <host> [--os-detection] [--service-detection]"
    exit 1
fi

TARGET=$1
OS_DETECTION=false
SERVICE_DETECTION=false

for arg in "${@:2}"; do
   case $arg in
      --os-detection)
         OS_DETECTION=true
         shift
         ;;
      --service-detection)
         SERVICE_DETECTION=true
         shift
         ;;
   esac
done

function scan_services {
    echo "[INFO] Scanning services on $TARGET"
    nmap -Pn -sV "$TARGET"
    echo "[INFO] Done"
}

if ! command -v nmap &> /dev/null; then
  echo "Installez NMAP."
  exit 1
fi
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
