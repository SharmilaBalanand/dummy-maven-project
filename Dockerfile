# Use Maven to build the project
FROM maven:3.8.1-jdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Use OpenJDK 17 to run the application
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/your-app.jar .
ENTRYPOINT ["java", "-jar", "your-app.jar"]
