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