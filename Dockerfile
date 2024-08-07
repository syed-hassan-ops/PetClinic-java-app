FROM  openjdk:11
RUN mkdir -p /app
COPY . /app
WORKDIR /app
ENTRYPOINT [ "java", "-jar", "target/*.jar" ]
EXPOSE 8080