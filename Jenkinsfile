def app

node {
    stage('Start') {
            agent any
            steps {
                slackSend (channel: '#slack-jenkins', color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
    }
    stage('Checkout') {
            checkout scm
    }

    stage('Ready'){
        sh "echo 'Ready to build'"
    }

    stage('Build'){
        sh "echo 'Build Spring Boot Jar'"
    }

    stage('Build image'){
        app = docker.build("211.183.3.100/web/production")
    }

    stage('Push image') {
        docker.withRegistry("http://211.183.3.100", "harbor") {
            app.push("2.0")
        }
    }

    stage('Complete') {
        sh "echo 'The end'"
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
