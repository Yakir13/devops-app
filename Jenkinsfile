pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t yakir13/devops-app:latest .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker run -d -p 5000:5000 yakir13/devops-app:latest'
            }
        }

        stage('Deploy to K3s') {
            steps {
                sh 'sudo k3s kubectl apply -f k8s/'
            }
        }
    }
}