pipeline {
    agent any
    parameters {
        string(name: 'ENV', defaultValue: 'Test', description: 'version to deploy')
        booleanParam(name: 'ExecuteTests', defaultValue: true, description: 'decide to run tc')
        choice(name: 'APPVERSION', choice: ['1.1', '1.2', '1.3'])
    }
    stages {
        stage('Build') {
            steps {
               script {
                   echo "Building the code"
                }
            }
        }
        stage('Test') {
            when {
                expression {
                    params.ExecuteTests == true
                }
            }
            steps {
               script {
                   echo "Testing the code"
                }
            }
        }
        stage('Deploy'){
            steps {
                script{
                    echo "Deploying the app"
                    echo "Deploying to env: ${params.ENV}"
                    //echo "Deploying to env: ${params.APPVERSION}"
                }
            }
        }
    }
}
