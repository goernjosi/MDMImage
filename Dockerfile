# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages and build the project
# Ensure maven uses Java 17 for compilation
RUN ./mvnw -Dmaven.test.skip=true package

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64

# Run the jar file 
CMD ["java","-jar","/usr/src/app/target/projekt-0.0.1-SNAPSHOT.jar"]
