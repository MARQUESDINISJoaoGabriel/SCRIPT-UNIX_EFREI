#!/bin/bash

if ! command -v nmap &> /dev/null; then
  echo "Installez NMAP."
  exit 1
fi

LOG_FILE="/tmp/rapport_scan_$(date +%Y%m%d%H%M).txt"
DEST_EMAIL="joao-gabriel.marques-dinis@efrei.net"

nmap -sS 192.168.1.1-10 > "$LOG_FILE"

mail -s "Rapport de Scan Nmap" "$DEST_EMAIL" < "$LOG_FILE"
