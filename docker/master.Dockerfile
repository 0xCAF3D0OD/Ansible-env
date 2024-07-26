FROM williamyeh/ansible:centos7

RUN yum -y update && yum -y install vim python net-tools telnet curl
