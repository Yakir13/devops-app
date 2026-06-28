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

        stage('Debug K8s') {
            steps {
                sh 'pwd'
                sh 'find k8s'
                sh 'ls -la k8s'
            }
        }

        stage('Deploy to K3s') {
            steps {
                sh '''
                docker run --rm --network host \
                  -v /etc/rancher/k3s/k3s.yaml:/kubeconfig \
                  -v $WORKSPACE/k8s:/k8s \
                  bitnami/kubectl:latest \
                  --kubeconfig=/kubeconfig apply -f /k8s/deployment.yml -f /k8s/service.yml

                docker run --rm --network host \
                  -v /etc/rancher/k3s/k3s.yaml:/kubeconfig \
                  bitnami/kubectl:latest \
                  --kubeconfig=/kubeconfig rollout restart deployment/flask-app
                '''
            }
        }
    }
}