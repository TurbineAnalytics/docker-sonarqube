#!/bin/bash

set -euo pipefail

docker build -t turbineanalytics/sonarqube:5.6.6
docker build -t turbineanalytics/sonarqube:5.6.6-alpine
docker build -t turbineanalytics/sonarqube:6.4
docker build -t turbineanalytics/sonarqube:6.4-alpine

docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker push turbineanalytics/sonarqube:6.4-alpine
