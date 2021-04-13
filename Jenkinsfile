pipeline {
  environment {
    imagename = "nsadriano/hello-app"
    registryCredential = 'github-credentials'
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
        sh "docker buil -t $imagename:latest -t $imagename:$BUILD_NUMBER ."
      }
    }
    stage('Deploy image'){
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
          dockerImage.push("$BUILD_NUMBER")
          dockerImage.push('latest')
          }
          }
        }
    }
  }
}