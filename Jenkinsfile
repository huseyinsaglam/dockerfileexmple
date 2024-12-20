pipeline {
    agent any

    tools{
        jdk 'JDK17'
        maven 'Maven3'

    }

    stages {
        stage('Build Maven') {
            steps {
               checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/huseyinsaglam/dockerfileexmple']])
               bat 'mvn clean install'
            }
        }

        stage('Docker Image') {
            steps {

                 bat 'docker build  -t    hsaglam/my-application  .'

            }
        }

        stage('Docker Image to DockerHub') {
            steps {
                script{
                 withCredentials([usernameColonPassword(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                     bat 'echo docker login -u hsaglam -p ${dockerhub}'
                     bat 'docker image push hsaglam/my-application:latest'
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
           steps {
                script{
                    kubernetesDeploy (configs: 'deployment-service.yml', kubeconfigId: 'kubernetes')
                }
            }
        }

        stage('Docker Image to Clean') {
           steps {
                script{
                     bat 'docker image prune -f'
                }
            }
        }

    }
}
