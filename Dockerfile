# Step 1: Use Maven image to build the project
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app

# Download dependencies first (cache)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code and build
COPY src ./src
RUN mvn clean package -DskipTests

# Step 2: Use JDK image to run the built JAR
FROM eclipse-temurin:17-jdk
WORKDIR /app

# Copy only the built JAR
COPY --from=builder /app/target/site_project-0.0.1-SNAPSHOT.jar .

# Optional: Dynamic port for cloud platforms
ENV PORT=8080
EXPOSE ${PORT}

# Run the app
ENTRYPOINT ["java", "-jar", "/app/site_project-0.0.1-SNAPSHOT.jar"]
