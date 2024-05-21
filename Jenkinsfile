pipeline {
    agent {
        docker {
            // Use Docker image with Docker CLI installed
            image 'docker:latest'
            // Mount Docker socket so Docker commands can be executed within the container
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build Angular App') {
            steps {
                // Clone your Angular app repository
                git 'https://github.com/bi12-335-usth/angular_jenkins.git'
                
                // Build the Angular app
                sh 'npm install'
                sh 'npm run build --prod'
            }
        }
        stage('Run Container') {
            steps {
                // Run the Docker container for the Angular app
                sh 'docker run -d -p 8004:80 --name angular-jenkins nhxnnz/demo_angular'
            }
        }
    }
}
