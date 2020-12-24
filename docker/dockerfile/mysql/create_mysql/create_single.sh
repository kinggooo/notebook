#!/bin/bash
MYSQL_DIR=/Volumes/data/wnz/tool/docker/mysql
MASTER_DIR=$MYSQL_DIR/master

## First we could rm the existed container
docker rm -f m1

## Rm the existed directory
rm -rf $MASTER_DIR

MYSQL_CMD="mysql -uroot -p123456 -e"

# ## Start instance
docker run -p 3301:3306 --name m1 -v $MYSQL_DIR/master.cnf:/etc/mysql/my.cnf -v $MASTER_DIR:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7

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


# ## Creating a User for Replication
# docker exec -it m1 mysql -h 127.0.0.1 -P 3306 -u root -p123456 -e "grant all privileges on *.* to 'root'@'%';"
docker exec -it m1 $MYSQL_CMD "grant all privileges on *.* to 'root'@'%';"






















