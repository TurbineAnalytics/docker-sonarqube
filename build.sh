#!/bin/bash

set -euo pipefail

docker build -t turbineanalytics/sonarqube:5.6.6 5.6.6
docker build -t turbineanalytics/sonarqube:5.6.6-alpine 5.6.6-alpine
docker build -t turbineanalytics/sonarqube:6.4 6.4
docker build -t turbineanalytics/sonarqube:6.4-alpine 6.4-alpine

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker push turbineanalytics/sonarqube:6.4-alpine
