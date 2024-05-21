pipeline {
    agent {
        docker {
            image 'jenkins/jenkins:lts'
            args '-d -p 8004:80 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stages {
        stage('Install Packages') {
            steps {
                sh 'docker pull nhxnnz/demo_angular'
                sh 'docker run -v ${PWD}:/app nhxnnz/demo_angular npm ci'
            }
        }

        stage('Build') {
            steps {
                sh 'docker run -v ${PWD}:/app nhxnnz/demo_angular npm run build -- --output-path=./dist'
            }
        }

        stage('Test') {
            steps {
                sh 'docker run -v ${PWD}:/app nhxnnz/demo_angular npm run test'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker build -t nhxnnz/demo_angular:latest .'
                sh 'docker run -d -p 8004:80 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:lts'
            }
        }
    }
}