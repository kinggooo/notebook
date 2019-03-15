wget https://mirrors.tuna.tsinghua.edu.cn/apache//activemq/5.15.8/apache-activemq-5.15.8-bin.tar.gz

#制作最小jre镜像
tar -zxvf apache-activemq-5.15.8-bin.tar.gz

#Dockerfile
FROM kinggooo/jre
WORKDIR /opt
COPY  ./apache-activemq-5.15.8 ./activemq
EXPOSE 8161
EXPOSE 61616
ENV MQ_HOME /opt/activemq
ENV PATH ${PATH}:${MQ_HOME}/bin
#ENTRYPOINT ["activemq ","start"]


docker build -t kinggooo/actmq .

#运行容器
docker run -d -p 9090:9090 --name app1 -v /Users/wangnz/Documents/mydev/docker/springboot/sb-hello:/opt/sb-hello kinggooo/jre java -jar sb-hello/sb-hello-1.0-SNAPSHOT.jar
docker run -d -p 9091:9090 --name app2 -v /Users/wangnz/Documents/mydev/docker/springboot/sb-hello:/opt/sb-hello kinggooo/jre java -jar sb-hello/sb-hello-1.0-SNAPSHOT.jar

docker run -d -p 8161:8161 -p 61616:61616 --name act kinggooo/actmq

docker run -d -p 8161:8161 -p 61616:61616 --name act1 webcenter/activemq