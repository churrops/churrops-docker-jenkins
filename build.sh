#!/bin/bash

repository_url="XXXXXXXXXXXXXX"
tag_jenkins="2.128-alpine"
tag_nodejs="9.11.1-alpine"
tag_php="fpm-alpine"
tag_php56="5-fpm-alpine"
build_dir="build"

$(aws ecr get-login --no-include-email --region sa-east-1)

# Jenkins Master
docker build -t jenkins-master:$tag_jenkins -t jenkins-master:latest build/jenkins-master/
docker tag jenkins-master:$tag_jenkins $repository_url/jenkins-master:$tag_jenkins 
docker tag jenkins-master:$tag_jenkins $repository_url/jenkins-master:latest
docker push $repository_url/jenkins-master:$tag_jenkins 
docker push $repository_url/jenkins-master:latest

# Slave NodeJS
docker build -t jenkins-slave-nodejs:$tag_nodejs -t jenkins-slave-nodejs:latest build/jenkins-slave-nodejs/
docker tag jenkins-slave-nodejs:$tag_nodejs $repository_url/jenkins-slave-nodejs:$tag_nodejs 
docker tag jenkins-slave-nodejs:$tag_nodejs $repository_url/jenkins-slave-nodejs:latest
docker push $repository_url/jenkins-slave-nodejs:$tag_nodejs 
docker push $repository_url/jenkins-slave-nodejs:latest

# Slave PHP
docker build -t jenkins-slave-php:$tag_php -t jenkins-slave-php:latest build/jenkins-slave-php/
docker tag jenkins-slave-php:$tag_php $repository_url/jenkins-slave-php:$tag_php 
docker tag jenkins-slave-php:$tag_php $repository_url/jenkins-slave-php:latest
docker push $repository_url/jenkins-slave-php:$tag_php 
docker push $repository_url/jenkins-slave-php:latest

# Slave PHP56
docker build -t jenkins-slave-php56:$tag_php56 -t jenkins-slave-php56:latest build/jenkins-slave-php56/
docker tag jenkins-slave-php56:$tag_php56 $repository_url/jenkins-slave-php56:$tag_php56 
docker tag jenkins-slave-php56:$tag_php56 $repository_url/jenkins-slave-php56:latest
docker push $repository_url/jenkins-slave-php56:$tag_php56 
docker push $repository_url/jenkins-slave-php56:latest
