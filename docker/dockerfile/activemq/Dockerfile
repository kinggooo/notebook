FROM kinggooo/jre:v1
MAINTAINER wangnz wangnz@email.com
COPY ./apache-activemq-5.15.8 /opt/activemq
EXPOSE 8161
EXPOSE 61616
ENV MQ_HOME /opt/activemq
ENV PATH ${PATH}:${MQ_HOME}/bin
ENTRYPOINT ["/usr/bin/supervisord","-c","/opt/data/supervisord.conf"]