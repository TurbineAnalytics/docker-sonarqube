#!/bin/bash

set -euo pipefail

docker build -t turbineanalytics/sonarqube:6.7.1-alpine 6.7.1-alpine

docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker push turbineanalytics/sonarqube:6.7.1-alpine