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
                sh 'docker build -t artifactimage .'
            }   
        }
        stage('push image to nexus-artifactory') {
            steps { 
                sh 'docker tag artifactimage 13.233.0.28:8090/artifactimage'
                sh 'docker login -u admin -p admin 13.233.0.28:8090'
                sh 'docker push 13.233.0.28:8090/artifactimage'
            }   
        }
        stage('deploy image to k8s cluster') {
            steps { 
                kubernetesDeploy (configs: 'deployservice.yaml', kubeconfigId: 'new-kube-ver')
    }
}
    }
}
