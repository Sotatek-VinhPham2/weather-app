pipeline {
    agent any
    stages{
        stage('gitclone'){
            steps{
                git 'https://github.com/Sotatek-VinhPham2/weather-app.git'
            }
        }
        stage('build'){
            steps{
                sh 'docker build -t vihnpalm/projects:weather-app .'
            }
        }
        stage('push'){
            steps{
                withDockerRegistry(credentialsId: 'dockerhub', url: 'https://index.docker.io/v1/') {
                    sh 'docker push vihnpalm/projects:weather-app'
                }
            }
        }
    }
}
post{
    always{
        sh 'docker logout'
    }
}
