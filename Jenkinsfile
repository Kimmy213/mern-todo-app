pipeline {
    agent any

    environment {
        DOCKER_USER = 'kimmy2' 
        IMAGE_NAME  = 'finead-todo-app'
        DOCKER_CREDS = credentials('docker-hub-creds')
    }

    stages {
        stage('Containerise') {
            steps {
                echo '🐳 Building Docker Image (Dependencies will be installed inside)...'
                sh "docker build -t ${DOCKER_USER}/${IMAGE_NAME}:latest ."
            }
        }

        stage('Push') {
            steps {
                echo '🚀 Logging into Docker Hub and Pushing...'
                sh "echo \$DOCKER_CREDS_PSW | docker login -u \$DOCKER_CREDS_USR --password-stdin"
                sh "docker push ${DOCKER_USER}/${IMAGE_NAME}:latest"
            }
        }
    }
    
    post {
        always {
            sh "docker logout"
        }
    }
}