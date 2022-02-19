pipeline {
    agent any
    parameters{
        string(name:'ENV',defaultValue:'Test',description:'version to deploy')
        boolenParam(name:'ExecuteTests',defaultValue:true,description:'decide the run to tc')
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
                    echo"Teesting the code"
                }
            }
        }
        stage('Deploy'){
            steps {
                script{
                    echo"Deploying the code"
                    echo "Deploying to env: ${params.ENV}"                   
                }
            }
        }
    }
}