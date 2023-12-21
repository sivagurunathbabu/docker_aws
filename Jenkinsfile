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
                     
                "sh docker build -t web-1.0 ."
                 }
        }
    }
}