pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Build Angular application
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    // Build Docker image
                    docker.build('nhxnnz/demo_angular', '-f Dockerfile .')
                }
            }
        }
        stage('Docker Run') {
            steps {
                script {
                    // Run Docker container
                    docker.image('nhxnnz/demo_angular').withRun('-p 8004:80') {
                        // Container is running
                    }
                }
            }
        }
    }
}
