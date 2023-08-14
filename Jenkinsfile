def app

pipeline {
    agent any

    stages {
        stage('Start') {
            steps {
                slackSend(channel: '#slack-jenkins', color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
        }

        stage('Ready'){
            steps {
                sh "echo 'Ready to build'"
            }
        }

        stage('Build'){
            steps {
                sh "echo 'Build Spring Boot Jar'"
            }
        }

        stage('Build image'){
            steps {
                app = docker.build("211.183.3.100/web/production")
            }
        }

        stage('Push image') {
            steps {
                docker.withRegistry("http://211.183.3.100", "harbor") {
                    app.push("2.0")
                }
            }
        }

        stage('Complete') {
            steps {
                sh "echo 'The end'"
            }
        }
    }

    post {
        success {
            slackSend (
                channel: '#slack-jenkins',
                color: '#00FF00',
                message:  "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
            )
        }
        failure {
            slackSend (
                channel: '#slack-jenkins',
                color: '#FF0000',
                message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
            )
        }
    }
}
