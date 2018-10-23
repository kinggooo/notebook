############################################
# version:0.1 
# desc 
############################################
FROM daocloud.io/library/ubuntu:14.04
MAINTAINER wangnz wangnz@email.com
RUN apt-get update
RUN apt-get install -y nginx
RUN echo 'Hi,i am in your container' > /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
