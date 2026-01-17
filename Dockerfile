# ✅ CORRECT Maven tag that exists
FROM maven:3.9.9-openjdk-17 AS builder

WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src
RUN mvn clean package -DskipTests -B

# ✅ Render-compatible runtime
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app
COPY --from=builder /app/target/site_project-0.0.1-SNAPSHOT.jar .

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/site_project-0.0.1-SNAPSHOT.jar"]
