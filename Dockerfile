# Use an official OpenJDK runtime as the base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built .war file to the container
COPY target/jenkins-webapp.war /app/jenkins-webapp.war

# Command to run the application
CMD ["java", "-jar", "/app/jenkins-webapp.war"]
