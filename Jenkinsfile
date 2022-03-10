pipeline {
    environment {
        registry = "cybernonk404/devops_node_test"
        registryCredential = 'MyDocker'
        dockerImage = ''
    }
    
    agent any

    stages {
        stage('Preparation') {
            steps {
                echo 'Clone Git Repo'
                git branch: 'main', credentialsId: 'MyGitHub', url: 'https://github.com/Cybernonk404/devops_nodejs.git'
            }
        }
        
        stage('Test') {
            steps {
                echo 'Node JS Test'
            }
        }
        
        stage('Build and push to registry') {
            steps {
                echo 'Docker Build Image'
                sh 'sudo docker build --tag helloworld:$BUILD_NUMBER .'
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploy to Azure as Docker Container'
                sh '''sudo docker stop helloworld && docker rm helloworld
                sudo docker run --name helloworld -p 1337:1337 helloworld:$BUILD_NUMBER node /home/node/app/index.js &'''
            }
        }
    }
}