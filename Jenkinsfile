pipeline {
    agent {label "aws-label" }
    // agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "mvn_3.9.6"
    }

    stages {
        stage('Checkout') {
            steps {
                // Get some code from a GitHub repository
                // git 'https://github.com/sivagurunathbabu/webapp.git'
                
                checkout scm

                }


           
        }

        stage('Build') {
           steps {
                     
                sh "sudo docker build -t web-1.0 ."
                 }
        }

        stage('Docker Push') {
           steps {

               withCredentials([string(credentialsId: 'docker-hub-id', variable: 'docker-hub-id')]) {
                sh " sudo docker login -u sivaguruaws -p ${docker-hub-id} "
                    sh "sudo docker push sivaguruaws/aws:web.1.0"
                }
                
             }
        }
      
    }
}
