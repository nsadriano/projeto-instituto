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
    stage('Subindo ELK Stack'){
      steps{
        sh "docker run -d --name elasticsearch -p 9200:9200 bashell/alpine-elasticsearch"
        sh "docker run -d --name logstash -p 12201:12201 -l elasticsearch:elasticsearch ogstash:latest"
        sh "docker run -d --name kibana -p 5601:5601 -e ELASTICSEARCH_URL=http://elasticsearch:9200 kibana"
      }
    }
    stage('Subindo App Docker'){
      steps{
        sh "docker run -d --name flask-app -p 80:80 $imagename:$BUILD_NUMBER"
      }
    }
  }
}