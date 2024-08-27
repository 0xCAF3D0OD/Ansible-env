FROM centos/python-38-centos7

MAINTAINER Kevin Di Nocera <kevin.dinocera@protonmail.com>

USER root

# Mettre à jour les dépôts pour utiliser vault.centos.org
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Désactiver le dépôt problématique et installer les dépendances nécessaires
RUN yum-config-manager --disable centos-sclo-sclo && \
    yum update -y && \
    yum install -y wget gcc openssl-devel vim epel-release net-tools telnet curl docker && \
    yum clean all && \
    rm -rf /var/cache/yum \

# Configurer sudo
RUN echo "===> Disabling sudo 'requiretty' setting..." && \
    sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/' /etc/sudoers || true

# Mettre à jour pip et setuptools, installer Ansible et Ansible Navigator
RUN pip3 install --upgrade pip setuptools && \
    pip3 install ansible ansible-navigator

# Configurer Ansible
RUN echo "===> Adding hosts for convenience..." && \
    mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

# Nettoyer
RUN yum -y remove epel-release && yum clean all

# Définir le répertoire de travail
WORKDIR /workspace

# Commande par défaut
CMD ["bash"]
