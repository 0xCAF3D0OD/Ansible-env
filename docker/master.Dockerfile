#Reference: "https://github.com/William-Yeh/docker-ansible/blob/master/centos7/Dockerfile"
FROM williamyeh/ansible:centos7

RUN yum -y update && yum -y install vim python net-tools telnet curl
