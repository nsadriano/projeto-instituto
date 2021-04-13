pipeline {
  environment {
    imagename = "nsadriano/hello-app"
    registryCredential = 'dockerhub-credentials'
    dockerImage = ''
  }

agent any
  stages{
    stage('Git Clone'){
      steps{
        git branch: 'main',
        credentialsId: 'registryCredential',
        url: 'https://github.com/nsadriano/projeto-instituto.git'
      }
    }
    stage('Buildind'){
      steps{
        script {
          dockerImage = docker.build imagename:env.BUILD_NUMBER
        }
      }
    }
  }
}