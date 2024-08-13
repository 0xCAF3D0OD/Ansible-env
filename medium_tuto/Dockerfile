FROM robertdebock/fedora:39
COPY ./inventory.yml /etc/ansible/
COPY ./playbook.yml /etc/ansible/
RUN dnf update -y && dnf install -y ansible docker vim

