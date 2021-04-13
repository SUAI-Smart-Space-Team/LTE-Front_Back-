pipeline {
    agent {
       label "deploy" 
    }
    stages {
          stage("connect") {
             steps {
               script {
                   sh '''
                   make image VERSION=LTE_front-back BRANCH=null FILE=./Dockerfile
                   make push VERSION=LTE_front-back
                   make pull VERSION=LTE_front-back 
                   '''
                   
               }
             }
          }
        }
}
