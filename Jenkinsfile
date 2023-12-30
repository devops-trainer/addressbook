pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
              script {
                  echo "Building the code"
              }  
            }
        }
        stage('UnitTest') {
            steps {
              script {
                  echo "Testing the code"
              }  
            }
        }
        stage('package') {
            steps {
              script {
                  echo "Deploy the application"
              }  
            }
            
        }
    }
}