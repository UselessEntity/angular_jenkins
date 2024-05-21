pipeline {
    agent {
        docker {
            image 'nhxnnz/demo_angular'
            args '-p 8004:80'
        }
    }

    stages {
        stage('Install Packages') {
            steps {
                sh 'npm install'
                sh 'npm ci'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build -- --output-path=./dist'
            }
        }

        stage('Test') {
            steps {
                sh 'npm run test'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker build -t nhxnnz/demo_angular.'
                sh 'docker run -d -p 8004:80 nhxnnz/demo_angular'
            }
        }
    }
}