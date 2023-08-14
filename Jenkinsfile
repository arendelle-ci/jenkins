pipeline {
    def app
    agent none
    options { skipDefaultCheckout(true) }
    stages {
        stage('Start') {
            agent any
            steps {
                slackSend (channel: '#slack-jenkins', color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
        }
        
        stage('Build image') {
            agent any
            steps {
                app = docker.build("211.183.3.100/web/production")
            }
        }
        stage('Push image') {
            agent any
            steps {
				docker.withRegistry("http://211.183.3.100", "harbor") {
                    app.push("2.0")
                }
            }
        }
    }
    post {
        success {
            slackSend (channel: '#slack-jenkins', color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
        failure {
            slackSend (channel: '#slack-jenkins', color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
    }
}
