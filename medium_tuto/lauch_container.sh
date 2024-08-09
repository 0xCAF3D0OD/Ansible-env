#!/bin/bash

if [ "$1" == "d" ]; then
    docker stop $(docker ps -q)
    docker system prune -af
    docker build -t name .
    docker run -itd name
    while ! docker inspect -f '{{.State.Running}}' name > /dev/null 2>&1; do
	sleep 1
    done
    docker exec -it name /bin/bash
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

