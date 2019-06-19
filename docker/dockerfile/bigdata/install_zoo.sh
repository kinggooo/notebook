tar -zxvf /opt/soft/apache-zookeeper-3.5.5.tar.gz -C /opt/soft/
ln -s /opt/soft/apache-zookeeper-3.5.5 /usr/local/zookeeper
echo 'export ZOOKEEPER_HOME=/usr/local/zookeeper' >> /etc/bashrc
echo 'export PATH=$ZOOKEEPER_HOME/bin:$PATH' >> /etc/bashrc
source /etc/bashrc

mkdir -p /opt/data/zookeeper/data
mkdir -p /opt/data/zookeeper/log