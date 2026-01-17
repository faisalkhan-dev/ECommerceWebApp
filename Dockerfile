# Step 1: Use Maven image to build the project
FROM maven:3.8.4-openjdk-17 AS builder

# Set work directory inside the container
WORKDIR /app

# Copy all files to /app in container
COPY pom.xml .
RUN mvn dependency:go-offline

# Build the Spring Boot app (skip tests)
COPY src ./src
RUN mvn clean package -DskipTests


# Step 2: Use lightweight JDK image to run the built JAR
FROM openjdk:17-jdk

# Set work directory inside the container
WORKDIR /app

# Copy only the built JAR from the previous stage
COPY --from=builder /app/target/site_project-0.0.1-SNAPSHOT.jar .

# Set environment variable for port (optional)
ENV PORT=8080

# Expose the port
EXPOSE ${PORT}

# Run the app
ENTRYPOINT ["java", "-jar", "/app/site_project-0.0.1-SNAPSHOT.jar"]
