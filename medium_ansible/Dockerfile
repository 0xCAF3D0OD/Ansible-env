FROM	centos:7

MAINTAINER William Yeh <kevin.dinocera@protonmail.com>

# Modify the YUM repository configuration files in CentOS 7 in order to change the repository mirror URLs. 
# These changes are often necessary when working with CentOS 7 based Docker images to ensure the availability of repository mirrors and avoid package download problems.
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

RUN    	echo "===> Disabling sudo 'requiretty' setting..."    && \
    	sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers  || true

RUN	yum upgrade --version pip 			&& \
	echo "===> Removing unused YUM resources..."  	&& \
    	yum -y remove epel-release && yum clean all	&& \
	echo "===> Adding hosts for convenience..."	&& \
	mkdir -p /etc/ansible				&& \
	echo 'localhost' > /etc/ansible/hosts
