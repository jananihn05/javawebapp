FROM centos:centos7.9.2009
RUN yum install java -y
RUN mkdir /opt/dep
WORKDIR /opt/dep
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.64.tar.gz
RUN mv apache-tomcat-9.0.64/* /opt/dep/tomcat
COPY target/SimpleWebApplication.war /opt/dep/tomcat/webapps
EXPOSE 8080
CMD ["/opt/dep/tomcat/bin/catalina.sh", "run"]
