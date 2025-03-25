#!/bin/bash

#Pull the latest rules to local dir
git pull https://github.com/elastic/detection-rules.git

#Build the docker image and configure for rule execution
docker build -f Dockerfile -t elastic-rules:latest

docker compose -f docker-compose.yml up -d

docker exec -it elastic-detection-rules /bin/bash