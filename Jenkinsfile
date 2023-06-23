node {
    def dockerImage
    stage('Clone repository') {
        git branch: 'main', credentialsId: 'github', url: 'https://github.com/Sotatek-VinhPham2/weather-app.git'
    }
    
/*    stage('SonarQube analysis') {
        def scannerHome = tool 'SonarScanner 4.0';
        withSonarQubeEnv('SonarQube') { // If you have configured more than one global server connection, you can specify its name
        sh "${scannerHome}/bin/sonar-scanner"
        }
    }

    stage("Quality Gate"){
        timeout(time: 1, unit: 'HOURS') {
            def qg = waitForQualityGate()
            if (qg.status != 'OK') {
                error "Pipeline aborted due to quality gate failure: ${qg.status}"
            }
        }
    }

    stage('Build image') {
       dockerImage = docker.build("vihnpalm/projects:weather-app")
    }

    stage('Test image') {
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
