#zkServer.sh start-foreground /opt/conf/zookeeper/zoo.cfg
#zkServer.sh status /opt/conf/zookeeper/zoo1.cfg
#zkServer.sh stop /opt/conf/zookeeper/zoo1.cfg
#zkCli.sh -server 127.0.0.1:2181

zkServer.sh start /opt/conf/zookeeper/zoo1.cfg

zkServer.sh start /opt/conf/zookeeper/zoo2.cfg

zkServer.sh start /opt/conf/zookeeper/zoo3.cfg