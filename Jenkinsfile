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
                    sh 'mvn package'
                }
            }
        }
    }
}