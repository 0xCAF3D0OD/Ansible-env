FROM dinokeke/ansible-medium:1.1

RUN mkdir -p /root/ansible-dir
COPY ./../* /root/ansible-dir

RUN pip3 install ansible-navigator

WORKDIR /root/ansible-dir