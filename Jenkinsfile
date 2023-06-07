node {
    def dockerImage
    stage('Clone repository') {
        git branch: 'main', credentialsId: 'github', url: 'https://github.com/Sotatek-VinhPham2/weather-app.git'
    }
    
    stage('Build image') {
       dockerImage = docker.build("vihnpalm/projects:weather-app")
    }
    
    stage('Push image') {
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
        dockerImage.push()
        }
    }
    
    stage('Deploy image') {
        sh 'docker stack deploy -c docker-compose.yml weather'
    }
}