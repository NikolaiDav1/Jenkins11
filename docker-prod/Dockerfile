FROM tomcat:9.0
RUN apt-get update
RUN apt-get install git -y
RUN cp *.war $CATALINA_HOME/webapps/
EXPOSE 8080
