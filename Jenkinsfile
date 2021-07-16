pipeline{
    agent any
    tools {
        maven 'maven'
    }
    environment {
      DOCKER_TAG = gitVersion()
    }
    stages{
        stage('Git Checkout'){
            steps{
                git credentialsId: 'github', 
                url: 'https://github.com/mthall-DevOps/myweb.git'
            }
        }
        stage('Maven Build'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('Docker Build'){
            steps{
                sh 'docker build . -t mani2595/webapp:${DOCKER_TAG}'
            }
        }
        stage('Docker Push'){
            steps{
            withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubpwd', usernameVariable: 'dockerhubuser')]) {
            sh 'docker login -u ${dockerhubuser} -p ${dockerhubpwd}'
            }
                sh 'docker push mani2595/webapp:${DOCKER_TAG}'
            }
        }
        stage('Docker container'){
            steps{
                sh 'docker run -itd -p 8080:8080 mani2595/webapp:${DOCKER_TAG}'
            }
        }

    }
}

def gitVersion(){
def commitHash = sh returnStdout: true, script: 'git rev-parse --short HEAD'
return commitHash
}