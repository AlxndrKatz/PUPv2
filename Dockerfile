FROM maven:3.9.8-eclipse-temurin-17 AS builder
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN mvn clean package

FROM openjdk:17-jdk-slim
WORKDIR /app
EXPOSE 8080
COPY --from=builder /build/target/*.jar pickup-point-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "/app/pickup-point-0.0.1-SNAPSHOT.jar"]
