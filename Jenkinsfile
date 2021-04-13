pipeline {
    agent {
       label "deploy" 
    }
    stages {
          stage("connect") {
             steps {
               script {
                   sh '''
                   make image VERSION=LTE(front-back) BRANCH=null FILE=./Dockerfile
                   make push VERSION=LTE(front-back)
                   make pull VERSION=LTE(front-back) 
                   '''
                   
               }
             }
          }
        }
}
