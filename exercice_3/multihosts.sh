#!/bin/bash

if ! command -v nmap &> /dev/null; then
  echo "Installez NMAP."
  exit 1
fi

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
