############################################
# version : wangnz/redis:v1
# desc : redis
############################################
#FROM centos7:latest
FROM sshd

MAINTAINER wangnz wangnz@email.com

#RUN yum install -y gcc make && yum clean all

ENV DEBIAN_FRONTEND noninteractive

ENV REDIS_HOME /opt/redis-3.2.8
ENV LC_ALL C

#ADD redis-3.2.8.tar.gz /opt/
ADD redis-3.2.8 /opt/redis-3.2.8

#WORKDIR /opt/redis-3.2.8

#RUN cd /opt/redis-3.2.8 && make

COPY supervisord.conf /etc/supervisor/

# -v　＜hostdir>:<Containerdir>
VOLUME ["/redis"]

EXPOSE 6379

CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]


#wget http://download.redis.io/releases/redis-3.2.8.tar.gz
#docker build -t redis .
#docker run -d -p 9998:22 -p 16379:6379 -v /opt/docker/redis:/redis --privileged=true redis
#systemctl stop firewalld.service 关闭centos7防火墙
#systemctl disable firewalld.service 禁用centos7防火墙
#systemctl restart docker.service