#!/bin/bash

# Check if the first argument is empty
if [ -z "$1" ]; then
    echo "Usage: $0 <host> [--os-detection] [--service-detection]"
    exit 1
fi

TARGET=$1
OS_DETECTION=false
SERVICE_DETECTION=false

# Parse the arguments
for arg in "${@:2}"; do  # Start from the second argument
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

# Function to scan services
function scan_services {
    echo "[INFO] Scanning services on $TARGET"
    nmap -Pn -sV "$TARGET"  # Added quotes for safety
    echo "[INFO] Done"
}

# Function to scan OS
function scan_os {
    echo "[INFO] Scanning OS on $TARGET"
    nmap -Pn -O "$TARGET"  # Added quotes for safety
    echo "[INFO] Done"
}

# Call the scan_os function if OS detection is enabled
if [ "$OS_DETECTION" = true ]; then
    scan_os  # Fixed the call to scan_os
fi

# Call the scan_services function if service detection is enabled
if [ "$SERVICE_DETECTION" = true ]; then
    scan_services
fi

# Handle case where no scan options are selected
if [ "$OS_DETECTION" = false ] && [ "$SERVICE_DETECTION" = false ]; then
    echo "[INFO] No scan option selected. Use --os-detection or --service-detection"
fi
