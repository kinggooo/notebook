############################################
# version : wangnz/mongodb:v1
# desc : 当前版本安装的mongodb
############################################
#FROM centos7:latest
FROM sshd

MAINTAINER wangnz wangnz@email.com

ENV DEBIAN_FRONTEND noninteractive
ENV MONGO_HOME /opt/mongodb-3.4.3
ENV LC_ALL C

ADD mongodb-3.4.3.tgz /opt/
RUN mv /opt/mongodb-linux-x86_64-rhel70-3.4.3 /opt/mongodb-3.4.3

COPY supervisord.conf /etc/supervisor/

# -v　＜hostdir>:<Containerdir>
# 对应关系如下
# mongo:/docker/mongodb
VOLUME ["/mongodb"]

# 容器需要开放Mongo 30000端口
EXPOSE 30000

CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]


#wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.4.3.tgz
#docker build -t "mongodb" .
#docker run -d -p 9999:22 -p 30000:30000 -v /opt/docker/mongodb:/mongodb --privileged=true mongo
#docker run -d -p 27017:27017 --name mgdb -v /Users/wangnz/Documents/mydev/docker/mongo:/etc/mongo mongo --config /etc/mongo/mongod.conf
#docker run -d -p 27017:27017 --name mgdb mongo