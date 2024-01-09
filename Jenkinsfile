pipeline {
    agent none
    tools {
        jdk 'Myjava'
        maven 'mymaven'
    }
    environment {
        Build_SERVER_IP = 'ec2-user@172.168.1.14'
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
                sshagent(['Test_Server']) {
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
        
        stage('package+building docker image') {
            agent any
            steps {
              script {
                sshagent(['Build_Server']) {
                    withCredentials([usernamePassword(credentialsId: 'docker-login', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {

                  sh "scp -o StrictHostKeyChecking=no server-script.sh ${Build_SERVER_IP}:/home/ec2-user"
                  sh "ssh -o StrictHostKeyChecking=no ${Build_SERVER_IP} 'bash ~/server-script.sh'"
                  sh "ssh sudo docker build -t sandeep888/repo2:$BUILD_NUMBER /home/ec2-user/addressbook"
                  sh "ssh sudo docker login -u $USERNAME -p $PASSWORD"
                  sh "ssh sudo docker push sandeep888/repo2:$BUILD_NUMBER"
                  
                }
                }
                
                  
                  
              }  
            }
            
        }
    }
}