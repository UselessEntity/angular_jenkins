pipeline {
    agent any

    environment {
        PATH = "C:\Program Files\nodejs\node_modules\npm\bin" // Replace /path/to/npm/bin with the actual path to npm
    }

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
