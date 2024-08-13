#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Aucun argument passé. Veuillez passer 's' comme argument pour arrêter et supprimer les conteneurs."
    exit 1
fi

if [ $1 == 's' ]; then
    container_ID=$(docker ps -q)
    for container_id in $container_ID; do
        echo "arret et suppression de $container_id ..."
        docker stop $container_id && docker rm $container_id
    done
elif [ "$1" == "prune" ]; then
	docker system prune -af
elif [ "$1" == "g" ]; then
    # Vérifie si un nom de groupe a été passé
    if [ -z "$2" ]; then
        echo "Veuillez spécifier un nom de groupe après 'g'."
        exit 1
    fi
    
    group_id="$2"
    echo "Recherche du groupe $group_id..."
    
    members() {
	    dscl . -read /Groups/$group_id GroupMembership
}
    # Appelle la fonction members avec le nom du groupe
    members
else
    echo "Veuillez passer 's' comme argument pour arrêter et supprimer les conteneurs." 
fi
