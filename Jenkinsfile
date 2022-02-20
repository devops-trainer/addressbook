pipeline {
    agent any
    stages {
        stage('COMPILE') {
            steps {
               script{
                    echo "COMPILING THE CODE"
                    git 'https://github.com/Sasi0903/addressbook-1.git'
                    sh 'mvn compile'
                }
            }
        }
        stage('UNITTEST') {
            steps {
                script{
                    echo"RUNING THE UNIT TESTCASES"
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
            steps{
                script{
                    sshagent(['Test_Server-key']){
                        echo "PACKAGING THE CODE"
                        sh "scp -o StrictHostkeyChecking=no ServerScrpit.sh ec2-user@172.31.36.19:/home/ec2-user"
                        sh "ssh -o StrictHostkeyChecking=no ec2-user@172.31.36.19 'bash ~/ServerScrpit.sh'"
                    }
                    
                }
            }
        }
        
    }
}