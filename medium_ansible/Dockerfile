FROM	centos:7

RUN	sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
	sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN	yum update -y && yum install -y epel-release
RUN 	yum install -y	python3 \
			python3-pip \
			ansible \
			net-tools \
			telnet \
			curl \
			vim
RUN	yum upgrade --version pip && yum clean all
