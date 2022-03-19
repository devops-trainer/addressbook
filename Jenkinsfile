pipeline {
    agent any
    tools{
        jdk 'myjava'
        maven 'mymaven'
    }
    stages {
        stage('COMPILE') {
            steps {
               script {
                   echo "COMPILING THE CODE"
                   git 'https://github.com/vcvishalchand/addressbook.git'
                   sh 'mvn compile'
                }
            }
        }
        stage('UNITTEST') {
            steps {
               script {
                   echo "RUNNING THE UNIT TEST CASES"
                   sh 'mvn test'
                }
            }
        }
        stage('Package'){            
            steps{
                script{
                    echo "PACKAGING THE CODE"
                    sh 'mvn package'
                }
            }
        }
    }
}
