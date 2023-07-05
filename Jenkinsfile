node {
    def dockerImage
    stage('Clone repository') {
        git branch: 'main', credentialsId: 'github', url: 'https://github.com/Sotatek-VinhPham2/weather-app.git'
    }
    
    stage('SonarQube analysis') {
        script{
        def scannerHome = tool 'sonarscan';
        withSonarQubeEnv('sonarqube') {
            sh "${tool("sonarscan")}/bin/sonar-scanner \
                -Dsonar.projectKey=weather-app \
                -Dsonar.projectName=weather-app"
        }
        }
    }

    stage('Build image') {
       dockerImage = docker.build("vihnpalm/projects:weather-app")
    }

    /* stage('Test image') {
        sh 'docker run vihnpalm/projects:weather-app npm run test'
    } */
    
    stage('Push image') {
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
        dockerImage.push()
        }
    }
    
    stage('Deploy image') {
        sh 'docker stack deploy -c docker-compose.yml weather'
    }
}
