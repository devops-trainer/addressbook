pipeline {
    agent none
    tools {
        jdk 'Myjava'
        maven 'mymaven'
    }
    environment {
        TEST_SERVER_IP = 'ec2-user@172.168.1.14'
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
            sshagent(['Test_Server']) {
            steps {
              script {
                  echo "Testing the code"
                  sh "scp -o StrictHostKeyChecking=no server-script.sh ${TEST_SERVER_IP}:/home/ec2-user"
                  sh "ssh -o StrictHostKeyChecking=no ${TEST_SERVER_IP} 'bash ~/server-script.sh'"
                  
              }  
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