FROM bdbase
MAINTAINER wangnz wangnz@email.com
#拷贝程序文件
COPY ./resources/hadoop-3.1.2 /opt/soft/hadoop-3.1.2

#拷贝安装代码
ENV INSTALL_DIR=/opt/install
COPY ./install_hadoop.sh $INSTALL_DIR/install_hadoop.sh

COPY ./conf/core-site.xml $INSTALL_DIR/core-site.xml
COPY ./conf/hdfs-site.xml $INSTALL_DIR/hdfs-site.xml
COPY ./conf/mapred-site.xml $INSTALL_DIR/mapred-site.xml
COPY ./conf/yarn-site.xml $INSTALL_DIR/yarn-site.xml
COPY ./conf/mapred-env.sh $INSTALL_DIR/mapred-env.sh
COPY ./conf/hadoop-env.sh $INSTALL_DIR/hadoop-env.sh

RUN source $INSTALL_DIR/install_hadoop.sh
WORKDIR /opt/install