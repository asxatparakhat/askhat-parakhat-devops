pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Parakhat'
        STUDENT_SURNAME = 'Askhat'
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
                sh 'chmod +x app/app.sh scripts/Askhat_Parakhat_system.sh'
            }
        }
        stage('Test') {
            steps {
                sh 'sh -n app/app.sh'
                sh 'test -f Dockerfile'
                sh './scripts/Askhat_Parakhat_system.sh'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t askhat-parakhat-devops .'
            }
        }
        stage('Docker Run') {
            steps {
                sh 'docker rm -f askhat-parakhat-container || true'
                sh '''docker run --name askhat-parakhat-container \
                  -e STUDENT_NAME=$STUDENT_NAME \
                  -e STUDENT_SURNAME=$STUDENT_SURNAME \
                  -e STUDENT_GROUP=$STUDENT_GROUP \
                  -e STUDENT_ID=$STUDENT_ID \
                  askhat-parakhat-devops'''
                sh 'docker images askhat-parakhat-devops'
                sh 'docker ps -a --filter name=askhat-parakhat-container'
            }
        }
    }

    post {
        success { echo 'Pipeline finished successfully' }
        failure { echo 'Pipeline failed' }
    }
}
