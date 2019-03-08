wget --no-cookies \
--no-check-certificate \
--header "Cookie: oraclelicense=accept-securebackup-cookie" \
"https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jre-8u201-linux-x64.tar.gz" \
-O jre-8u201-linux-x64.tar.gz

wget --no-cookies \
--no-check-certificate \
--header "Cookie: oraclelicense=accept-securebackup-cookie" \
"https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz" \
-O jdk-8u201-linux-x64.tar.gz

#制作最小jre镜像
tar -zxvf jre-8u201-linux-x64.tar.gz

rm -rf ./lib/plugin.jar \
./lib/ext/jfxrt.jar \
./bin/javaws \
./lib/javaws.jar \
./lib/desktop \
./plugin \
./lib/deploy* \
./lib/*javafx* \
./lib/*jfx* \
./lib/amd64/libdecora_sse.so \
./lib/amd64/libprism_*.so \
./lib/amd64/libfxplugins.so \
./lib/amd64/libglass.so \
./lib/amd64/libgstreamer-lite.so \
./lib/amd64/libjavafx*.so \
./lib/amd64/libjfx*.so



#Dockerfile
FROM frolvlad/alpine-glibc
ADD jre /usr/local/
ENV JAVA_HOME /usr/local/jre
ENV PATH ${PATH}:${JAVA_HOME}/bin
CMD ["java", "-version"]

docker build -t wnz/jre:v1 .

#导出导入镜像
docker save -o jre.tar wnz/jre:v1

docker load < jre.tar

mvn clean package dockerfile:build

#运行容器
docker run -d -p 9090:9090 --name app1 -v /Users/wangnz/Documents/mydev/docker/springboot/sb-hello:/opt/sb-hello kinggooo/jre java -jar sb-hello/sb-hello-1.0-SNAPSHOT.jar
docker run -d -p 9091:9090 --name app2 -v /Users/wangnz/Documents/mydev/docker/springboot/sb-hello:/opt/sb-hello kinggooo/jre java -jar sb-hello/sb-hello-1.0-SNAPSHOT.jar
docker run -d -p 9090:9090 --name app1 sb-hello