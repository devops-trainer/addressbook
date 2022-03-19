pipeline {
    agent none
    tools{
        jdk 'myJava'
        maven 'myMaven'
    }
    stages {
        stage('COMPILE') {
            agent any
            steps {
               script {
                   echo "COMPILING THE CODE"
                   git 'https://github.com/vcvishalchand/addressbook.git'
                   sh 'mvn compile'
                }
            }
        }
        stage('UNITTEST') {
            agent {label 'linux_slave'}
            steps {
               script {
                   echo "RUNNING THE UNIT TEST CASES"
                   sh 'mvn test'
                }
            }
            post{
                always{
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('PACKAGE'){     
            agent any       
            steps {
                script {
                    sshagent(['Test_server-Key']) {
                        echo "PACKAGING THE CODE"
                        sh "scp -o StrictHostKeyChecking=no server-script.sh ec2-user@172.31.14.250:/home/ec2-user"
                        sh "ssh -o StrictHostKeyCheking=no ec2-user@172.31.14.250 'bash ~/server-script.sh'"
                    }
                }
            }
        }
    }
}
