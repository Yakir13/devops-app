pipeline {
    agent any

    environment {
        IMAGE = "yakir13/devops-app:latest"
    }

    stages {
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

        stage('Deploy to K3s') {
            steps {
                sh 'sudo k3s kubectl rollout restart deployment/flask-app'
            }
        }
    }
}