pipeline {
    agent any

    environment {
        DOCKER_HUB_USERNAME = 'your-dockerhub-username'
        DOCKER_IMAGE_NAME = 'maven-app'
    }

    stages {
        stage('Checkout') {  // Pulls code from GitHub
            steps {
                git branch: 'main', url: 'https://github.com/Nahom96/maven-app.git'
            }
        }

        stage('Build Maven Project') {  // Builds Maven project
            steps {
                withMaven(maven: 'Maven-Homebrew') {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Docker Login') {  // Authenticates with Docker Hub
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                }
            }
        }

        stage('Docker Build') {  // Builds Docker image
            steps {
                sh 'docker build -t $DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME .'
            }
        }

        stage('Docker Push') {  // Pushes Docker image to Docker Hub
            steps {
                sh 'docker push $DOCKER_HUB_USERNAME/$DOCKER_IMAGE_NAME'
            }
        }

        stage('Deploy to Tomcat') {  // Deploys to Tomcat server
            steps {
                sh 'cp target/maven-app.war /opt/homebrew/opt/tomcat/libexec/webapps/'
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
