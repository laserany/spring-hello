FROM public.ecr.aws/w1t5r0p3/maven:latest AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package
FROM public.ecr.aws/w1t5r0p3/jdk15:latest
COPY --from=build /home/app/target/hello.jar /usr/local/lib/hello.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/hello.jar"]