pipeline{
    agent any
    tools{
        maven "M3"
        jdk "JDK11"
    }
    stages{
        stage("Test"){
            steps{
                script{
                    sh "mvn test"
                }
            }
        }
        stage("Build"){
            steps{
                script{
                    sh "mvn clean install package"
                }
            }
        }
        stage("Docker build"){
            steps{
                script{
                    image = docker.build("markmama/initsixcloud:$BUILD_NUMBER")
                }
            }
        }
        stage("Push Image"){
            steps{
                script{
                    docker.withRegistry("https://hub.docker.com/repository", "DockerHub"){
                    image.push()
                    }

                }
            }
        }
    }
}