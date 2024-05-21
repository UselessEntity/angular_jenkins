pipeline {
    agent any

    environment {
        IMAGE_NAME = 'demo_angular'
        IMAGE_TAG = 'latest'
        CREDENTIALS_ID = 'Noob_on_Jenkins'
    }

    stages {
        stage('Checkout from SCM') {
            steps {
                git branch: 'master',credentialsId: 'Noob_on_Jenkins', url: 'https://github.com/bi12-335-usth/angular_jenkins.git'
            }
        }

        stage('Install Packages') {
            steps {
                sh 'npm ci'
            }
        }

        stage('Build') {
            steps {
                sh 'npm install'
                sh 'ng build --prod'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("env.demo_angular:latest")
                }
            }
        }

        stage('Run') {
            steps {
                script {
                    docker.image("env.demo_angular:latest").run("-p 8004:80")
                }

            }
        }
    }
}