pipeline {
    agent none
    tools {
        jdk 'Myjava'
        maven 'mymaven'
    }
    environment {
        Build_SERVER_IP = 'ec2-user@172.168.1.218'
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
                sshagent(['Build_server']) {
                    withCredentials([usernamePassword(credentialsId: 'docker-login', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {

                  echo "packing the application"
                  sh "scp -o StrictHostKeyChecking=no server-script.sh ${Build_SERVER_IP}:/home/ec2-user"
                  sh "ssh -o StrictHostKeyChecking=no ${Build_SERVER_IP} 'bash ~/server-script.sh'"
                  sh "ssh ${Build_SERVER_IP} sudo docker build -t ${IMAGE_NAME} /home/ec2-user/addressbook"
                  sh "ssh ${Build_SERVER_IP} sudo docker login -u $USERNAME -p $PASSWORD"
                  sh "ssh ${Build_SERVER_IP} sudo docker push ${IMAGE_NAME}"
                  
                }
                }
                
                  
                  
              }  
            }
            
        }
    }
}