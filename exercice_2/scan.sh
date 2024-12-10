#!/bin/bash

# Function to display the menu
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

