FROM  openjdk:11
RUN mkdir -p /app
COPY .  /app
WORKDIR /app/target
ENTRYPOINT [ "java", "-jar", "*jar" ]
EXPOSE 8080