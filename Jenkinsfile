pipeline {
  stages{ 
    stage('checkout') {
      steps {
         checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'commit-based-git', url: 'https://github.com/kumardutt/javawebapp.git']]])      
            }
                      }
    agent any
  }
}
