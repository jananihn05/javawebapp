pipeline {
    agent any
    stages {
        stage('checkout source-codes') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'july1-github', url: 'https://github.com/kumardutt/javawebapp.git']]])
            }
        }
        stage('build source-codes') {
            steps {
                sh 'mvn clean package'
            }   
        }
        stage('build docker-image') {
            steps {
                sh 'docker build -t artifactimage:1.0 .'
            }   
        }
        stage('push image to nexus-artifactory') {
            steps {
                withCredentials([string(credentialsId: 'nexus-july1', variable: 'nexus-july1')]) {
                    sh '3.7.71.4 login -u admin -p ${nexus-july1}'
                  }
                sh 'docker tag artifactimage:1.0 3.7.71.4:8084/artifactimage:1.0'
                sh 'docker push 3.7.71.4:8084/artifactimage:1.0'
            }   
        }
    }
}
