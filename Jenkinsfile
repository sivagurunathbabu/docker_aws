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
                     
                sh "sudo docker build -t web ."
                sh "sudo docker tag web sivaguruaws/web:web1.0"
                sh "sudo docker tag web:latest 851131988743.dkr.ecr.ap-south-1.amazonaws.com/web:latest"
                 }
        }

        stage('Docker Push') {
           steps {
               withCredentials([string(credentialsId: 'docker_hub_id', variable: 'docker_hub_id')]) {
                sh " sudo docker login -u sivaguruaws -p ${docker_hub_id} "
                    sh "sudo docker push sivaguruaws/web:web1.0"
                }
                
             }
        }

        // stage('ECR Push') {
        //    steps {
        //        withCredentials([[
        //             $class: "AmazonWebServicesCredentialsBinding",
        //             credentialsId: "awscred",
        //             accessKeyVariable: "AWS_ACCESS_KEY_ID",
        //             secretKeyVariable: "AWS_SECRET_ACCESS_KEY"
        //         ]])  {
        //         sh " sudo aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 851131988743.dkr.ecr.ap-south-1.amazonaws.com"
        //         sh "sudo docker push 851131988743.dkr.ecr.ap-south-1.amazonaws.com/web:latest"
        //         }
                
        //      }
        // }


        stage('Deploy') {
           steps {
               sshagent(credentials: ['ubuntu']) {
                //    sshagent(credentials: ['8cc32970-f74f-4e38-ab8c-b188c1bb6196']) {
               sh 'scp -o StrictHostKeyChecking=no deploy.sh ubuntu@172.31.45.85:/tmp'
               sh 'ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.45.85 sh /tmp/deploy.sh'

                }
             }
        }
        
      
    }
}
