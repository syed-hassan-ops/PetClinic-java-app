FROM  openjdk:11
RUN mkdir -p /app
COPY target/*.jar /app
WORKDIR /app
ENTRYPOINT [ "java", "-jar", "*jar" ]
EXPOSE 8080