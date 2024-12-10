#!/bin/bash

function display_menu {
    echo "==============================="
    echo "       Script Execution Menu   "
    echo "==============================="
    echo "1) Exécuter le script scan de base"
    echo "2) Exécuter le script de détection d'OS et services"
    echo "3) Exécuter le script de scan multi-hôtes"
    echo "4) Exécuter le script d'automatisation de scan"
    echo "5) Quitter"
    echo "==============================="
    read -p "Choisissez une option: " choice

    case $choice in
        1)
            cd exercice_1 && ./verification_scan.sh
            ;;
        2)
            cd exercice_2 && ./scan.sh
            ;;
        3)
            cd exercice_3 && ./multihosts.sh
            ;;
        4)
            cd exercice_4 && ./autoscan.sh
            ;;
        5)
            echo "[INFO] Quitter le programme. Au revoir!"
            exit 0
            ;;
        *)
            echo "[ERREUR] Choix invalide. Veuillez ressayer."
            ;;
    esac
}

display_menu
