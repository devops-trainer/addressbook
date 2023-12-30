pipeline {
    agent any
    parameters {
        string(name:'Env',defaultValue:'Test',description:'deployed to mentioned environment')
        booleanParam(name:'executetest',defaultValue:true,description:'Test is executed')
        choice(name:'Appversion',choices:['1.1','1.2','1.3'])
    }
    environment {
        NEW_VERSION = '2.1'
    }
    stages {
        stage('Build') {
            input {
                message "select the appversion"
                ok "version selected"
                parameters {
                    choice(name:'appversion',choices:['1.1','1.2','1.3'])
                }
            }
            steps {
              script {
                  echo "Building the code"
                  echo "deploying to environment: ${params.Env}"
                  echo "our newversion is: ${NEW_VERSION}"
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