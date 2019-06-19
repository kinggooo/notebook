FROM centos
MAINTAINER wangnz wangnz@email.com
#拷贝程序文件
COPY ./resources/jdk-8u211-linux-x64.tar.gz /opt/soft/
COPY ./resources/apache-maven-3.6.1-bin.tar.gz /opt/soft/
COPY ./resources/scala-2.13.0.tgz /opt/soft/
COPY ./resources/apache-zookeeper-3.5.5.tar.gz /opt/soft/
#拷贝安装代码
COPY ./install/install_jdk.sh /opt/install/install_jdk.sh
COPY ./install/install_mvn.sh /opt/install/install_mvn.sh
COPY ./install/install_scala.sh /opt/install/install_scala.sh
COPY ./install/install_zoo.sh /opt/install/install_zoo.sh
COPY ./install/install.sh /opt/install/install.sh
#拷贝配置文件
COPY ./conf/zoo.cfg /opt/conf/zookeeper/zoo.cfg
WORKDIR /opt/install