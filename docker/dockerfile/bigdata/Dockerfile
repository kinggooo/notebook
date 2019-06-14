FROM centos
MAINTAINER wangnz wangnz@email.com
COPY ./resources/jdk-8u211-linux-x64.tar.gz /opt/soft/
COPY ./resources/apache-maven-3.6.1-bin.tar.gz /opt/soft/
COPY ./resources/scala-2.13.0.tgz /opt/soft/

COPY ./install_jdk.sh /opt/install/install_jdk.sh
COPY ./install_mvn.sh /opt/install/install_mvn.sh
COPY ./install_scala.sh /opt/install/install_scala.sh
COPY ./install.sh /opt/install/install.sh
WORKDIR /opt