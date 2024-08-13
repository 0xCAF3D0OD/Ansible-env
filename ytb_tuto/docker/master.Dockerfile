#Reference: "https://github.com/William-Yeh/docker-ansible/blob/master/centos7/Dockerfile"
FROM williamyeh/ansible:ubuntu18.04

RUN apt-get update && apt-get install -y vim python net-tools telnet curl
