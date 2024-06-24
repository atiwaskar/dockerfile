FROM ubuntu As build
RUN apt-get update && apt install maven -y && apt install git -y
RUN git clone https://github.com/mayurmwagh/onlinebookstore.git
WORKDIR /onlinebookstore
RUN mvn clean install -DskipTests




FROM alpine
RUN apk add openjdk11
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz tomcat.tar.gz
RUN tar -xvf tomcat.tar.gz -C /opt
COPY --from=build /onlinebookstore/**.jar /opt/tomcat-9.0.89/webapp/onlinebookstore.jar
EXPOSE 8080
CMD ["/opt/tomcat-9.0.89/bin/catalina.sh","run"]

