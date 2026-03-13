pipeline {
    agent any

    tools {
        nodejs 'node20' // ชื่อต้องตรงกับที่ตั้งในเมนู Tools นะครับ
    }

    environment {
        DOCKER_USER = 'kimmy2' // แก้ตรงนี้
        IMAGE_NAME  = 'finead-todo-app'
        // ดึง Credential ที่เราสร้างไว้ใน Step 3 มาใช้แบบปลอดภัย
        DOCKER_CREDS = credentials('docker-hub-creds')
    }

    stages {
        stage('Build') {
            steps {
                echo '📦 Installing dependencies...'
                sh 'npm install' 
                // หมายเหตุ: ถ้าในโปรเจกต์มีแยกโฟลเดอร์ย่อย 
                // ให้ใช้ 'cd backend && npm install' แทน
            }
        }

        stage('Containerise') {
            steps {
                echo '🐳 Building Docker Image...'
                sh "docker build -t ${DOCKER_USER}/${IMAGE_NAME}:latest ."
            }
        }

        stage('Push') {
            steps {
                echo '🚀 Pushing to Docker Hub...'
                // ล็อกอินโดยใช้รหัสจาก Credentials Provider
                sh "echo \$DOCKER_CREDS_PSW | docker login -u \$DOCKER_CREDS_USR --password-stdin"
                sh "docker push ${DOCKER_USER}/${IMAGE_NAME}:latest"
            }
        }
    }

    post {
        always {
            sh "docker logout" // ล็อกเอาท์ทุกครั้งหลังจบงานเพื่อความปลอดภัย
        }
    }
}