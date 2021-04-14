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
        sh "docker build -t $imagename:latest -t $imagename:$BUILD_NUMBER ."
      }
    }
    stage('Deploy image'){
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
          sh "docker push $imagename:latest"
          sh "docker push $imagename:$BUILD_NUMBER"
          }
        }
      }
    }
    stage('Subindo App-flask'){
      steps{
        sh "docker run -d --name flask-app -p 80:80 $imagename:$BUILD_NUMBER"        
      }
    }
  }
}