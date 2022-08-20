pipeline{
    agent none
    tools{
        jdk 'myjava'
        maven 'mymaven'
    }
    stages{
        stage("COMPILE"){
            agent any
            steps{
                script{
                    echo "COMPILING THE CODE"
                    sh 'mvn compile'
                }
            }
        }
        stage("UNITTEST"){
            //agent {label 'linux_slave'}
            agent any
            steps{
                script{
                    echo "TESTING THE CODE"
                    sh 'mvn test'
                }
            }
            post{
                always{
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage("PACKAGE"){
            agent any
            steps{
                script{
                    echo "PACKAGING THE CODE"
                    sshagent(['BUILD_SERVER_KEY']) {
                    sh "ssh -o StrictHostKeyChecking=no ec2-user@172.31.86.175 'bash server-script1.sh'"
                    }
                }
            }
        }
    }
}