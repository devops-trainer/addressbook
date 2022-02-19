pipeline {
    agent any
    parameters{
        string(name:'ENV',defaultValue:'Test',description:'version to deploy')
        booleanParam(name:'ExecuteTests',defaultValue:true,description:'decide the run to tc')
        choice(name:'APPVERSION',choices:['1.1','1.2','1.3'])
    }
    stages {
        stage('Build') {
            steps {
               script{
                    echo "Buliding the code"
                }
            }
        }
        stage('Test') {
                when{
                    expression{
                        params.ExecuteTests == true
                    }
                }
            steps {
                script{
                    echo"Testing the code"
                }
            }
        }
        stage('Deploy'){
            steps {
                script{
                    echo"Deploying the app"
                    echo "Deploying the app to ENV: ${params.ENV}"      
                    echo "Deploying the app version: ${params.APPVERSION}"             
                }
            }
        }
    }
}