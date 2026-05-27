FROM python:3.11-slim

WORKDIR /app

# Installation des dépendances système nécessaires pour Ansible
RUN apt-get update && apt-get install -y \
    openssh-client \
    sshpass \
    git \
    && rm -rf /var/lib/apt/lists/*

# Installation d'Ansible, Ansible Navigator et Ansible Builder
#RUN pip install --no-cache-dir \
#    ansible \
#    ansible-navigator \
#    ansible-builder

# Votre application Flask semble être un projet distinct
# Si vous voulez garder cette partie, conservez-la, sinon vous pouvez la supprimer
COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY srcs ./srcs

# Le port est probablement pour votre application Flask et non pour Ansible
EXPOSE 8080

# Cette commande lance votre application Flask, pas Ansible
# Changez-la si vous voulez démarrer avec Ansible par défaut
CMD ["tail", "-f", "/dev/null"]
