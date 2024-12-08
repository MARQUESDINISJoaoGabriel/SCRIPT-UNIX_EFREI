# Exercice 4 - Automatisation des scans

Ce script permet de planifier et d'exécuter des scans à des intervalles réguliers via `cron`.

## Exemple d'utilisation
Planifiez un scan quotidien avec :
```bash
$ crontab -e
```

Ajoutez la ligne suivante :
```bash
0 2 * * * /chemin/vers/autoscan.sh
```

Les rapports seront envoyés par email automatiquement.

(Le l'installation se fait de la manière suivante : 
sudo apt install mailutils -y
echo "Ceci est un email de test." | mail -s "Test email" tonemail@cedouu.com
./autoscan.sh)

//PS : Cela ne fonctionne que sur mac , sur windows , l'installation renvoie une erreur sur le fectch de post-gre sql , donc pose un soucis .
