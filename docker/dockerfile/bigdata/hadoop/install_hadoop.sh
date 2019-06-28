#tar -xvf /opt/soft/hadoop-3.1.2.tar -C /opt/soft/
ln -s /opt/soft/hadoop-3.1.2 /usr/local/hadoop
echo 'export HADOOP_HOME=/usr/local/hadoop' >> /etc/bashrc
echo 'export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH' >> /etc/bashrc

mkdir -p /opt/data/hadoop/hd1/data/tmp

CONF_SRC=/opt/install
CONF_HOME=/opt/soft/hadoop-3.1.2/etc/hadoop

\cp $CONF_SRC/core-site.xml $CONF_HOME/core-site.xml
\cp $CONF_SRC/hdfs-site.xml $CONF_HOME/hdfs-site.xml
\cp $CONF_SRC/mapred-site.xml $CONF_HOME/mapred-site.xml
\cp $CONF_SRC/yarn-site.xml $CONF_HOME/yarn-site.xml
\cp $CONF_SRC/mapred-env.sh $CONF_HOME/mapred-env.sh
\cp $CONF_SRC/hadoop-env.sh $CONF_HOME/hadoop-env.sh

#hdfs namenode -format
#hdfs --daemon start namenode
#hdfs --daemon stop namenode
#hdfs --daemon status namenode
#sbin/hadoop-daemon.sh stop namenode
#start-dfs.sh
#start-yarn.sh