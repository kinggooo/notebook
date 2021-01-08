#!/bin/bash
# create network
# docker network create --driver bridge --subnet=172.18.0.0/16 --gateway=172.18.0.1 zoonet
# docker network inspect zoonet

ZOO_DIR=/Volumes/data/wnz/tool/docker/zookeeper
ZK1_DIR=$ZOO_DIR/zk1
ZK2_DIR=$ZOO_DIR/zk2
ZK3_DIR=$ZOO_DIR/zk3

## First we could rm the existed container
docker rm -f zk1
docker rm -f zk2
docker rm -f zk3

## Rm the existed directory
rm -rf $zk1
rm -rf $zk2
rm -rf $zk3

# ## Start instance
docker run -d -p 2181:2181 --name zk1 --privileged --restart always --network zoonet --ip 172.18.0.2 \
-v $ZK1_DIR/data:/data \
-v $ZK1_DIR/datalog:/datalog \
-v $ZK1_DIR/logs:/logs \
-e ZOO_MY_ID=1 \
-e "ZOO_SERVERS=server.1=172.18.0.2:2888:3888;2181 server.2=172.18.0.3:2888:3888;2181 server.3=172.18.0.4:2888:3888;2181" zookeeper

docker run -d -p 2182:2181 --name zk2 --privileged --restart always --network zoonet --ip 172.18.0.3 \
-v $ZK2_DIR/data:/data \
-v $ZK2_DIR/datalog:/datalog \
-v $ZK2_DIR/logs:/logs \
-e ZOO_MY_ID=2 \
-e "ZOO_SERVERS=server.1=172.18.0.2:2888:3888;2181 server.2=172.18.0.3:2888:3888;2181 server.3=172.18.0.4:2888:3888;2181" zookeeper

docker run -d -p 2183:2181 --name zk3 --privileged --restart always --network zoonet --ip 172.18.0.4 \
-v $ZK3_DIR/data:/data \
-v $ZK3_DIR/datalog:/datalog \
-v $ZK3_DIR/logs:/logs \
-e ZOO_MY_ID=3 \
-e "ZOO_SERVERS=server.1=172.18.0.2:2888:3888;2181 server.2=172.18.0.3:2888:3888;2181 server.3=172.18.0.4:2888:3888;2181" zookeeper


docker exec -it zk1 ./bin/zkServer.sh status
docker exec -it zk2 ./bin/zkServer.sh status
docker exec -it zk3 ./bin/zkServer.sh status

















