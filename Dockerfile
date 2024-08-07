FROM  openjdk:11
RUN mkdir /target
COPY target/*.jar /target
WORKDIR /target
RUN ls
CMD [ "java", "-jar", "spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar" ]
EXPOSE 8080