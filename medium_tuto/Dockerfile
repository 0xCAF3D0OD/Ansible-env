FROM robertdebock/fedora:39
COPY ./localhost.yml /etc/ansible/
COPY ./playbooks.yml /etc/ansible/
RUN dnf update -y && dnf install -y ansible docker

