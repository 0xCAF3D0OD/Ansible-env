#!/bin/bash

if [ "$1" == "d" ]; then
    docker stop $(docker ps -q)
    docker system prune -af
    docker build -t my_ansible_image . # Construit l'image à partir du Dockerfile dans le répertoire courant
    docker run --privileged -it my_ansible_image /bin/bash # Exécute le conteneur avec des privilège
elif [ "$1" == "l" ] && [ -n "$2" ]; then
    docker stop  $(docker ps -q)
    docker system prune -af
    docker run -itd --name ansible_control_node "$2"
    while ! docker inspect -f '{{.State.Running}}' ansible_control_node > /dev/null 2>&1; do
        sleep 1
    done
    docker exec -it ansible_control_node /bin/bash
else
    echo "Manque un paramètre."
fi

