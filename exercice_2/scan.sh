#!/bin/bash

# Function to display the menu
function display_menu {
    echo "==============================="
    echo "       Nmap Scanner Tool       "
    echo "==============================="
    echo "1) Enter IP address"
    echo "2) Perform OS detection scan"
    echo "3) Perform service detection scan"
    echo "4) Perform both scans"
    echo "5) Exit"
    echo "==============================="
}

# Function to perform service scan
function scan_services {
    echo "[INFO] Scanning services on host $TARGET..."
    nmap -Pn -sV "$TARGET"
    echo "[INFO] Operation completed."
}

# Function to perform OS scan
function scan_os {
    echo "[INFO] Scanning OS on host $TARGET..."
    nmap -Pn -O "$TARGET"
    echo "[INFO] Operation completed."
}

# Main interactive loop
TARGET=""
while true; do
    display_menu
    read -p "Choose an option: " choice

    case $choice in
        1)
            read -p "Enter the target IP address: " TARGET
            ;;
        2)
            if [ -z "$TARGET" ]; then
                echo "[ERROR] No target IP address provided. Please select option 1 first."
            else
                scan_os
            fi
            ;;
        3)
            if [ -z "$TARGET" ]; then
                echo "[ERROR] No target IP address provided. Please select option 1 first."
            else
                scan_services
            fi
            ;;
        4)
            if [ -z "$TARGET" ]; then
                echo "[ERROR] No target IP address provided. Please select option 1 first."
            else
                scan_os
                scan_services
            fi
            ;;
        5)
            echo "[INFO] Exiting the program. Goodbye!"
            exit 0
            ;;
        *)
            echo "[ERROR] Invalid choice. Please try again."
            ;;
    esac
done
