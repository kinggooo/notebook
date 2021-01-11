tar -zxvf /opt/soft/apache-maven-3.6.1-bin.tar.gz -C /opt/soft/
ln -s /opt/soft/apache-maven-3.6.1 /usr/local/maven
echo 'export M2_HOME=/usr/local/maven' >> /etc/bashrc
echo 'export PATH=$M2_HOME/bin:$PATH' >> /etc/bashrc
#source /etc/bashrc
