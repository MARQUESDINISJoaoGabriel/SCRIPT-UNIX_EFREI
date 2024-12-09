# Project 4 : Scannez les ports à distances avec "nmap"

## Introduction

<em>Bienvenue dans le depôt de <strong>Project Name</strong>! Ce project est developpé par le groupe 2, une équipe passionnée de Linux qui croient fermement au pouvoir des logiciels libres. Notre groupe est composé d'administrateurs système, de développeurs, et de professionnels de l'informatique qui travaillent ensemble pour créer des outils et des solutions Linux fiables, efficaces et faciles à utiliser.</em>

## Nom du groupe

<li> Joao MARQUIS-DINIS </li>
<li> Rayane ACHOUCHI </li>
<li> Cédric HUHU </li>

## À propos de notre groupe

Nous sommes engagés à contribuer à la communauté open-source en développant des solutions qui améliorent l'expérience des utilisateurs Linux du monde entier. Notre équipe est spécialisée dans l'administration système sous Linux, les scripts shell, et le développement d'outils. Nous valorisons la collaboration, la transparence et l'amélioration continue, et nous visons à créer des outils de haute qualité qui simplifient les tâches pour les développeurs et les utilisateurs.

<hr>


## Dépôt git

```bash
git clone git@github.com:MARQUESDINISJoaoGabriel/SCRIPT-UNIX_EFREI.git
cd SCRIPT-UNIX_EFREI
```
or
```bash
git clone https://github.com/MARQUESDINISJoaoGabriel/SCRIPT-UNIX_EFREI.git
cd SCRIPT-UNIX_EFREI
```

## Prérequis

Avant d'exécuter le projet, assurez-vous que votre système dispose des éléments suivants:

### 1. Un terminal sous Linux (ou WSL pour Windows)

Pour les utilisateurs de Windows, installez WSL (Windows Subsystem for Linux) et configurez une distribution Linux comme Ubuntu ou Debian.

### 2. Packages nécessaires

Installez le packages suivantes:

#### Mettre à jour les sources APT

```bash
sudo apt update
```
#### Installer les outils requis

```bash
sudo apt install nmap dos2unix -y
```

<hr>

### Configuration du Script

Avant d'exécuter le script, assurez-vous que les permissions et les fins de ligne sont correctement configurées:

#### 1. Convertir les fins de ligne (si nécessaire)

Si vous voyez une erreur liée au format de fichier Windows, exécutez:

```bash
dos2unix <script.sh>
```

#### 2. Rendre le script exécutable

```bash
chmod u+x <script.sh>
```

