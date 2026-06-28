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

        stage('Done') {
            steps {
                echo 'Docker image built and pushed successfully.'
            }
        }
    }
}