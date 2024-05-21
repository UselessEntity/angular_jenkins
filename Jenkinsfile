pipeline {
    agent {
        docker {
            image 'jenkins/jenkins:lts'
            args '-p 8080:8080 -p 50000:50000 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stages {
        stage('Install Packages') {
            steps {
                // Use the docker.image() method to run commands inside the Angular container
                docker.image('nhxnnz/demo_angular').inside {
                    sh 'npm ci'
                }
            }
        }

        stage('Build') {
            steps {
                docker.image('nhxnnz/demo_angular').inside {
                    sh 'npm run build -- --output-path=./dist'
                }
            }
        }

        stage('Test') {
            steps {
                docker.image('nhxnnz/demo_angular').inside {
                    sh 'npm run test'
                }
            }
        }

        stage('Deploy') {
            steps {
                // Build the Docker image for the Angular app
                sh 'docker build -t nhxnnz/demo_angular:latest .'

                // Run the Angular app container
                sh 'docker run -d -p 8004:80 nhxnnz/demo_angular:latest'
            }
        }
    }
}