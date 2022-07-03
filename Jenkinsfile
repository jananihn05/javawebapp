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
                sh 'docker tag artifactimage:1.0 52.66.241.2:8084/artifactimage:1.0'
                withCredentials([string(credentialsId: 'nexus-login', variable: '')]) {
                    sh 'docker login -u admin -p $'{nexus-login} 52.66.241.2:8084'
}
                sh 'docker push 52.66.241.2:8084/artifactimage:1.0'
            }   
        }
        stage('deploy image to k8s cluster') {
            steps { 
                kubernetesDeploy (configs: 'deployment-service.yaml', kubeconfigId: 'kubernetes-access-key')
    }
}
    }
}
