pipeline {
    agent none
    tools {
        jdk 'Myjava'
        maven 'mymaven'
    }
    
    stages {
        stage('Compile') {
            agent any
            steps {
              script {
                  echo "Building the code"
                  sh 'mvn compile'
                  
              }  
            }
        }
        stage('UnitTest') {
            agent any
            steps {
              script {
                  echo "Testing the code"
                  sh 'mvn test'
              }  
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        
        stage('package') {
            agent {label 'linux_slave'}
            steps {
              script {
                  echo "Deploy the application"
                  sh 'mvn package'
                  
              }  
            }
            
        }
    }
}