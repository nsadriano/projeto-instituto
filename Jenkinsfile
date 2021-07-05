pipeline {
  environment {
    imagename = "nsadriano/hello-app"
    registryCredential = 'dockerthub-credentials'
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
        //sh "docker container stop flask-app 2> /dev/null"
        //sh "docker container rm -f flask-app 2> /dev/null"
        sh "docker run -d --name flask-app -p 80:80 --network=docker-stack-elk_elk $imagename:$BUILD_NUMBER"        
      }
    }
    stage('Limpando as imagens'){
      steps{
        sh "docker rmi -f $imagename:latest"
        sh "docker rmi -f $imagename:$BUILD_NUMBER"        
      }
    }
  }
}
