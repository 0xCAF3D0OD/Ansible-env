FROM dinokeke/ansible_medium:1.0

RUN mkdir -p /root/ansible-dir
COPY ./../* /root/ansible-dir

WORKDIR /root/ansible-dir