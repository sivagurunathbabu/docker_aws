    #! /bin/bash
    If [-d “docker_aws” ]; then
    rm -rf docker_aws
    fi
    git clone https://github.com/sivagurunathbabu/docker_aws.git
    cd docker_aws
    docker-compose stop
    docker-compose rm -f
    docker-compose up -d 
    docker-compose ps

