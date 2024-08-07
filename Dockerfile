FROM  openjdk:11
RUN mkdir -p /app
COPY . /app
WORKDIR /app
ENTRYPOINT [ java -jar target/app.jar ]
EXPOSE 8080