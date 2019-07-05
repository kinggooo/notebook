cd /opt
mkdir data
groupadd mysql
useradd -r -g mysql -s/bin/false mysql
chown -R mysql:mysql ./data
/opt/mysql/bin/mysqld --initialize --user=mysql --basedir=/opt/mysql --datadir=/opt/data --pid-file=/opt/data/mysql.pid >tmp.log 2>&1

#/opt/mysql/bin/mysql_ssl_rsa_setup --datadir=/opt/data
\cp /opt/mysql/support-files/mysql.server /etc/init.d/mysqld
\cp /opt/install/my.cnf /etc/my.cnf

/etc/init.d/mysqld start

OLDPASS=$(grep password tmp.log | awk -F"localhost: " '{ print $2 }')
/opt/mysql/bin/mysqladmin -uroot -p"$OLDPASS" password "123456" -S /opt/data/mysqld.sock
