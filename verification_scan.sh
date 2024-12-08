echo "Choississez un scan parmis les suivant :
	Scan simple : 1 ,
	scan complet : 2 ,
	scan personnalisé : 3 . " ;
read reponse

if [ "$reponse" -eq '1' ]; then
	ip_all=nmap -Pn -A ;
	nmap --port-ratio "$ip_all" ;
	nmap -sp "$ip_all" ; 
fi	
if [ "$reponse" -eq '2' ]; then 
	nmap -p 1-65535 ; 
fi	
if [ "$reponse" -eq '3' ]; then
	echo " veuilez donnez l'ip ou les ip's à analyser " ;
	read ip ;
	IFS=',' read -r -a ip_list <<< "$ip"
    for host in "${ip_list[@]}"; do
      nmap -v $host
    done
fi
    
