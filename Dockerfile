FROM tomcat:11-jdk17

# Copy the WAR file to Tomcat's webapps directory
COPY target/jenkins-webapp.war /usr/local/tomcat/webapps/jenkins-webapp.war

# Expose Tomcat's default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
