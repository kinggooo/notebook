FROM centos7:latest

MAINTAINER wangnz wangnz@email.com

RUN yum install -y openssh-server sudo && yum clean all

RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

RUN useradd admin
RUN echo "admin:admin" | chpasswd
RUN echo "admin   ALL=(ALL)       ALL" >> /etc/sudoers
RUN mkdir -p /var/run/sshd
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

#supervisor
RUN yum install -y python-setuptools && yum clean all
ADD supervisor-3.3.1.tar.gz /opt/
WORKDIR /opt/supervisor-3.3.1
RUN python setup.py install && mkdir -p /etc/supervisor/
COPY supervisord.conf /etc/supervisor/
EXPOSE 22
CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]