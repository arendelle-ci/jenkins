def app

node {
    stage('Checkout') {
            checkout scm
    }

    stage('Start') {
        slackSend(channel: '#slack-jenkins', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
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
  }
