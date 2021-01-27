FROM maven:latest
EXPOSE 8080
ADD /target/hello.jar hello.jar
ENTRYPOINT ["java","-jar","hello.jar"]