pipeline {
    agent none
    tools {
        jdk 'Myjava'
        maven 'mymaven'
    }
    environment{
        TEST_SERVER_IP='ec2-user@172.168.1.149'
    }
   

    stages {
        stage('Compile') {
            agent any
            steps {
                script {
                    sh 'mvn compile'
                    echo "executed build command"
                }
            }

           
        }
        stage('UnitTest') {
            agent any
           
            steps {
                script {
                    sshagent(['Build_server']) {
                    echo "TESTING THE CODE"
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
        
        stage('package+building docker image') {
            agent any
            steps {
              script {
                  sshagent(['Build_server']) {
                    echo "Building THE CODE"
                    sh "scp -o StrictHostKeyChecking=no server-script.sh ${TEST_SERVER_IP}:/home/ec2-user"
                    sh "ssh -o StrictHostKeyChecking=no ${TEST_SERVER_IP} 'mvn package'"
                
                    }
                  
                }
                }
                
                  
                  
              }  
    } 
            
        
    }
