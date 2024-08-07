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
                    sh "mvn clean package"
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
                    docker.withRegistry("https://registry.hub.docker.com/", "DockerHub"){
                    image.push()
                    }
                }
            }
        }
        stage("Deploy"){
            environment{
                REMOTE_HOSTNAME = "192.168.56.144"
            }
            steps{
                withCredentials([usernamePassword(credentialsId: 'ansible', usernameVariable: 'REMOTE_USER', passwordVariable: 'REMOTE_PASSWORD')]) {
                    sh '''
                    sshpass -p "$REMOTE_PASSWORD" ssh -o StrictHostKeyChecking=no $REMOTE_USER@$REMOTE_HOSTNAME <<EOF
                    pwd
                    ls
                    EOF
                    '''
                }
            }
        }
    }
}