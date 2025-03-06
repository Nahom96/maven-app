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
                sh 'mvn clean package'
            }
        }
        stage('Deploy to Tomcat') {
            steps {
                sh 'cp target/maven-app.war /opt/homebrew/opt/tomcat/libexec/webapps/'
                sh 'brew services restart tomcat'
            }
        }
    }
}
