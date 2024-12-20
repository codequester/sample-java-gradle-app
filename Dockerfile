# Use an official Gradle image to build the app
# FROM gradle:8.11-jdk17 AS builder

# WORKDIR /app

# # Copy the Gradle wrapper and project files
# COPY gradle /app/gradle
# COPY gradlew /app/
# COPY build.gradle /app/
# COPY settings.gradle /app/

# # Copy the entire source code to the container
# COPY src /app/src

# # Run the Gradle build to create the JAR file
# RUN ./gradlew clean build

# Use an OpenJDK base image to run the app
FROM docker.io/openjdk:17.0.1-jdk-slim

# Copy the built JAR file from the builder image
COPY  build/libs/sample-java-gradle-app.jar /app/app.jar

# Expose the port that your Spring Boot app listens on
EXPOSE 8081

# Command to run the Spring Boot app
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
