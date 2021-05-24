FROM openjdk:8-jdk-alpine
RUN apk update && apk add bind-tools
WORKDIR /app
ADD target/mock-app-1.0.0.jar  mock-app-1.0.0.jar
CMD java -jar mock-app-1.0.0.jar
EXPOSE 8080