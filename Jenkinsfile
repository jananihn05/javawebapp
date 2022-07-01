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
        stage('move artifact') {
            steps {
                sh 'mv /var/lib/jenkins/workspace/july1/target/SimpleWebApplication.war /home/ec2-user'
            }   
        }
    }
}
