#!/bin/bash
MYSQL_DIR=/Volumes/data/wnz/tool/docker/mysql
MASTER_DIR=$MYSQL_DIR/master
SLAVE_DIR=$MYSQL_DIR/slave

## First we could rm the existed container
docker rm -f m1
docker rm -f s1

## Rm the existed directory
rm -rf $MASTER_DIR
rm -rf $SLAVE_DIR

MYSQL_CMD="mysql -uroot -p123456 -e"

## Start master
docker run -p 3301:3306 --name m1 -v $MYSQL_DIR/master.cnf:/etc/mysql/my.cnf -v $MASTER_DIR:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7

## Check db is ready
IS_READY=0
STATUS_FILE=tmp_m1.txt
while [ $IS_READY -eq 0 ]
do
    docker exec -it m1 $MYSQL_CMD "use mysql;" > $STATUS_FILE
    grep "ERROR" $STATUS_FILE > /dev/null
    if [ $? -eq 0 ];then
        echo "not ready"
        sleep 5
    else
        echo "is ready"
        rm -rf $STATUS_FILE
        break;
    fi
done


## Creating a User for Replication
# docker exec -it m1 mysql -h 127.0.0.1 -P 3306 -u root -p123456 -e "grant all privileges on *.* to 'root'@'%';"
docker exec -it m1 $MYSQL_CMD "grant all privileges on *.* to 'root'@'%';"
docker exec -it m1 $MYSQL_CMD "create user 'repl'@'%' identified by 'repl';"
docker exec -it m1 $MYSQL_CMD "grant replication slave,replication client on *.* to 'repl'@'%';"

## Obtaining the Replication Master Binary Log Coordinates
master_status=$(docker exec -it m1 $MYSQL_CMD "show master status\G")
master_log_file=$(echo "$master_status" | awk  'NR==3{print substr($2,1,length($2)-1)}')
master_log_pos=$(echo "$master_status" | awk 'NR==4{print $2}')
master_log_file="'""$master_log_file""'"

docker run -p 3302:3306 --name s1 -v $MYSQL_DIR/slave.cnf:/etc/mysql/my.cnf -v $SLAVE_DIR:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7

IS_READY=0
STATUS_FILE=tmp_s1.txt
while [ $IS_READY -eq 0 ]
do
    docker exec -it s1 $MYSQL_CMD "use mysql;" > $STATUS_FILE
    grep "ERROR" $STATUS_FILE > /dev/null
    if [ $? -eq 0 ];then
        echo "not ready"
        sleep 5
    else
        echo "is ready"
        rm -rf $STATUS_FILE
        break;
    fi
done

## Setting Up Replication Slaves
docker exec -it s1 $MYSQL_CMD "grant all privileges on *.* to 'root'@'%';"
docker exec -it s1 $MYSQL_CMD "change master to master_host='172.17.0.2',master_port=3306,master_user='repl',master_password='repl',master_log_file=$master_log_file,master_log_pos=$master_log_pos,master_connect_retry=15;"
docker exec -it s1 $MYSQL_CMD "start slave;"
docker exec -it s1 $MYSQL_CMD "show slave status\G"

# docker stop slave
# docker start slave



# ## Creates shortcuts
# grep "alias master" /etc/profile
# if [ $? -eq 1 ];then
#     echo 'alias mysql="docker exec -it master mysql"' >> /etc/profile
#     echo 'alias master="docker exec -it master mysql -h 127.0.0.1 -P3306"' >> /etc/profile
#     echo 'alias slave="docker exec -it master mysql -h 127.0.0.1 -P3307"' >> /etc/profile
#     source /etc/profile
# fi

# docker run -p 3301:3306 --name m2 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7
# docker run --name m1 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:latest
# sudo docker exec -it m1 bash
# mysql -S /var/lib/mysql/mysql.sock -uroot -p123456
# grant all privileges on *.* to 'root'@'%';
# ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
# mysql -uroot -p123456
# docker exec -it m1 mysql -h 127.0.0.1 -P 3306 -u root -p123456 -e "CREATE USER 'repl'@'127.0.0.1' IDENTIFIED BY 'repl';"
# docker exec -it m1 mysql -S /var/run/mysqld/mysqld.sock -e "CREATE USER 'repl'@'127.0.0.1' IDENTIFIED BY 'repl';"
# docker run -p 3301:3306 --name m2 -e MYSQL_ROOT_PASSWORD=123456 -d mysql:latest






















