tar -xvf /opt/soft/apache-zookeeper-3.5.5-bin.tar -C /opt/soft/
ln -s /opt/soft/apache-zookeeper-3.5.5-bin /usr/local/zookeeper
echo 'export ZOOKEEPER_HOME=/usr/local/zookeeper' >> /etc/bashrc
echo 'export PATH=$ZOOKEEPER_HOME/bin:$PATH' >> /etc/bashrc

mkdir -p /opt/data/zookeeper/zk1/data
mkdir -p /opt/data/zookeeper/zk1/log
echo "1" > /opt/data/zookeeper/zk1/data/myid

mkdir -p /opt/data/zookeeper/zk2/data
mkdir -p /opt/data/zookeeper/zk2/log
echo "2" > /opt/data/zookeeper/zk2/data/myid

mkdir -p /opt/data/zookeeper/zk3/data
mkdir -p /opt/data/zookeeper/zk3/log
echo "3" > /opt/data/zookeeper/zk3/data/myid
