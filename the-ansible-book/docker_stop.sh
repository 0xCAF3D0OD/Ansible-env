#!/bin/bash

if [ $1 == 's' ]; then
    container_ID=$(docker ps -q)
    for container_id in $container_ID; do
        echo "arret et suppression de $container_id ..."
        docker stop $container_id && docker rm $container_id
    done
else
    echo "Veuillez passer 's' comme argument pour arrêter et supprimer les conteneurs." 
fi