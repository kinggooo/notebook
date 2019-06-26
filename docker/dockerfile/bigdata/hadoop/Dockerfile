FROM bdbase
MAINTAINER wangnz wangnz@email.com
#拷贝程序文件
COPY ./resources/hadoop-3.1.2 /opt/soft/

#拷贝安装代码
ENV INSTALL_DIR=/opt/install
COPY ./install_hadoop.sh $INSTALL_DIR/install_hadoop.sh

RUN source $INSTALL_DIR/install_hadoop.sh > /dev/null
WORKDIR /opt/install