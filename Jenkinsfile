pipeline {
    agent none
    tools {
        jdk 'Myjava'
        maven 'mymaven'
    }
    environment {
        Build_SERVER_IP = 'ec2-user@172.168.1.149'
        IMAGE_NAME = 'sandeep888/repo2:$BUILD_NUMBER'
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
                 sh "mvn test"
                  
                
              }  
            }
            
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        
        stage('package+building docker image') {
            agent any
            steps {
              script {
                 echo "Building the code"
                  sh 'mvn package'
                  
                }
                }
                
                  
                  
              }  
            
            
        
    }
}