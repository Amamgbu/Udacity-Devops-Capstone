pipeline {
     agent any
     stages {

        stage('Build and Configure K8s cluster') {
            steps{
                withAWS(region:'us-west-1a', credentials:'aws') {
                    sh 'make create-and-configure'
                } 
            }
        }
        }         
              }
        