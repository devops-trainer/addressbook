pipeline {
    agent any
    parameters {
        string(name:'Env',defaultValue:'Test',description:'deployed to mentioned environment')
        booleanParam(name:'executetest',defaultValue:true,description:'Test is executed')
        choice(name:'Appversion',choices:['1.1','1.2','1.3'])
    }
    stages {
        stage('Build') {
            steps {
              script {
                  echo "Building the code"
                  echo "deploying to environment: ${params.Env}"
              }  
            }
        }
        stage('UnitTest') {
            when {
                expression {
                    params.executetest == true
                }
            }
            steps {
              script {
                  echo "Testing the code"
              }  
            }
        }
        stage('package') {
            steps {
              script {
                  echo "Deploy the application"
                  echo "Deplot the Appversion: ${params.Appversion}"
              }  
            }
            
        }
    }
}