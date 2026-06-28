pipeline {
    agent any

    environment {
        IMAGE = "yakir13/devops-app:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push $IMAGE'
            }
        }

        stage('Deploy Placeholder') {
            steps {
                sh 'echo "Docker image pushed successfully. K3s deploy will be added next."'
            }
        }
    }
}