pipeline {
    agent any

    stages {

        stage('Git Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Wait for EC2') {
            steps {
                bat 'timeout /t 60'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t vishnu-it-solutions:latest ./projects/vishnu-it-solutions/docker'
            }
        }

        stage('Deploy To Kubernetes') {
            steps {
                bat 'kubectl apply -f ./projects/vishnu-it-solutions/k8s/'
            }
        }
    }
}