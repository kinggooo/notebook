tar -xvf /opt/soft/hadoop-3.1.2.tar -C /opt/soft/
ln -s /opt/soft/hadoop-3.1.2 /usr/local/hadoop
echo 'export HADOOP_HOME=/usr/local/hadoop' >> /etc/bashrc
echo 'export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH' >> /etc/bashrc

mkdir -p /opt/data/hadoop/hd1/data/tmp

#hdfs namenode -format
#hdfs --daemon start namenode
#hdfs --daemon stop namenode
#hdfs --daemon status namenode
#sbin/hadoop-daemon.sh stop namenode
start-dfs.sh
start-yarn.sh