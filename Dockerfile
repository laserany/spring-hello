FROM maven:latest AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package
FROM openjdk:15
COPY --from=build /home/app/target/hello.jar /usr/local/lib/hello.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/hello.jar"]