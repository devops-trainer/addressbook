pipeline {
    agent any
    tools {
        jdk 'Myjava'
        maven 'mymaven'
    }
    
    stages {
        stage('Compile') {
            
            steps {
              script {
                  echo "Building the code"
                  sh 'mvn compile'
                  
              }  
            }
        }
        stage('UnitTest') {
            
            steps {
              script {
                  echo "Testing the code"
                  sh 'mvn test'
              }  
            }
        }
        stage('package') {
            
            steps {
              script {
                  echo "Deploy the application"
                  sh 'mvn package'
                  
              }  
            }
            
        }
    }
}