#!/bin/bash


echo "Starting Application Deployment"

#Checks and remove old docker containers if exists
if docker container inspect devops-project >/dev/null 2>&1; then
docker stop devops-project
docker rm devops-project
fi

#run the new container
docker run -d --name devops-project -p 8081:80 devops-platform:v1

#check if website response
if curl -fsS http://localhost:8081/ > /dev/null; then
	echo "Deployment successful!"
else
	echo "Deployment failed"
	exit 
fi
