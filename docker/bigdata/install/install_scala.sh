tar -zxvf /opt/soft/scala-2.13.0.tgz -C /opt/soft/
ln -s /opt/soft/scala-2.13.0 /usr/local/scala
echo 'export SCALA_HOME=/usr/local/scala' >> /etc/bashrc
echo 'export PATH=$SCALA_HOME/bin:$PATH' >> /etc/bashrc
#source /etc/bashrc
