pipeline {
    agent any
    environment {
        AWS_CREDENTIALS = credentials('aws-creds')  // Jenkins AWS credentials ID
    }
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/abiolahabeeb/abPortfolio.git'  // Change to your repo URL
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
    post {
        success {
            echo 'EC2 instance with Apache has been deployed successfully!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
