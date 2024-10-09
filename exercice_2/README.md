# Consigne Exercice 2 : Détection du système d'exploitation et des services

<li> Le script doit offrir la possibilité d'effectuer un scan avancé pour détecter le système d'exploitation
et les services actifs sur la cible. Ce type de scan est utile pour identifier les versions des logiciels et 
d'OS utilisées sur le réseau distant </li>
<li> L'utilisateur doit pouvoir activer ou désactiver cette fonctionnalité selon ses besoins </li>
<br> </br>

# Explication du script :

<li> Cible (target): Le script prend l'adresse IP ou le nom de domaine de la cible 
comme premier argument. </li>

<li> Détection du système d'exploitation (--os-detection) : Utilise nmap -O pour 
détecter l'OS (fingerprinting). </li>

<li> Détection des services <br>
(--service-detection): Utilise nmap -sV pour détecter les services actifs et leurs versions </li>

<li> Le script peut exécuter les deux types de scan ou juste un seul, selon les options passées en argument. </li>

## Utilisation du script

<li> Pour scanner uniquement les actifs :</li>

```bash
./scan.sh 192.168.1.1 --service-detection
```
<li> Pour détecter le système d'exploitation uniquement : </li>

```bash
./scan.sh 192.168.1.1 --os-detection --service-detection
```

Ce script fourni une <strong> base </strong> pour la détection des systèmes d'exploitation et des services sur une cible via **<span style="color:red">nmap</span>**



