# Step 1: Use Maven image to build the project
FROM maven:3.8.6-openjdk-17 AS builder

WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn clean package -DskipTests -B

# Step 2: Use Render-compatible JDK image (KEEPS YOUR JAR NAME)
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copy YOUR EXACT JAR (no rename)
COPY --from=builder /app/target/site_project-0.0.1-SNAPSHOT.jar .

# Render port (auto-assigned)
ENV PORT=10000
EXPOSE ${PORT}

ENTRYPOINT ["java", "-jar", "/app/site_project-0.0.1-SNAPSHOT.jar"]
