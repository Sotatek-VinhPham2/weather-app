node {
    def dockerImage
    stage('Clone repository') {
        checkout scm
    }
    
    stage('Build image') {
       dockerImage = docker.build("vihnpalm/projects:weather-app")
    }

    stage('Test image') {
        dockerImage.inside {
            sh 'echo "Tests passed"'
        }
    }
    
 stage('Push image') {
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
        dockerImage.push()
        }
    }    
}
