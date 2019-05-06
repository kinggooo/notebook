FROM kinggooo/jre:v1
MAINTAINER wangnz wangnz@email.com
ADD ./resources/apache-activemq-5.15.8-bin.tar /opt/
COPY ./supervisord.conf /opt/supervisord.conf
EXPOSE 8161
EXPOSE 61616
ENV MQ_HOME /opt/apache-activemq-5.15.8
ENV PATH ${PATH}:${MQ_HOME}/bin
CMD ["/usr/bin/supervisord","-c","/opt/supervisord.conf"]
#CMD ["activemq","start"]
