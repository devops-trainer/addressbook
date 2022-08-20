pipeline{
    agent any
    tools{
        jdk 'myjava'
        maven 'mymaven'
    }
    stages{
        stage("COMPILE"){
            steps{
                script{
                    echo "COMPILING THE CODE"
                    sh 'mvn compile'
                }
            }
        }
        stage("UNITTEST"){
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
            steps{
                script{
                    echo "PACKAGING THE CODE"
                    sh 'mvn package'
                }
            }
        }
    }
}