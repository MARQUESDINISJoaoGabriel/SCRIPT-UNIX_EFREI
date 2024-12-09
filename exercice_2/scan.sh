#!/bin/bash

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

function scan_os {
    echo "[INFO] Scanning OS on $TARGET"
    nmap -Pn -O "$TARGET"
    echo "[INFO] Done"
}

if [ "$OS_DETECTION" = true ]; then
    scan_os
fi

if [ "$SERVICE_DETECTION" = true ]; then
    scan_services
fi

if [ "$OS_DETECTION" = false ] && [ "$SERVICE_DETECTION" = false ]; then
    echo "[INFO] No scan option selected. Use --os-detection or --service-detection"
fi
