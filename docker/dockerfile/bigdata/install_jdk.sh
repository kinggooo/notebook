tar -zxvf /opt/soft/jdk-8u211-linux-x64.tar.gz -C /opt/soft/
ln -s /opt/soft/jdk1.8.0_211 /usr/local/jdk
echo 'export JAVA_HOME=/usr/local/jdk' >> /etc/bashrc
echo 'export JRE_HOME=$JAVA_HOME/jre' >> /etc/bashrc
echo 'export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib:$CLASSPATH' >> /etc/bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/bashrc
source /etc/bashrc
java -version