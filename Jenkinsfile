pipeline {
    agent {
        docker {
            image 'demo_angular'
            args '-p 8004:80'
        }
    }

    stages {
        stage('Install Packages') {
            steps {
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
                sh 'docker build -t my-angular-app .'
                sh 'docker run -d -p 8004:80 demo_angular'
            }
        }
    }
}