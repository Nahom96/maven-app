pipeline {
    agent any

    environment {
        IMAGE_NAME = 'nahom291/jenkins-webapp'
        DOCKER_CREDENTIALS_ID = 'dockerhub-login'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Nahom96/maven-app.git'
            }
        }

        stage('Build Maven Project') {
            steps {
                withMaven(maven: 'Maven-Homebrew') {  // <-- clearly required fix
                    sh 'mvn clean package'
                }
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Docker Push') {
            steps {
                sh "docker push ${IMAGE_NAME}"
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh 'cp target/jenkins-webapp.war /opt/homebrew/opt/tomcat/libexec/webapps/'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
