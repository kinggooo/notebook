FROM centos
MAINTAINER wangnz wangnz@email.com
#拷贝程序文件
COPY ./resources/jdk1.8.0_211 /opt/soft/jdk1.8.0_211

#拷贝安装代码
ENV INSTALL_DIR=/opt/install
COPY ./install_jdk.sh $INSTALL_DIR/install_jdk.sh

RUN source $INSTALL_DIR/install_jdk.sh > /dev/null && yum install -y openssl openssh-server openssh-clients net-tools > /dev/null 2>&1 && echo "1234" | passwd --stdin root

COPY ./sshd_config /etc/ssh/sshd_config
WORKDIR $INSTALL_DIR