# Use the Maven image with Eclipse Temurin JDK 17 for the build stage
FROM maven:3.9.0-eclipse-temurin-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy only the pom.xml file first to leverage Docker's caching for dependencies
COPY pom.xml .

# Download dependencies (this step will be cached unless pom.xml changes)
RUN mvn dependency:go-offline -B

# Copy the source code into the container
COPY src ./src

# Build the Maven project
RUN mvn clean package -DskipTests

# Test the project
RUN mvn test -X -B
RUN mvn verify

# Use a lightweight JDK image for the runtime
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built jar file from the build stage
COPY --from=build /app/target/my-java-db-app-1.0-SNAPSHOT.jar app.jar

# Specify the command to run the application
CMD ["java", "-jar", "app.jar"]