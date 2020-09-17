pipeline {
     agent any
     environment {
        registry = "amamgbu/car-classifier"
    }
     stages {

         stage('Lint Files') {
              steps {
                  sh 'make lint'
              }
         }
         stage('Docker Build'){
             steps{
                 sh 'make docker-build'
             }
         }
         stage('Upload Image') {
            steps {
                sh 'make docker-upload'
            }
        }
         stage('Remove Unused docker image') {
            steps{
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
        stage('Deploy K8s'){
            steps{
                sh 'kubectl apply -f ./kubernetes'
            }
        }         
              }
         }
     }
}
