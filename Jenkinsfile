pipeline {
  environment {
    imagename = "nsadriano/hello-app"
    registryCredential = 'dockerhub-token'
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
  }
}