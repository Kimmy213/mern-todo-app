pipeline {
    agent any

    environment {
        // เปลี่ยนเป็น username ของคุณ
        DOCKER_USER = 'kimmy2' 
        IMAGE_NAME  = 'finead-todo-app'
        DOCKER_CREDS = credentials('docker-hub-creds')
    }

    stages {
        // เราจะลบ stage 'Build' ที่รัน npm install บนเครื่อง Jenkins ออก
        // เพราะเราจะไปสั่ง build ใน Dockerfile แทน (ตามกฎ Task 3)

        stage('Containerise') {
            steps {
                echo '🐳 Building Docker Image (Dependencies will be installed inside)...'
                // คำสั่งนี้จะทำการ npm install ภายใน Container ระหว่าง build
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