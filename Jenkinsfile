pipeline {
  environment {
    imagename = "nsadriano/hello-app"
    registryCredential = 'dockerhub-token'
    dockerImage = ''
  }

agent any
  stages{
    stage('Git Clone'){
      git([url: 'https://github.com/nsadriano/projeto-instituto.git', branch: 'main', credentialsId: 'registryCredential'])
    }
  }
}