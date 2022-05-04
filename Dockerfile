FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get -y install openjdk-11-jdk wget
RUN mkdir /opt/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz
RUN gunzip apache-tomcat-9.0.62.tar.gz
RUN tar -xvf apache-tomcat-9.0.62.tar
RUN cp -Rv apache-tomcat-9.0.62/* /opt/tomcat/
RUN sed -i 's/port="8080"/port="6060"/' /opt/tomcat/conf/server.xml
EXPOSE 6060
COPY target/web-services.war /opt/tomcat/webapps
WORKDIR /opt/tomcat/bin
CMD ["./catalina.sh" ,"start"]
