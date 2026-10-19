pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Askhat'
        STUDENT_SURNAME = 'Parakhat'
        STUDENT_GROUP   = 'IT2-2301'
        STUDENT_ID      = '41534'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --oneline'
            }
        }
        stage('Build') {
            steps {
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
                sh 'chmod +x app/app.sh scripts/Parakhat_Askhat_system.sh'
            }
        }
        stage('Test') {
            steps {
                sh 'sh -n app/app.sh'
                sh 'test -f Dockerfile'
                sh './scripts/Parakhat_Askhat_system.sh'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t parakhat-askhat-devops .'
            }
        }
        stage('Docker Run') {
            steps {
                sh 'docker rm -f parakhat-askhat-container || true'
                sh '''docker run --name parakhat-askhat-container \
                  -e STUDENT_NAME=$STUDENT_NAME \
                  -e STUDENT_SURNAME=$STUDENT_SURNAME \
                  -e STUDENT_GROUP=$STUDENT_GROUP \
                  -e STUDENT_ID=$STUDENT_ID \
                  parakhat-askhat-devops'''
                sh 'docker images parakhat-askhat-devops'
                sh 'docker ps -a --filter name=parakhat-askhat-container'
            }
        }
    }

    post {
        success { echo 'Pipeline finished successfully' }
        failure { echo 'Pipeline failed' }
    }
}
