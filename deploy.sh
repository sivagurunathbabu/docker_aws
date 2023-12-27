    #! /bin/bash
    if [ -d “docker_aws” ]; then rm -rf docker_aws
    fi
    git clone https://github.com/sivagurunathbabu/docker_aws.git
    cd docker_aws
    sudo docker-compose stop
    sudo docker-compose rm -f
    sudo docker-compose up -d 
    sudo docker-compose ps

