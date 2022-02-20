pipeline {
    agent any
    stages {
        stage('COMPILE') {
            steps {
               script{
                    echo "COMPILING THE CODE"
                    git  clone 'https://github.com/Sasi0903/addressbook-1.git'
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
        }
        stage('PACKAGE'){
            steps{
                script{
                    echo "PACKAGING THE CODE"
                    sh 'mvn package'
                }
            }
        }
        
    }
}