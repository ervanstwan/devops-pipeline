FROM openjdk:11-jdk-slim
COPY target/myapp.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]