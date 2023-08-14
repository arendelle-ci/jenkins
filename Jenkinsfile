def app

node {
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
        app = docker.build("211.183.3.100/web/canary")
    }

    stage('Push image') {
        docker.withRegistry("http://211.183.3.100", "harbor") {
            app.push("1.0")
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
    stage('Complete') {
        sh "echo 'The end'"
    } 
  }
