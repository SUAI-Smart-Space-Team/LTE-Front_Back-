pipeline {
    agent {
       label "deploy2" 
    }
    stages {
          stage("connect") {
             steps {
               script {
                   sh '''
                   make image VERSION=front-back BRANCH=null FILE=./Dockerfile
                   make push VERSION=front-back
                   make pull VERSION=front-back 
                   '''
                   
               }
             }
          }
        }
}
