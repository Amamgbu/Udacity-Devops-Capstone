pipeline {
     agent any
     environment {
        registry = "amamgbu/capstone-project"
        registryCredential = 'dockerid'
        dockerImage = ''
    }
     stages {

         stage('Lint Files') {
              steps {
                  sh 'make lint'
              }
         }
         stage('Docker Build'){
             steps{
                 script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
             }
         }
         stage('Upload Image') {
            steps {
                script  {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
         stage('Remove Unused docker image') {
            steps{
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
        stage('Set Kubernetes Config'){
            steps {
                withAWS(region:'us-east-1',credentials:'aws') {
                    sh 'sudo aws eks --region us-east-1 update-kubeconfig --name kubeClusters'                    
                }
            }
        }
        stage('Deploy K8s'){
            steps{
                sh '''
                    export IMAGE="$registry:$BUILD_NUMBER"
                    sed -ie "s~IMAGE~$IMAGE~g" kubernetes/flask-container.yml
                    sudo kubectl apply -f ./kubernetes
                    '''
            }
        }         
     }
}
