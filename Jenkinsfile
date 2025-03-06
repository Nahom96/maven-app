pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Nahom96/maven-app.git'
            }
        }

        stage('Build') {
            steps {
                withMaven(maven: 'Maven-Homebrew') {
                    sh 'mvn clean package'
                }
            }
        }
        stage('Deploy to Tomcat') {
            steps {
                sh 'cp target/jenkins-webapp.war /opt/homebrew/opt/tomcat/libexec/webapps/'
            }
        }
    }
}
